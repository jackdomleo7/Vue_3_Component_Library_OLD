import { JSample } from '../index'; // TODO: Get alias @ working

export default {
  title: 'Sample',
  component: JSample
};

const Template = (args: Record<string, unknown>) => ({
  components: { JSample },
  setup() {
    return { args };
  },
  template: '<j-sample v-bind="args" />',
});

export const Default = Template.bind({});
