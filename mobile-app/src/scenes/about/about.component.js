import React from 'react';
import { Image, ScrollView, StyleSheet } from 'react-native';

import { Layout, Text } from '@ui-kitten/components';

import { missionStatement } from './data';

export const AboutScreen = () => {
  return (
    <Layout style={styles.container}>
      <ScrollView>
        <Layout style={styles.logoContainer}>
          <Image
            style={styles.logo}
            resizeMethod='scale'
            source={require('../../assets/images/icon-iars.png')} />
        </Layout>
        <Text 
          style={styles.text}
          category='p1'>
            { missionStatement }
        </Text>
      </ScrollView>
    </Layout>
  )
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
  },
  logoContainer: {
    alignItems: 'center'
  },
  logo: {
    width: '80%',
    height: undefined,
    aspectRatio: 1,
  },
  text: {
    padding: 24
  }
});