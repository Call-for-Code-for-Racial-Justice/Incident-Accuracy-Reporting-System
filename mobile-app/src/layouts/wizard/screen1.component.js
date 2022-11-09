import React, { useContext, useState } from 'react';
import { StyleSheet } from "react-native";

import {
  Divider,
  IndexPath,
  Layout,
  Menu,
  MenuItem,
  Text,
} from "@ui-kitten/components";

import wizardIncidentContext from '../../services/wizard-incident-context.service';

export default () => {
  const { incident, setIsLive } = useContext(wizardIncidentContext);
  const [selectedIndex, setSelectedIndex] = useState(incident.isLive==null ? -1 : (incident.IsLive ? new IndexPath(0) : new IndexPath(1)));

  const onSelectHandler = (index) => {
    setIsLive(index==1);
    setSelectedIndex(index);
  }

  return (
    <Layout style={styles.container}>
      <Text category='h5' style={styles.titleContainer}>Is this a Live event?</Text>
      <Divider />
      <Menu
        style={styles.contentContainer}
        selectedIndex={selectedIndex}
        onSelect={(index) => onSelectHandler(index)}
      >
        <MenuItem title="Yes" />
        <MenuItem title="No" />
      </Menu>
    </Layout>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    width: '100%'
  },
  titleContainer: { 
    marginTop: 15,
    marginBottom: 15
  },
  contentContainer: {
    flex: 1,
    width: '100%',
    marginTop: 15
  }
});