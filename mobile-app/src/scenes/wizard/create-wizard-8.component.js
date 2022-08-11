import React from "react";
import { StyleSheet, View } from "react-native";

import {
  Button,
  Icon,
  TopNavigation,
} from "@ui-kitten/components";

import { SafeAreaLayout } from "../../components/safe-area-layout.component";
import ContentView from "../../layouts/wizard/screen8";

export const CreateWizardScreen8 = ({ route, navigation }) => {
  const PaperPlaneOulineIcon = () => (
    <Icon style={styles.navIcon} fill="#8F9BB3" name="paper-plane-outline" />
  );

  const onSubmitHandler = () => {
    navigation.reset({
      index: 0,
      routes: [{ name: 'Page1' }]
    });
    navigation.navigate('Incidents');
  }

  const renderSubmitAction = () => (
    <Button
      style={styles.navButton}
      disabled={false}
      appearance="outline"
      accessoryRight={PaperPlaneOulineIcon}
      size='small'
      onPress={onSubmitHandler}
    >
      SUBMIT
    </Button>
  );

  return (
    <SafeAreaLayout style={styles.container} insets="top">
      <TopNavigation
        accessoryRight={renderSubmitAction}
      />
      <ContentView />
    </SafeAreaLayout>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  navContent: {
    flexDirection: "row",
    verticalAlign: "text-bottom",
    minheight: "100%",
  },
  navIcon: {
    width: 24,
    height: 24,
  },
  navButton: {
    margin: 2,
  },
});
