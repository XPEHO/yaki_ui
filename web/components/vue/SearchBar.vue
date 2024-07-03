<script setup lang="ts">
import { defineProps } from "vue";
import searchIcon from "../../assets/icons_svg/Search.svg";

const props = defineProps({
  labelText: {
    type: String,
    required: false,
  },
  placeHolder: {
    type: String,
    required: true,
  },
  onInput: {
    type: Function,
    required: true,
  },
});

const onSearchBarUse = (event: Event) => {
  props.onInput((event.target as HTMLInputElement).value);
};
</script>

<template>
  <section>
    <p v-if="labelText">{{ labelText }}</p>
    <div>
      <input
        @input="onSearchBarUse"
        :placeholder="placeHolder"
        class="input__text input__no-border-background"
        type="text"
        id="input-text"
      />
      <img
        :src="searchIcon"
        alt=""
      />
    </div>
  </section>
</template>

<style scoped lang="scss">
section {
  position: relative;
  width: 100%;
  display: flex;
  flex-flow: column nowrap;
  align-items: flex-start;
  justify-content: flex-start;
  padding-left: 1.5rem;

  & > p {
    font-size: 12pt;
    padding-left: 1rem;
    margin-bottom: 0.5rem;
    font-family: "Rubik", sans-serif;
  }

  & > div {
    width: 45%;
    padding: 0.7rem 0.8rem 0.7rem 2rem;
    border: 1px solid var(--separator-color);
    border-radius: 1rem;
    font-size: 14pt;
    font-weight: 400;
    color: var(--font-color-main-text);
    background-color: white;
    display: flex;
    flex-flow: row nowrap;
    align-items: center;
    justify-content: space-between;

    & > input::placeholder {
      color: var(--font-color-sub-text);
    }

    & > img {
      width: 1.3rem;
    }
  }
}
</style>
