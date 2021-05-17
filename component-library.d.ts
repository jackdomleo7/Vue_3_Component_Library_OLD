import { DefineComponent, Plugin } from 'vue'

declare const ComponentLibrary: Exclude<Plugin['install'], undefined>
export default ComponentLibrary

export const JSample: DefineComponent<Record<string, unknown>, Record<string, unknown>, unknown>
