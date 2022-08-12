
import React from 'react';

import * as eva from '@eva-design/eva';
import { EvaIconsPack } from '@ui-kitten/eva-icons';

import { SafeAreaProvider } from 'react-native-safe-area-context';

import { ApplicationProvider, IconRegistry } from '@ui-kitten/components';

import { StatusBar } from './src/components/status-bar.component';
import { AppNavigator } from './src/navigation/app.navigator';

export default () => (
  <>
    <IconRegistry icons={EvaIconsPack}/>
    <ApplicationProvider {...eva} theme={eva.dark}>
      <StatusBar />
      <AppNavigator />
    </ApplicationProvider>
  </>
);