import React from 'react';
import {
  StatusBar as RNStatusBar,
  StatusBarProps as RNStatusBarProps,
} from 'react-native';

export const StatusBar = ({ eva, ...statusBarProps }) => {
  return (
    <RNStatusBar
      {...eva?.style}
      {...statusBarProps}
    />
  );
}
