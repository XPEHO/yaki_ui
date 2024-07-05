<script setup lang="ts">
import { PropType } from "vue";
import { TeamType } from "@/models/team.type";
import { useLanguageStore } from "@/stores/languageStore";
import { useTeammateStore } from "@/stores/teammateStore";

const languageStore = useLanguageStore();
const teamStore = useTeammateStore();

//define the props
const props = defineProps({
  team: {
    type: Object as PropType<TeamType>,
    required: true,
  },
});

const currentDate = new Date().valueOf();
const lastActivityDate = props.team.lastActivity ? new Date(props.team.lastActivity).valueOf() : 0;
const numberOfDays = Math.floor((currentDate - lastActivityDate) / (1000 * 60 * 60 * 24));
let inactivityStringValue = "";

if (numberOfDays >= 7 && numberOfDays < 30) {
  inactivityStringValue = "teamStatus.inactiveWeekAgo";
} else if (numberOfDays > 30) {
  inactivityStringValue = "teamStatus.inactiveMonthAgo";
}
</script>

<template>
  <article class="team-details-card">
    <section>
      <ul>
        <li>{{ $t("teamStatus.captainNumber") }} {{ props.team.captainsId.length }}</li>
        <li>{{ $t("teamStatus.teammateNumber") }} {{ teamStore.getTeammateList.length }}</li>
        <li class="activityContainer">
          <span
            >{{ $t("teamStatus.lastActivity") }}
            {{
              props.team.lastActivity && languageStore.getLanguage !== null
                ? `${new Date(props.team.lastActivity).toLocaleDateString(
                    languageStore.getLanguage,
                  )} - ${new Date(props.team.lastActivity).toLocaleTimeString(
                    languageStore.getLanguage,
                  )}`
                : "No latest activity so far"
            }}</span
          >
          <span> </span>
          <span
            class="inactivityReminder"
            v-if="inactivityStringValue.length > 0"
          >
            {{ $t(inactivityStringValue).toUpperCase() }}
          </span>
        </li>
      </ul>
    </section>
  </article>
</template>

<style scoped lang="scss">
.team-details-card {
  background-color: #e6ecef;
  border-radius: 1rem;
  font-weight: 600;
  font-family: "Rubik";
}

.activityContainer {
  display: grid;
  grid-template-columns: 70% 10% 20%;
  place-items: baseline;
}

ul {
  list-style: none;
}

ul li {
  padding: 1rem;
}

.inactivityReminder {
  background-color: white;
  color: $background-color-theme-secondary;
  padding: 0.4rem;
  border-radius: 0.5rem;
  text-align: center;
}
</style>
