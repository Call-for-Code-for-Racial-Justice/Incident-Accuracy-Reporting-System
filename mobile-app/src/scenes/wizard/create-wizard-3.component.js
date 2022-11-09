import React, { useContext} from "react";
import { StyleSheet, View } from "react-native";

import {
  Button,
  Icon,
  Layout,
  Text,
  TopNavigation,
  TopNavigationAction,
} from "@ui-kitten/components";

import { SafeAreaLayout } from "../../components/safe-area-layout.component";
import ContentView from "../../layouts/wizard/screen3.component";

import wizardIncidentContext from "../../services/wizard-incident-context.service";

export const CreateWizardScreen3 = ({ route, navigation }) => {
  const { incident } = useContext(wizardIncidentContext);

  const ArrowIosBackIcon = (style) => (
    <Icon style={styles.navIcon} fill="#8F9BB3" name="arrow-ios-back" />
  );

  const ArrowIosForwardIcon = () => (
    <Icon style={styles.navIcon} fill="#8F9BB3" name="arrow-ios-forward" />
  );

  const backActionHandler = () => {
    if( incident.isLive ) {
      navigation.navigate('Page1');
    } else {
      navigation.goBack();
    }
  }

  const renderBackAction = () => (
    <Button
      style={styles.navButton}
      disabled={false}
      appearance="outline"
      accessoryLeft={ArrowIosBackIcon}
      size='small'
      onPress={backActionHandler}
    >
      BACK
    </Button>
  );

  const renderNextAction = () => (
    <Button
      style={styles.navButton}
      disabled={incident.incidentType==null || incident.viewpoint==null}
      appearance="outline"
      accessoryRight={ArrowIosForwardIcon}
      size='small'
      onPress={() => navigation.navigate('Page4')}
    >
      NEXT
    </Button>
  );

  return (
    <SafeAreaLayout style={styles.container} level='2'>
      <TopNavigation
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
