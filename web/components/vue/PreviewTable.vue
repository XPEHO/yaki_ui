<script setup lang="ts">
import { computed, ref } from "vue";
import chevronLeftIcon from "../../assets/icons_svg/Chevron-left.svg";
import chevronRightIcon from "../../assets/icons_svg/Chevron-right.svg";
import { textDirection } from "../../types/datatable.type";
import createTextAlignmentArray from "../../utils/createTextAlignmentArray";

//define the props
const props = defineProps({
  statisticsArray: {
    type: Array<Array<string>>,
    required: true,
  },
  textAlignHeaders: {
    type: Array<textDirection>,
    default: ["center"],
  },
  textAlignContent: {
    type: Array<textDirection>,
    default: ["left"],
  },
  isPageChangeEnabled: {
    type: Boolean,
    default: false
  },
  rowsPerPage: {
    type: Number,
    default: 10
  },
});

// Pagination variable
const currentPage = ref(1);

// Computed property for pagination
const paginatedStatisticsArray = computed(() => {
  // We get the start using the currentPage and rowsPerPage and we add 1 to ignore the first row (headers)
  let start = 1 + (currentPage.value - 1) * props.rowsPerPage;
  // We get the end using the start and rowsPerPage
  let end = start + props.rowsPerPage;
  // We filter the array to remove empty rows
  return props.statisticsArray.slice(start, end).filter((row) => row[0] !== "" || row.length > 1);
});

// Computed property for table text alignment styling
const textAlignColumnHeaders = computed(() => {
  return createTextAlignmentArray(props.statisticsArray[0].length, props.textAlignHeaders, textDirection.center);
});

const textAlignColumnValues = computed(() => {
  return createTextAlignmentArray(props.statisticsArray[0].length, props.textAlignContent, textDirection.left);
});

// Methods for pagination
const nextPage = () => {
  if (currentPage.value * props.rowsPerPage < props.statisticsArray.length) {
    currentPage.value++;
  }
};

const prevPage = () => {
  if (currentPage.value > 1) {
    currentPage.value--;
  }
};

</script>

<template>
  <section>
    <table
      v-if="paginatedStatisticsArray.length && paginatedStatisticsArray[0][0] !== ''"
      :class="props.textAlignHeaders.length == 1 && props.textAlignContent.length == 1 && props.textAlignContent[0] == props.textAlignHeaders[0]  ? 'allStyle' : ''"
    >
      <thead>
        <tr>
          <th
            v-for="(header, index) in props.statisticsArray[0]"
            :key="header"
            :style="[textAlignColumnHeaders[index] ? {textAlign: textAlignColumnHeaders[index]} : {}]"
          >
            {{ header }}
          </th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="(row, index) in paginatedStatisticsArray"
          :key="index"
        >
          <td
            v-for="(cell, index) in row"
            :key="index"
            :style="[textAlignColumnValues[index] ? {textAlign: textAlignColumnValues[index]} : {}]"
          >
            {{ cell }}
          </td>
        </tr>
        <!-- We fill the table with empty cells to always have the same size-->
        <tr
          v-for="index in props.rowsPerPage - paginatedStatisticsArray.length"
          :key="index"
        >
          <td
            v-for="index in props.statisticsArray[0].length"
            :key="index"
            style="opacity: 0"
          >
            ''
          </td>
        </tr>
      </tbody>
    </table>
    <section v-if="paginatedStatisticsArray.length && paginatedStatisticsArray[0][0] !== '' && isPageChangeEnabled">
      <button
        @click="prevPage"
        :style="currentPage === 1 ? 'pointer-events: none; opacity: 0.2;' : ''"
      >
        <figure>
          <img
            :src="chevronLeftIcon"
            alt=""
          />
        </figure>
      </button>
      <span
        >Page : {{ currentPage }} /
        {{ Math.ceil((statisticsArray.length - 1) / props.rowsPerPage) }}</span
      >
      <button
        @click="nextPage"
        :style="
          currentPage * props.rowsPerPage >= statisticsArray.length
            ? 'pointer-events: none; opacity: 0.2;'
            : ''
        "
      >
        <figure>
          <img
            :src="chevronRightIcon"
            alt=""
          />
        </figure>
      </button>
    </section>
  </section>
</template>

<style scoped lang="scss">
.allStyle * {
  text-align: v-bind("props.textAlignHeaders[0]");
}

thead tr {
  th:first-of-type {
    border-radius: 1rem 0 0 0;
  }

  th:last-of-type {
    border-radius: 0 1rem 0 0;
  }
}

table {
  width: 100%;
  margin-top: 20px;
  font-family: $font-sf-compact;
  font-size: 11pt;
  box-shadow: 0 5px #d9d9d9;

  th,
  td {
    padding: 8px;
  }

  tr {
    background-color: white;

    &:nth-child(even) {
      background-color: #f2f2f2;
    }
  }

  th {
    padding-top: 12px;
    padding-bottom: 12px;
    background-color: $background-color-theme-secondary;
  }
}

section {
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 1rem;
  font-family: $font-rubik;

  button {
    border: none;
    background-color: $background-color-theme-primary;
    cursor: pointer;
  }
}
</style>
