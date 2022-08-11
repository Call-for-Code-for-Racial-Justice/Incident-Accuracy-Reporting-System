import React from 'react';
import { BottomNavigation, ThemeProvider } from '@ui-kitten/components';

import * as eva from '@eva-design/eva';

export const BrandBottomNavigation = (props)=> {

  return (
    <ThemeProvider theme={eva.dark}>
      <BottomNavigation {...props}/>
    </ThemeProvider>
  );
};
