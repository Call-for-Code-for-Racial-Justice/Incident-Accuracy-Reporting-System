import React, { useContext, useEffect, useRef, useState } from 'react';
import { StyleSheet, TouchableOpacity, View } from 'react-native';

import { Camera, CameraType } from 'expo-camera';
import * as MediaLibrary from 'expo-media-library';

import { Button, ButtonGroup, Icon, Layout, Text } from '@ui-kitten/components';

import mediaContext from '../../../../services/media-context.service';

export const CameraScreen = ({ navigation }) => {
  const { mediaDetails, setIsCameraEnabled, updateAttachments } = useContext(mediaContext);
  
  const [hasCameraPermission, setHasCameraPermission] = useState(false);
  const [hasCamerarollPermission, setHasCamerarollPermission] = useState(false);
  const [type, setType] = useState(CameraType.back);
  const ref = useRef(null);

  const isCameraEnabled = mediaDetails.isCameraEnabled;

  useEffect(() => {
    (async () => {
      const cameraPermission = await Camera.requestCameraPermissionsAsync();
      setHasCameraPermission( cameraPermission.status === 'granted' );
      const camerarollPermission = await MediaLibrary.requestPermissionsAsync();
      setHasCamerarollPermission( camerarollPermission.status === 'granted' )
    })();
  }, []);

  const FlipIcon = (props) => (
    <Icon {...props} name='flip-2-outline'/>
  );

  const ImageIcon = (props) => (
    <Icon {...props} name='image-outline'/>
  );

  const FilmIcon = (props) => (
    <Icon {...props} name='film-outline'/>
  );

  const takePhoto = async () => {
    const camera = ref.current;
    if( camera ) {
      const photo = await camera.takePictureAsync()
      updateAttachments('ADD', photo);
      const result = await MediaLibrary.saveToLibraryAsync(photo.uri);
    }
  }

  const ShowCamera = () => {
    return (
      <View style={styles.container}>
        <Camera style={styles.camera} type={type} ref={ref}>
          <View style={styles.overlayContainer}>
            <TouchableOpacity
              onPress={() => {
                setType(type === CameraType.back ? CameraType.front : CameraType.back);
              }}>
              <ButtonGroup style={styles.button} status='basic' size='large'>
                <Button accessoryLeft={FlipIcon} onPress={() => {
                  setType(type === CameraType.back ? CameraType.front : CameraType.back);
                }} />
                { hasCameraPermission && <Button accessoryLeft={ImageIcon} onPress={takePhoto} /> }
                { hasCameraPermission && <Button accessoryLeft={FilmIcon} /> }
              </ButtonGroup>
            </TouchableOpacity>
          </View>
        </Camera>
      </View>
    );
  }

  return (
    <Layout style={styles.container}>
      {isCameraEnabled && hasCameraPermission && <ShowCamera /> }
      {!hasCameraPermission && <Text category='h6'>Unable to load camera.</Text>}
    </Layout>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignConent: 'center',
    justifyContent: 'center',
    minWidth: '100%',
    minHeight: '100%'
  },
  camera: {
    flex: 1,
    width: '100%',
    minHeight: '100%'
  },
  overlayContainer: {
    flex: 1,
    minWidth: '100%',
    minHeight: '100%',
    alignItems: 'center',
    justifyContent: 'flex-end'
  },
  button: {
    marginBottom: 5
  }
});