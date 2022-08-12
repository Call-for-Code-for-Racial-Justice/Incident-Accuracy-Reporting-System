import React from 'react';
import { StyleSheet } from 'react-native';

import { GPSContent, GPSDescriptionContent } from './render-items.component';

const GPSScreen = ({ route }) => {
  const gps = route.params.gps;
  const textLocation = route.params.textLocation;

  return (
    <>
      { gps && <GPSContent gps={gps} /> }
      { !gps && <GPSDescriptionContent textLocation={textLocation} /> }
    </>
  );
};

export default GPSScreen;