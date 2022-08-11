import React from "react";
import { StyleSheet, View } from "react-native";

import {
  Button,
  Icon,
  Text,
  TopNavigation
} from "@ui-kitten/components";

import { SafeAreaLayout } from "../../components/safe-area-layout.component";
import ContentView from "../../layouts/wizard/screen4";

export const CreateWizardScreen4 = ({ route, navigation }) => {
  const ArrowIosBackIcon = (style) => (
    <Icon style={styles.navIcon} fill="#8F9BB3" name="arrow-ios-back" />
  );

  const ArrowIosForwardIcon = () => (
    <Icon style={styles.navIcon} fill="#8F9BB3" name="arrow-ios-forward" />
  );

  const renderBackAction = () => (
    <Button
      style={styles.navButton}
      disabled={false}
      appearance="outline"
      accessoryLeft={ArrowIosBackIcon}
      size='small'
      onPress={() => navigation.goBack()}
    >
      BACK
    </Button>
  );

  const renderNextAction = () => (
    <Button
      style={styles.navButton}
      disabled={false}
      appearance="outline"
      accessoryRight={ArrowIosForwardIcon}
      size='small'
      onPress={() => navigation.navigate('Page5')}
    >
      NEXT
    </Button>
  );

  return (
    <SafeAreaLayout style={styles.container} insets="top">
      <TopNavigation
        title={<Text>Media</Text>}
        alignment="center"
        accessoryLeft={renderBackAction}
        accessoryRight={renderNextAction}
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
