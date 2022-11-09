import React, { useContext } from 'react';
import { ScrollView, StyleSheet } from 'react-native';

import { Layout } from '@ui-kitten/components';

import { InfoContent } from './render-items.component';

import wizardIncidentContext from '../../../../services/wizard-incident-context.service';

const InfoScreen = () => {
  const { incident } = useContext(wizardIncidentContext);

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