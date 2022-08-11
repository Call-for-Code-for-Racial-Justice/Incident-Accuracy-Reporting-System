import React from "react";
import { createStackNavigator } from '@react-navigation/stack';

import { CreateWizardScreen1 } from '../scenes/wizard/create-wizard-1.component';
import { CreateWizardScreen2 } from '../scenes/wizard/create-wizard-2.component';
import { CreateWizardScreen3 } from '../scenes/wizard/create-wizard-3.component';
import { CreateWizardScreen4 } from '../scenes/wizard/create-wizard-4.component';
import { CreateWizardScreen5 } from '../scenes/wizard/create-wizard-5.component';
import { CreateWizardScreen6 } from '../scenes/wizard/create-wizard-6.component';
import { CreateWizardScreen7 } from '../scenes/wizard/create-wizard-7.component';
import { CreateWizardScreen8 } from '../scenes/wizard/create-wizard-8.component';



const Stack = createStackNavigator();

export const CreateWizardNavigator = () => {
  return (
    <Stack.Navigator
      screenOptions={{
        headerShown: false
      }}
      initialRouteName={'Page1'}
    >
      <Stack.Screen name="Page1" component={CreateWizardScreen1} options={{headerShown: false}} />
      <Stack.Screen name="Page2" component={CreateWizardScreen2} options={{headerShown: false}} />
      <Stack.Screen name="Page3" component={CreateWizardScreen3} options={{headerShown: false}} />
      <Stack.Screen name="Page4" component={CreateWizardScreen4} options={{headerShown: false}} />
      <Stack.Screen name="Page5" component={CreateWizardScreen5} options={{headerShown: false}} />
      <Stack.Screen name="Page6" component={CreateWizardScreen6} options={{headerShown: false}} />
      <Stack.Screen name="Page7" component={CreateWizardScreen7} options={{headerShown: false}} />
      <Stack.Screen name="Page8" component={CreateWizardScreen8} options={{headerShown: false}} />
    </Stack.Navigator>
  );
};