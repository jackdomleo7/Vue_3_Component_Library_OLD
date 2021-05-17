import { mount, shallowMount } from '@vue/test-utils'
import { JSample } from '@/components'

describe('Sample.vue', () => {
  /**
   * Vue Instance
   */

  it('is a Vue instance', () => {
    const wrapper = shallowMount(JSample)

    expect(wrapper.vm).toBeTruthy()
  })

  /**
   * Snapshots
   */

  it('matches snapshot when mounted', () => {
    const wrapper = mount(JSample)

    expect(wrapper.element).toMatchSnapshot()
  })

  it('matches snapshot when shallow mounted', () => {
    const wrapper = shallowMount(JSample)

    expect(wrapper.element).toMatchSnapshot()
  })
})
