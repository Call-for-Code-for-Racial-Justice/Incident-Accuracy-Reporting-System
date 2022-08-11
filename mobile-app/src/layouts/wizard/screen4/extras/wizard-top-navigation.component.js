import React, { useState } from "react";
import { Dimensions, StyleSheet } from "react-native";

import { useNavigation } from "@react-navigation/native";

import { Button, ButtonGroup, Icon, Layout } from "@ui-kitten/components";

export const WizardTopNavigation = ({ onAttachmentSelect, onCameraSelect}) => {
  const navigation = useNavigation();
  
  const AttachmentIcon = (props) => (
    <Icon {...props} name='attach-2-outline'/>
  );

  const CameraIcon = (props) => (
    <Icon {...props} name='camera-outline'/>
  );

  return (
    <Layout style={styles.container}>
      <ButtonGroup>
        <Button
          accessoryRight={AttachmentIcon}
          size="medium"
          onPress={onAttachmentSelect}
        />
        <Button
          accessoryRight={CameraIcon}
          size="medium"
          onPress={() => onCameraSelect(navigation)}
        />
      </ButtonGroup>
    </Layout>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 10,
    maxHeight: Dimensions.get('window').height*0.05,
  }
});
