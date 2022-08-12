import React, { useContext } from "react";
import { StyleSheet } from "react-native";

import {
  Button,
  Icon,
  TopNavigation,
} from "@ui-kitten/components";

import { SafeAreaLayout } from "../../components/safe-area-layout.component";
import ContentView from "../../layouts/wizard/screen8";

import contactContext from "../../services/contact-context.service";

export const CreateWizardScreen8 = ({ route, navigation }) => {
  const { contactDetails, resetContactDetails } = useContext(contactContext);

  const PaperPlaneOulineIcon = () => (
    <Icon style={styles.navIcon} fill="#8F9BB3" name="paper-plane-outline" />
  );

  const onSubmitHandler = () => {
    //API call to add contact details
    console.log(contactDetails);

    //reset
    resetContactDetails();
    
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
    <SafeAreaLayout style={styles.container} level='2'>
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
