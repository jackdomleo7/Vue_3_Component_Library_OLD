# Vue 3 Component Library

[![Pipeline status](https://github.com/jackdomleo7/Vue_3_Component_Library/actions/workflows/pipeline.yml/badge.svg)](https://github.com/jackdomleo7/Vue_3_Component_Library/actions/workflows/pipeline.yml)
[![CodeFactor](https://www.codefactor.io/repository/github/jackdomleo7/vue_3_component_library/badge)](https://www.codefactor.io/repository/github/jackdomleo7/vue_3_component_library)

`@jackdomleo7/vue3-components`

A Vue 3 component library with [Vue 3](https://v3.vuejs.org), [Rollup](https://rollupjs.org), [Jest](https://jestjs.io), [Storybook](https://storybook.js.org) & [SCSS](https://sass-lang.com).

## Scripts

### `prepare`

```bash
$ npm run prepare
```

`prepare` is an [npm hook](https://docs.npmjs.com/cli/v7/using-npm/scripts#life-cycle-scripts). It automatically gets run after you run `npm i` and just before the package is published when you run `npm publish`. Very useful to ensure we are always publishing most up-to-date files and means we don't have to commit the `./dist/` directory to git.

### `serve`

```bash
$ npm run serve
```

Serve the documentation via Storybook.

### `build`

```bash
$ npm run build
```

Build the component library ready for distribution using Rollup. Builds into `./dist/`.

## Installation 

![Live on npm? No.](https://img.shields.io/badge/Live%20on%20npm-No-red)

Install `@jackdomleo7/vue3-components` with npm as a dependency for Vue 3 projects only

```bash 
$ npm install @jackdomleo7/vue3-components
```

## Usage/Examples

```typescript
import { JComponent } from '@jackdomleo7/vue3-components'
```

```html
<j-component />
<JComponent />
```

Components are prefixed with `J` so they stand out in projects. `J` stands for 'Jack'.
