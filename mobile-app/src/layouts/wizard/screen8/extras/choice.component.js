import React from 'react';
import { Dimensions, StyleSheet } from "react-native";

import { useNavigation } from "@react-navigation/native";

import {
  IndexPath,
  Layout,
  Select,
  SelectItem,
} from "@ui-kitten/components";

export const ChoiceScreen = () => {
  const navigation = useNavigation();

  const choices=['No','Yes'];
  const [selectedIndex, setSelectedIndex] = React.useState(new IndexPath(0));

  const onSelectHandler = (index) => {
    setSelectedIndex(index);
    if( index==2 ) {
      navigation.navigate('Details');
    }
  }

  return (
    <Layout style={styles.topContainer}>
      <Select
        label='May we contact you?'
        value={choices[selectedIndex.row]}
        selectedIndex={selectedIndex}
        onSelect={onSelectHandler}
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