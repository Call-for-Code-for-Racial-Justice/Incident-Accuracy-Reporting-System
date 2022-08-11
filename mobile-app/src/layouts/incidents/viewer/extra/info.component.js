import React from 'react';
import { ScrollView, StyleSheet } from 'react-native';

import { Layout } from '@ui-kitten/components';

import { InfoContent } from './render-items.component';

const InfoScreen = ({ route }) => {
  const incident = route.params.incident;

  return (
    <Layout style={styles.container} >
      <ScrollView>
        <InfoContent incident={incident} />
      </ScrollView>
    </Layout>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1
  }
});

export default InfoScreen;