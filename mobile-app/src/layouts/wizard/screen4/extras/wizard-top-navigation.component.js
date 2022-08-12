import React, { useContext } from "react";
import { Dimensions, StyleSheet } from "react-native";

import { useNavigation } from "@react-navigation/native";

import * as FileSystem from 'expo-file-system';
import * as ImagePicker from 'expo-image-picker';
import * as VideoThumbnails from 'expo-video-thumbnails';

import { Button, ButtonGroup, Icon, Layout } from "@ui-kitten/components";

import mediaContext from "../../../../services/media-context.service";

export const WizardTopNavigation = () => {
  const navigation = useNavigation();
  const { mediaDetails, updateAttachments, setIsCameraEnabled } = useContext(mediaContext);
  
  const AttachmentIcon = (props) => (
    <Icon {...props} name='attach-2-outline'/>
  );

  const CameraIcon = (props) => (
    <Icon {...props} name='camera-outline'/>
  );

  const onMediaSelectHandler = async () => {
    // No permissions request is necessary for launching the image library
    let result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ImagePicker.MediaTypeOptions.All,
      allowsEditing: true,
      aspect: [4, 3],
      quality: 1,
    });

    if (!result.cancelled) {
      let fileInfo = await FileSystem.getInfoAsync(result.uri);

      let videoThumb = null;
      if( result.type === 'video' ) {
        videoThumb = await VideoThumbnails.getThumbnailAsync(result.uri);
      }

      const mediaItem = {
        type: result.type,
        name: result.uri.substring(result.uri.lastIndexOf('/')+1),
        uri: videoThumb ? videoThumb.uri : result.uri,
        videoUri: result.type==='video' ? result.uri : null,
        height: videoThumb ? videoThumb.height : result.height,
        width: videoThumb ? videoThumb.width : result.width,
        size: fileInfo.exists ? fileInfo.size : 0
      };

      updateAttachments('ADD', mediaItem);
    }
  };

  const cameraToggleHandler = (navigation) => {
    const tmpVal = mediaDetails.isCameraEnabled;
    setIsCameraEnabled(!tmpVal);

    if( !tmpVal ) {
      navigation.navigate('Camera');
    } else {
      navigation.navigate('Attachments');
    }
  };

  return (
    <Layout style={styles.container}>
      <ButtonGroup>
        <Button
          accessoryRight={AttachmentIcon}
          size="medium"
          onPress={onMediaSelectHandler}
        />
        <Button
          accessoryRight={CameraIcon}
          size="medium"
          onPress={() => cameraToggleHandler(navigation)}
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
