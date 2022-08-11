import React from 'react';
import { StyleSheet } from 'react-native';

import { Layout, Text } from '@ui-kitten/components';

import { GPSContent } from './render-items.component';

const GPSScreen = ({ route }) => {
  const gps = route.params.gps;

  return (
    <>
      { gps && <GPSContent gps={gps} /> }
      { !gps && 
        <Layout style={styles.container} >
          <Text category='s1' style={styles.empty}>None found.</Text> 
        </Layout>
      }
    </>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 5
  },
  empty: {
    paddingTop: 8,
    paddingBottom: 8
  },
});

export default GPSScreen;