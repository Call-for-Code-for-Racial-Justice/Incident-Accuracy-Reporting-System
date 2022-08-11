import React from 'react';
import { StyleSheet, View } from 'react-native';

import { Layout, Text } from '@ui-kitten/components';

import { FilesContent } from './render-items.component';

const FilesScreen = ({ route }) => {
  const files = route.params.files;

  const transformedData = !files ? null : files.map( x => {
    return {
      title: x.name,
      description: x.size,
      type: x.type
    }
  });

  return (
    <Layout style={styles.container} >
      { files && <FilesContent data={transformedData} /> }
      { !files && 
        <Text category='s1' style={styles.empty}>None found.</Text> 
      }
    </Layout>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 5
  },
  empty: {
    paddingTop: 8,
    paddingBottom: 8
  },
});

export default FilesScreen;