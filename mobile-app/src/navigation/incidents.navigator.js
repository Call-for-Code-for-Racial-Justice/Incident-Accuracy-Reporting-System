import React from 'react';
import { createStackNavigator } from '@react-navigation/stack';

import { IncidentsListScreen } from '../scenes/incidents/incidents-list.component';
import { IncidentViewerScreen } from '../scenes/incidents/incident-viewer.component';

const Stack = createStackNavigator();

export const IncidentsNavigator = () => {
  return (
    <Stack.Navigator
      screenOptions={{
        headerShown: false
      }}
    >
      <Stack.Screen name='Incidents List' component={IncidentsListScreen}/>
      <Stack.Screen name='Incident Viewer' component={IncidentViewerScreen}/>
    </Stack.Navigator>
  );
};
