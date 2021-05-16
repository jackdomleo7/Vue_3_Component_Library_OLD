import { DefineComponent, Plugin } from 'vue';


declare const ComponentLibrary: Exclude<Plugin['install'], undefined>;
export default ComponentLibrary;

export const ComponentLibrarySample: DefineComponent<{}, {}, any>;
