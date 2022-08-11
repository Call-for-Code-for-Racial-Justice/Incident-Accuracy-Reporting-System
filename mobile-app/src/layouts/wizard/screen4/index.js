import React, { useState } from "react";

import { NavigationContainer } from "@react-navigation/native";
import { createMaterialTopTabNavigator } from "@react-navigation/material-top-tabs";

import * as ImagePicker from 'expo-image-picker';
import * as VideoThumbnails from 'expo-video-thumbnails';

import { TabBar, Tab } from "@ui-kitten/components";

import { WizardTopNavigation } from './extras/wizard-top-navigation.component';
import { AttachmentsScreen } from "./extras/attachments.component";
import { CameraScreen } from "./extras/camera.component";

import mediaContext from './store/media-context';

const { Navigator, Screen }  = createMaterialTopTabNavigator();

export default () => {
  const [attachments, setAttachments] = useState([]);
  const [isCameraEnabled, setIsCameraEnabled] = useState(false);

  const cameraToggleHandler = (navigation) => {
    const tmpVal = isCameraEnabled;
    setIsCameraEnabled(current => !current);

    if( !tmpVal ) {
      navigation.navigate('Camera');
    } else {
      navigation.navigate('Attachments');
    }
  };

  const updateAttachmentHandler = (op, item) => {
    if( op==='ADD' ) {
      setAttachments( oldArray => [...oldArray, item] );
    } else if ( op==='REMOVE' ) {
      setAttachments(attachments.filter( x => x.uri !== item.uri));
    }
  };

  const pickImage = async () => {
    // No permissions request is necessary for launching the image library
    let result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ImagePicker.MediaTypeOptions.All,
      allowsEditing: true,
      aspect: [4, 3],
      quality: 1,
    });

    if (!result.cancelled) {
      updateAttachmentHandler('ADD', result);
    }
  };

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
    <mediaContext.Provider value={{
        attachments,
        updateAttachments: updateAttachmentHandler,
        isCameraEnabled,
        setIsCameraEnabled
      }}>
      <NavigationContainer independent={true}>
        <WizardTopNavigation onAttachmentSelect={pickImage} onCameraSelect={cameraToggleHandler} />
        <TabNavigator />
      </NavigationContainer>
    </mediaContext.Provider>
  );
};