import React, { useContext } from 'react';
import { Image, ScrollView, StyleSheet } from 'react-native';

import { Layout, Text, useTheme } from '@ui-kitten/components';

import themeContext from '../../services/theme-context.service';

import { missionStatement } from './data';

export const AboutScreen = () => {
  const { theme } = useContext(themeContext);
  const themeSettings = useTheme();

  return (
    <Layout style={styles.container}>
      <ScrollView>
        <Layout style={styles.logoContainer}>
          <Image
            style={[
              styles.logo, 
              { 
                borderWidth: 3, 
                borderColor: theme === 'light' ? themeSettings['color-primary-200'] : 'transparent', 
                backgroundColor: theme === 'light' ? themeSettings['color-basic-500'] : 'transparent' 
              }
            ]}
            resizeMethod='scale'
            source={require('../../assets/images/icon-iars.png')} />
        </Layout>
        <Text
          style={styles.text}
          category='p1'>
          {missionStatement}
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