import React from 'react';
import { Dimensions, StyleSheet } from "react-native";

import { NavigationContainer } from '@react-navigation/native';
import { createMaterialTopTabNavigator } from '@react-navigation/material-top-tabs';

import {
  Layout,
  TabBar, 
  Tab,
  Text,
} from "@ui-kitten/components";

import { ChoiceScreen } from './extras/choice.component';
import { DetailScreen } from './extras/details.component';

const { Navigator, Screen } = createMaterialTopTabNavigator();

const TopTabBar = ({ navigation, state }) => (
  <TabBar
    selectedIndex={state.index}
    onSelect={index => navigation.navigate(state.routeNames[index])}>
    <Tab title='CHOICE' />
    <Tab title='DETAILS' />
  </TabBar>
);

const TabNavigator = () => (
  <Navigator tabBar={props => <TopTabBar {...props} />}>
    <Screen name='Choice' component={ChoiceScreen} />
    <Screen name='Details' component={DetailScreen} />
  </Navigator>
);

export default () => {
  const incidentNumber = "IC334A95";

  return (
    <>
      <Layout style={styles.titleContainer}>
        <Text category='h5'>Thanks for your submission.</Text>
        <Layout style={styles.incidentContainer}>
          <Text category='p1' style={styles.incidentTitle}>Incident: </Text>
          <Text category="p1">{incidentNumber}</Text>
        </Layout>
      </Layout>
      <NavigationContainer independent={true}>
        <TabNavigator />
      </NavigationContainer>
    </>
  );
};

const styles = StyleSheet.create({
  titleContainer: {
    flex: 1,
    alignItems: "center",
    padding: 5,
    maxHeight: Dimensions.get('window').height*0.1,
  },
  incidentContainer: {
    flexDirection: 'row',
    justifyContent: 'center'
  },
  incidentTitle: {
    fontWeight: 'bold'
  },
  cardContainer: { 
    flex: 1,
    width: '90%',
    maxHeight: Dimensions.get('window').height*0.2,
    marginTop: 10
  },
  contactDetailsCardContainer:
  { 
    flex: 1,
    width: '90%',
    maxHeight: '100%',
    marginTop: 10
  },
  contentContainer: {
    marginBottom: 10
  },
  headerContainer: {
    alignItems: 'center',
    padding: 5
  },
  infoInput: {
    margin: 2
  },
  divider: {
    marginTop: 10,
    marginBottom: 10
  }
});