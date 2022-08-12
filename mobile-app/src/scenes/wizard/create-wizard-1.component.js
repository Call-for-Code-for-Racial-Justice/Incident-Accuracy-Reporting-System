import React, { useContext } from "react";
import { StyleSheet } from "react-native";

import {
  Button,
  Icon,
  TopNavigation,
} from "@ui-kitten/components";

import { SafeAreaLayout } from "../../components/safe-area-layout.component";
import ContentView from "../../layouts/wizard/screen1.component";

import wizardIncidentContext from "../../services/wizard-incident-context.service";

export const CreateWizardScreen1 = ({ route, navigation }) => {
  const { incident, setTimestamp } = useContext(wizardIncidentContext);

  const ArrowIosForwardIcon = () => (
    <Icon style={styles.navIcon} fill="#8F9BB3" name="arrow-ios-forward" />
  );

  const nextPageHandler = () => {
    if( incident.isLive ) {
      setTimestamp( new Date().getTime() );
      navigation.navigate('Page3')
    } else {
      navigation.navigate('Page2')
    }
  }

  const renderNextAction = () => (
    <Button
      style={styles.navButton}
      disabled={incident.isLive==null}
      appearance="outline"
      accessoryRight={ArrowIosForwardIcon}
      size='small'
      onPress={nextPageHandler}
    >
      NEXT
    </Button>
  );

  return (
    <SafeAreaLayout style={styles.container} insets="top">
      <TopNavigation
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
