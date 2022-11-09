import React, { useState} from 'react';

const themeContext = React.createContext({
  theme: 'dark',
  toggleTheme: () => {},
});

export default themeContext;