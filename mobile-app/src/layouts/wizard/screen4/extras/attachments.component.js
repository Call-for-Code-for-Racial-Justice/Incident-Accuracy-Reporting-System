import React, { useContext, useState } from 'react';
import { Dimensions, Image, ImageBackground, StyleSheet, View, TouchableOpacity, ScrollView  } from "react-native";

import { Layout, Icon } from "@ui-kitten/components";

import mediaContext from '../../../../services/media-context.service';

export const AttachmentsScreen = ({ route }) => {
  const { mediaDetails, updateAttachments } = useContext(mediaContext);
  const windowSize = Dimensions.get('window');

  const attachments = mediaDetails.attachments;

  const DeleteIcon = () => (
    <Icon style={styles.trashIcon} fill='#8F9BB3' name='trash-outline' />
  );

  const RenderItem = (image, index) => {
    return (
      <Layout key={index}>
        <TouchableOpacity onPress={() => updateAttachments('REMOVE', image)} >
          <Image source={image} style={{width: windowSize.width*0.25, height: image.height*windowSize.width*0.25/image.width, margin: 10, borderRadius: 10}} />
        </TouchableOpacity>
      </Layout>
    );
  };

  return (
    <Layout style={styles.container}>
      { attachments && attachments.map( (image, index) => {return RenderItem(image, index); }) }
    </Layout>
  );
};

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    alignItems: 'baseline',
    justifyContent: 'center',
    flexWrap: 'wrap',
    width: '100%',
    minHeight: '100%'
  },
  imageContainer: {
    flex: 1
  },
  overlayContainer: {
    flex: 1,
  },
  backgroundImage: {
    flex: 1,
    justifyContent: 'center'
  },
  image: {
    width: Dimensions.get('window').width*0.1,
    height: Dimensions.get('window').height*0.1,
    resizeMode: "contain",
    alignSelf: "center",
    borderWidth: 1,
    borderRadius: 20,
  },
  trashIcon: {
    width: 24,
    height: 24
  }
});