import React, { useContext } from "react";
import { StyleSheet } from "react-native";

import {
  Button,
  Icon,
  Text,
  TopNavigation
} from "@ui-kitten/components";

import { SafeAreaLayout } from "../../components/safe-area-layout.component";
import ContentView from "../../layouts/wizard/screen4";

import mediaContext from "../../services/media-context.service";
import wizardIncidentContext from '../../services/wizard-incident-context.service';

export const CreateWizardScreen4 = ({ route, navigation }) => {
  const { mediaDetails } = useContext(mediaContext);
  const { setFiles } = useContext(wizardIncidentContext);

  const ArrowIosBackIcon = (style) => (
    <Icon style={styles.navIcon} fill="#8F9BB3" name="arrow-ios-back" />
  );

  const ArrowIosForwardIcon = () => (
    <Icon style={styles.navIcon} fill="#8F9BB3" name="arrow-ios-forward" />
  );

  const onNextPressHandler = async () => {
    setFiles(mediaDetails.attachments);
    navigation.navigate('Page5');
  }

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
      onPress={onNextPressHandler}
    >
      NEXT
    </Button>
  );

  return (
    <SafeAreaLayout style={styles.container} insets="top" level='2'>
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
