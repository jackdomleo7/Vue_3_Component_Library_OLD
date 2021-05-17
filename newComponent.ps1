$componentName = $args[0]
$prefixedComponentName = "J${componentName}"

if($args.Count -eq 0 -OR $args.Count -gt 1) { throw "You must only provide one argument - this argument should be the name of the component as PascalCase" }

if($componentName.substring(0, 1) -cmatch "^[a-z]*$") { throw "PascalCase requires the first letter to be capitalised" }

Write-Output "New component: ${componentName}"

# Add component type defintion
Add-Content .\component-library.d.ts "`nexport const ${prefixedComponentName}: DefineComponent<Record<string, unknown>, Record<string, unknown>>"
Write-Output "Added ${componentName} to type definitions (./component-library.d.ts)"

# Add component to components import/export file
Add-Content .\src\components\index.ts "`nexport { default as ${prefixedComponentName} } from './${componentName}/${componentName}.vue'"
Write-Output "Added ${componentName} to components import/export file (./src/components/index.ts)"

# Create component directory
New-Item -ItemType "directory" -Path ".\src\components\" -Name $componentName
Write-Output "Created ./src/components/${componentName} directory"

# Create component Vue file
New-Item -ItemType "file" -Path ".\src\components\${componentName}\" -Name "${componentName}.vue"
Add-Content ".\src\components\${componentName}\${componentName}.vue" @"
<template>

</template>

<script lang="ts">
import { defineComponent } from 'vue'
export default defineComponent({
  name: '${componentName}'
})
</script>

<style lang="scss" scoped></style>
"@
Write-Output "Created ./src/components/${componentName}/${componentName}.vue template"

# Create component unit test
New-Item -ItemType "file" -Path ".\src\components\${componentName}\" -Name "${componentName}.spec.ts"
Add-Content ".\src\components\${componentName}\${componentName}.spec.ts" @"
import { mount, shallowMount } from '@vue/test-utils'
import { ${prefixedComponentName} } from '@/components'
import { configureAxe, toHaveNoViolations } from 'jest-axe'

expect.extend(toHaveNoViolations)

const axe = configureAxe({
  rules: {
    region: { enabled: false } // Don't need to check because components are loaded in isolation
  }
})

describe('${componentName}.vue', () => {
  /**
   * Vue Instance
   */

  it('is a Vue instance', () => {
    const wrapper = shallowMount(${prefixedComponentName})
    expect(wrapper.vm).toBeTruthy()
  })

  /**
   * Snapshots
   */

  it('matches snapshot when mounted', () => {
    const wrapper = mount(${prefixedComponentName})
    expect(wrapper.element).toMatchSnapshot()
  })

  it('matches snapshot when shallow mounted', () => {
    const wrapper = shallowMount(${prefixedComponentName})
    expect(wrapper.element).toMatchSnapshot()
  })

  /**
   * A11y
   */

  it('to have no obvious accessibility violations', async () => {
    const wrapper = mount(${prefixedComponentName})
    expect(await axe(wrapper.element)).toHaveNoViolations()
  })
})
"@
Write-Output "Created ./src/components/${componentName}/${componentName}.spec.ts template"

# Create component Storybook file
# New-Item -ItemType "file" -Path ".\src\components\${componentName}\" -Name "${componentName}.stories.ts"
# Add-Content ".\src\components\${componentName}\${componentName}.stories.ts" @"
# import { ${prefixedComponentName} } from '../index'

# export default {
#   title: '${componentName}',
#   component: ${prefixedComponentName}
# }

# const Template = (args: Record<string, unknown>) => ({
#   components: { ${prefixedComponentName} },
#   setup() {
#     return { args };
#   },
#   template: '<${prefixedComponentName} v-bind="args" />',
# })

# export const Default = Template.bind({});
# "@
# Write-Output "Created ./src/components/${componentName}/${componentName}.stories.ts template"

Invoke-Expression -Command "npm run test:update-snapshots -t ${componentName}.spec.ts"
Invoke-Expression -Command "npm run lint:fix"