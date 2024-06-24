<script setup lang="ts">
import { ref } from "vue";
import chevronUp from "../../assets/icons_svg/Chevron-up.svg";

/**
 * Custom dropdown input field.
 * @displayName input-dropdown
 */

const props = defineProps({
  /**
   * Text contained within the top of the dropdown.
   */
  labelText: {
    type: String,
    required: true,
  },
  /**
   * Chosen placeholder value, not necessarily part of the valueGroup.
   */
  placeHolderValue: {
    type: String,
    default: "",
  },
  /**
   * Group of values to be selected within the dropdown.
   */
  valueGroup: {
    type: Array<any>,
    required: true,
  },
  /**
   * Group of names to serve as placeholders for valueGroup, if its length does not match the
   * valueGroup's the value will be swapped for the valueGroup's values capitalized.
   */
  valueNames: {
    type: Array<String>,
    default: [],
  },
  /**
   * Value selected to be displayed in the dropdown's field, the actual value being given through
   * methods
   */
  selectedValue: {
    type: String,
    default: "",
  },
  /**
   * Additional function to be called whenever an option is selected
   */
  onSelect: {
    type: Function,
  },
  /**
   * Indicates whether the choice made is erroneous
   */
  isError: {
    type: Boolean,
    default: false,
  },
  /**
   * Controls whether the dropdown is open by default
   */
  isOpen: {
    type: Boolean,
    default: false,
  },
});

// Setting ref values
let isDropdownOpen = ref(props.isOpen);
let selectedValue = ref(props.placeHolderValue);
let selectedValueIndex = ref(props.valueGroup.indexOf(props.selectedValue));
let hasBeenOpenedViaClick = ref(false);

// Providing the displayed strings using either the valueNames provided or the capitalized-string version of the valueGroup's contents
let defaultValueNames: Array<string> =
  props.valueNames.length > 0 && props.valueGroup.length
    ? props.valueNames
    : props.valueGroup.map(
        (x) => x.toString()[0].toUpperCase() + x.toString().slice(1)
      );

// Emitter, allows to pass the selected option's value to parent components
const emit = defineEmits<{ emittedSelectedInput: [value: any] }>();

// Called upon selecting a value, changes the value emitted and calls the onSelect function if it exists
const onSelectValue = (value: String) => {
  if (props.onSelect) {
    props.onSelect();
  }
  selectedValue.value = value as string;
  emit("emittedSelectedInput", value);
  defineSelectedElementIndex(value as string);
};

// Opens or closes the dropdown
const onToggleOpen = () => {
  isDropdownOpen.value = !isDropdownOpen.value;
  hasBeenOpenedViaClick.value = !hasBeenOpenedViaClick.value;
};

// Opens or closes the dropdown if the user clicks outside of the component
const onClickOutside = () => {
  if (hasBeenOpenedViaClick.value) {
    hasBeenOpenedViaClick.value = !hasBeenOpenedViaClick.value;
    isDropdownOpen.value = !isDropdownOpen.value;
  }
};

// Changes the selected element's index to help with display
const defineSelectedElementIndex = (value: string) => {
  selectedValueIndex.value = props.valueGroup.indexOf(value);
};

const classList = [
  "input__border-background",
  "input__container-flex",
  "input__label-style",
  "dropdown",
];
</script>

<template>
  <section
    @click="onToggleOpen"
    @keypress.enter="onToggleOpen"
    v-click-outside="onClickOutside"
    :class="[classList, props.isError ? 'input__error' : '']"
    tabindex="0"
  >
    <div :class="'dropdown_container'">
      <input
        :value="defaultValueNames[props.valueGroup.indexOf(selectedValue)]"
        :placeholder="props.placeHolderValue"
        class="input__text input__no-border-background input_button"
        type="text"
        id="dropdown-text"
        readonly
      />
      <figure>
        <img
          :src="chevronUp"
          :class="isDropdownOpen ? 'opened' : 'closed'"
          alt="dropdown_content_visibility_option"
        />
      </figure>
    </div>

    <label class="dropdown-label" for="dropdown-text">{{
      props.labelText
    }}</label>

    <Transition>
      <div :class="'dropdown-list'" v-if="isDropdownOpen">
        <div
          class="dropdown-element"
          tabindex="0"
          v-for="(item, index) in props.valueGroup"
          @keypress.enter="onSelectValue(item)"
          :key="index"
        >
          <span @click="onSelectValue(item)">{{
            defaultValueNames[index]
          }}</span>
        </div>
      </div>
    </Transition>
  </section>
</template>

<style scoped lang="scss">
.input__error {
  border: 1px solid red;
}

.input__error:after {
  content: "Please choose a valid option.";
  position: absolute;
  bottom: 0%;
  left: 30%;
  font-size: 0.8rem;
  font-weight: 900;
  color: red;
}

.input_button {
  flex: 1;
  cursor: pointer;
}

.opened {
  transform: rotate(0deg);
  transition-duration: 0.5s;
}

.closed {
  transform: rotate(180deg);
  transition-duration: 0.5s;
}

.dropdown-label {
  margin-top: -1rem;
  font-size: 0.8rem;
}

.dropdown-list {
  background-color: white;
  position: absolute;
  width: 85%;
  max-height: 8.5rem;
  overflow-y: auto;
  z-index: 1;
  margin-top: 10px;
  padding: 0 1rem 1rem 1rem;
  border-radius: 0 0 2rem 2rem;
  box-shadow: $dark-color 0px 25px 20px -10px;

  @supports selector(::-webkit-scrollbar) {
    &::-webkit-scrollbar {
      width: 20px;
    }

    &::-webkit-scrollbar-thumb {
      padding: 0 5px;
      border-right: 5px solid transparent;
      border-left: 5px solid transparent;
      background-clip: padding-box;
      border-radius: 0.6rem;
      background-color: #d8d8d8;
    }

    &::-webkit-scrollbar-thumb:hover {
      background-color: $background-color-theme-secondary;
    }
  }

  @supports not selector(::-webkit-scrollbar) {
    scrollbar-width: 8px;
    scrollbar-color: $background-color-theme-secondary transparent;
  }
}

.dropdown-element {
  padding: 0.3rem;
  border-top: 1px solid $option-separator;
  display: block;
  font-family: "SF-compact-Rounded";
}

.dropdown-element:hover {
  cursor: pointer;
}

.dropdown-element:hover span {
  background-color: $option-hover-color-passive;
}

.dropdown-element:focus span {
  background-color: $option-hover-color-active;
}

.dropdown-element:focus {
  border: 1px solid red;
}

.dropdown-element span {
  display: block;
  width: 90%;
  padding: 0.7rem;
  border-radius: 0.3rem;
}

.v-enter-active,
.v-leave-active {
  max-height: 8.5rem;
  transition: 0.2s ease-out;
}

.v-enter-from,
.v-leave-to {
  max-height: 0rem;
  opacity: 0;
}

.dropdown {
  display: block;
  margin-bottom: 1rem;
  cursor: pointer;
}

.dropdown_container {
  display: flex;
}
</style>
