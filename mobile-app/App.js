
import React from 'react';

import * as eva from '@eva-design/eva';
import { EvaIconsPack } from '@ui-kitten/eva-icons';

import { ApplicationProvider, IconRegistry } from '@ui-kitten/components';
import { AppNavigator } from './src/navigation/app.navigator';

export default () => (
  <>
    <IconRegistry icons={EvaIconsPack}/>
    <ApplicationProvider {...eva} theme={eva.dark}>
      <AppNavigator />
    </ApplicationProvider>
  </>
);