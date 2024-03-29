import React, { useContext, useState} from 'react';
import { Dimensions, StyleSheet } from "react-native";

import {
  IndexPath,
  Layout,
  Menu,
  MenuItem,
  Text,
} from "@ui-kitten/components";

import wizardIncidentContext from "../../services/wizard-incident-context.service";

export default () => {
  const { incident, setIncidentType, setViewpoint } = useContext(wizardIncidentContext);

  const [incidentTypeSelectedIndex, setIncidentTypeSelectedIndex] = useState(incident.incidentType===null ? -1 : (incident.incidentType==='Harrassment' ? new IndexPath(0) : new IndexPath(1)));
  const [viewpointSelectedIndex, setViewpointSelectedIndex] = useState(incident.viewpoint===null ? -1 : (incident.viewpoint==='Witness' ? new IndexPath(0) : new IndexPath(1)));

  const onTypeSelectHandler = (index) => {
    const incidentType = index==1 ? 'Harrassment' : 'Negligence';
    setIncidentType(incidentType);
    setIncidentTypeSelectedIndex(index);
  }

  const onViewSelectHandler = (index) => {
    const viewpoint = index==1 ? 'Witness' : 'Victim';
    setViewpoint(viewpoint);
    setViewpointSelectedIndex(index);
  }

  return (
    <Layout style={styles.container}>
      <Layout style={styles.contentContainer} >
        <Text category='h6' style={styles.titleContainer}>Select the Incident Type?</Text>
        <Menu
          contentContainerStyle={styles.menuContainer}
          selectedIndex={incidentTypeSelectedIndex}
          onSelect={(index) => onTypeSelectHandler(index)}
        >
          <MenuItem title="Harrassment" />
          <MenuItem title="Negligence" />
        </Menu>
      </Layout>
      <Layout style={styles.contentContainer} >
        <Text category='h6' style={styles.titleContainer}>Select the Viewpoint?</Text>
        <Menu
          contentContainerStyle={styles.menuContainer}
          selectedIndex={viewpointSelectedIndex}
          onSelect={(index) => onViewSelectHandler(index)}
        >
          <MenuItem title="Witness" />
          <MenuItem title="Victim" />
        </Menu>
      </Layout>
    </Layout>
  );
};

const styles = StyleSheet.create({
  container: {
    flexDirection: 'column',
    width: '100%'
  },
  contentContainer: {
    flex: 1,
    minHeight: 145,
    width: '100%',
    marginTop: 15,
  },
  titleContainer: {
    margin: 15,
    justifyContent: 'center',
    alignItems: 'center',
    width: '100%'
  },
  menuContainer: {
    flex: 1,
    width: '100%'
  }
});