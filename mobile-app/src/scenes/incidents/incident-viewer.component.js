import React from 'react';
import { StyleSheet } from 'react-native';

import { TopNavigation, TopNavigationAction } from '@ui-kitten/components';

import { SafeAreaLayout } from '../../components/safe-area-layout.component';
import { ArrowIosBackIcon } from '../../components/icons';
import ContentView from '../../layouts/incidents/viewer';

export const IncidentViewerScreen = ({ route, navigation }) => {
  const incident = route.params.incident;

  const renderBackAction = () => (
    <TopNavigationAction
      icon={ArrowIosBackIcon}
      onPress={navigation.goBack}
    />
  );

  return (
    <SafeAreaLayout style={styles.container} insets="top" level='2'>
      <TopNavigation
        title='Incident Viewer'
        accessoryLeft={renderBackAction}
      />
      <ContentView incident={incident} />
    </SafeAreaLayout>
  );
};


const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
});
