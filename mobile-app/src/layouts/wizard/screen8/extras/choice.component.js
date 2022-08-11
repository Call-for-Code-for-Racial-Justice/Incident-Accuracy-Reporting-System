import React from 'react';
import { Dimensions, StyleSheet } from "react-native";

import {
  IndexPath,
  Layout,
  Select,
  SelectItem,
} from "@ui-kitten/components";

export const ChoiceScreen = () => {
  const choices=['No','Yes'];
  const [selectedIndex, setSelectedIndex] = React.useState(new IndexPath(0));

  return (
    <Layout style={styles.topContainer}>
      <Select
        label='May we contact you?'
        value={choices[selectedIndex.row]}
        selectedIndex={selectedIndex}
        onSelect={index => setSelectedIndex(index)}
        >
          <SelectItem title='No' />
          <SelectItem title='Yes' />
      </Select>
    </Layout>
  )
};

const styles = StyleSheet.create({
  topContainer: {
    flex: 1,
    padding: 20
  },
  headerContainer: {
    alignItems: 'center',
    padding: 5
  },
  cardContainer: { 
    flex: 1,
    width: '90%',
    maxHeight: Dimensions.get('window').height*0.4,
    marginTop: 10
  },
  contentContainer: {
    marginBottom: 10
  }
});