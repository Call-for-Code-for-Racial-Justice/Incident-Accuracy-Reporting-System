import React, { useContext } from "react";
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
import ContentView from "../../layouts/wizard/screen7";

import incidentsContext from "../../services/incidents-context.service";
import wizardIncidentContext from "../../services/wizard-incident-context.service";
import contactContext from '../../services/contact-context.service';
import mediaContext from "../../services/media-context.service";

export const CreateWizardScreen7 = ({ route, navigation }) => {
  const { updateIncidents } = useContext(incidentsContext);
  const { incident, setIsDraft, resetIncident } = useContext(wizardIncidentContext);
  const { setIncidentId} = useContext(contactContext);
  const { resetMediaDetails } = useContext(mediaContext);

  const ArrowIosBackIcon = () => (
    <Icon style={styles.navIcon} fill="#8F9BB3" name="arrow-ios-back" />
  );

  const PaperPlaneOulineIcon = () => (
    <Icon style={styles.navIcon} fill="#8F9BB3" name="paper-plane-outline" />
  );

  const submitIncidentHandler = () => {
    //api call to submit

    //set data
    setIsDraft(false);
    setIncidentId(incident.id);
    updateIncidents("ADD", incident);

    //reset
    resetIncident();
    resetMediaDetails();

    navigation.navigate('Page8');
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

  const renderSubmitAction = () => (
    <Button
      style={styles.navButton}
      disabled={false}
      appearance="outline"
      accessoryRight={PaperPlaneOulineIcon}
      size='small'
      onPress={submitIncidentHandler}
    >
      SUBMIT
    </Button>
  );

  const renderTitle = () => (
    <Text category='h5'>Summary</Text>
  );

  return (
    <SafeAreaLayout style={styles.container} level='2'>
      <TopNavigation
        title={renderTitle}
        alignment="center"
        accessoryLeft={renderBackAction}
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
