import React from "react";

import { NavigationContainer } from "@react-navigation/native";
import { createMaterialTopTabNavigator } from "@react-navigation/material-top-tabs";

import { TabBar, Tab } from "@ui-kitten/components";

import { WizardTopNavigation } from './extras/wizard-top-navigation.component';
import { AttachmentsScreen } from "./extras/attachments.component";
import { CameraScreen } from "./extras/camera.component";

const { Navigator, Screen }  = createMaterialTopTabNavigator();

export default () => {
  const TopTabBar = ({ navigation, state }) => {
    return (
    <TabBar
      selectedIndex={state.index}
      onSelect={(index) => navigation.navigate(state.routeNames[index])}
    >
      <Tab title="ATTACHMENTS" />
      <Tab title="CAMERA" />
    </TabBar>
    );
  }

  const TabNavigator = (props) => {
    return (
      <Navigator
        tabBar={(props) => <TopTabBar {...props} />}
        screenOptions={{
          headerShown: false,
        }}
        initialRouteName={"Attachments"}
      >
        <Screen
          name="Attachments"
          component={AttachmentsScreen}
          options={{ headerShown: false }}
        />
        <Screen
          name="Camera"
          component={CameraScreen}
          options={{ headerShown: false }}
        />
      </Navigator>
    );
  };

  return (
    <NavigationContainer independent={true}>
      <WizardTopNavigation />
      <TabNavigator />
    </NavigationContainer>
  );
};