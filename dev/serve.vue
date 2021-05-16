<script lang="ts">
import { defineComponent } from 'vue';
// Uncomment import and local "components" registration if library is not registered globally.
// import { ComponentLibrarySample } from '@/entry.esm';

export default defineComponent({
  name: 'ServeDev',
  // components: {
  //  ComponentLibrarySample,
  // }
});
</script>

<template>
  <div id="app">
    <component-library-sample />
  </div>
</template>
