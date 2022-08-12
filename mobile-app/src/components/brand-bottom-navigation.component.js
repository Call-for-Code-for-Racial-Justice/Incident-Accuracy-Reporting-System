import React, { useContext } from 'react';
import { BottomNavigation, ThemeProvider } from '@ui-kitten/components';

import * as eva from '@eva-design/eva';

import themeContext from '../services/theme-context.service';

export const BrandBottomNavigation = (props)=> {
  const { theme } = useContext(themeContext);

  return (
    <ThemeProvider theme={eva[theme]}>
      <BottomNavigation {...props}/>
    </ThemeProvider>
  );
};
