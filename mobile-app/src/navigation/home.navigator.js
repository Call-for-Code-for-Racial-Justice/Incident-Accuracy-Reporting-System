import React from 'react';
import {
  createBottomTabNavigator,
} from '@react-navigation/bottom-tabs';

import { IncidentsNavigator } from './incidents.navigator';
import { CreateWizardNavigator } from './create-wizard.navigator';
import { AboutScreen } from '../scenes/about/about.component';

import { TopMenuNavigation } from '../scenes/home/top-menu-navigation.component';
import { HomeBottomNavigation } from '../scenes/home/home-bottom-navigation.component';

import { IncidentsContextProvider } from '../services/incidents-content.service';
import { WizardIncidentContextProvider } from '../services/wizard-incident-content.service';

const BottomTab = createBottomTabNavigator();
const ROOT_ROUTES = ['Incidents', 'Create Wizard', 'About'];

const TabBarVisibilityOptions = ({ route }) => {
  const isNestedRoute = route.state?.index > 0;
  const isRootRoute = ROOT_ROUTES.includes(route.name);

  return { tabBarVisible: isRootRoute && !isNestedRoute };
};

const HomeTabsNavigator = () => (
  <BottomTab.Navigator
    screenOptions={TabBarVisibilityOptions}
    initialRouteName={'Incidents'}
    tabBar={props => <HomeBottomNavigation {...props} />}
    >
      <BottomTab.Screen name='Incidents' component={IncidentsNavigator} options={{headerShown: false}} />
      <BottomTab.Screen name='Create Wizard' component={CreateWizardNavigator} options={{headerShown: false}} />
      <BottomTab.Screen name='About' component={AboutScreen} options={{headerShown: false}} />
  </BottomTab.Navigator>
);

export const HomeNavigator = () => {
  return (
    <IncidentsContextProvider>
      <WizardIncidentContextProvider>
        <TopMenuNavigation />
        <HomeTabsNavigator />
      </WizardIncidentContextProvider>
    </IncidentsContextProvider>
  );
};