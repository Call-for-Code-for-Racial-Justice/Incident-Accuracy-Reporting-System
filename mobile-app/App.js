
import React, { useState } from 'react';

import * as eva from '@eva-design/eva';
import { EvaIconsPack } from '@ui-kitten/eva-icons';

import { SafeAreaProvider } from 'react-native-safe-area-context';

import { ApplicationProvider, IconRegistry } from '@ui-kitten/components';

import { StatusBar } from './src/components/status-bar.component';
import { AppNavigator } from './src/navigation/app.navigator';

import themeContext from './src/services/theme-context.service';

export default () => {
  const [ theme, setTheme ] = useState('dark');

  const toggleThemeHandler = () => {
    setTheme(theme==='dark' ? 'light' : 'dark');
  }

  return (
  <>
    <IconRegistry icons={EvaIconsPack}/>
    <SafeAreaProvider>
      <themeContext.Provider value={{theme, toggleTheme: toggleThemeHandler}}>
        <ApplicationProvider {...eva} theme={eva[theme]}>
          <StatusBar />
          <AppNavigator />
        </ApplicationProvider>
      </themeContext.Provider>
    </SafeAreaProvider>
  </>
  )
};