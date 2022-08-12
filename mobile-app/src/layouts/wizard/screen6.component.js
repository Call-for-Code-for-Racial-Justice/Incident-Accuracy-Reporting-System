import React, { useContext, useState } from 'react';
import { ScrollView, StyleSheet } from "react-native";

import {
  Layout,
  Input,
} from "@ui-kitten/components";

import wizardIncidentContext from "../../services/wizard-incident-context.service";

export default () => {
  const { incident, setDescription } = useContext(wizardIncidentContext);
  const [descriptionInput, setDescriptionInput] = useState(incident.description==null ? '' : incident.description);

  const onDescriptionChangeHandler = (newValue) => {
    setDescriptionInput(newValue);
  }

  const onDescriptionEndEditingHandler = (event) => {
    setDescription(descriptionInput);
  }

  return (
    <Layout style={styles.contentContainer} >
      <ScrollView style={styles.container}>
        <Input
          label="Tell us what happend?"
          multiline={true}
          textStyle={styles.descriptionContainer}
          placeholder="Description."
          value={descriptionInput}
          onChangeText={newValue => onDescriptionChangeHandler(newValue)}
          onEndEditing={event => onDescriptionEndEditingHandler(event)}
        />
      </ScrollView>
    </Layout>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    height: 300
  },
  contentContainer: {
    flex: 1,
    width: '95%',
    minHeight: '90%',
    margin: 10
  },
  descriptionContainer: {
    minHeight: 100
  }
});