import React from 'react';
import { useNavigation } from '@react-navigation/native';
import { StyleSheet, View, Dimensions } from 'react-native';

import { Avatar, MenuItem, OverflowMenu, Text, TopNavigation, TopNavigationAction } from '@ui-kitten/components';

import { MenuIcon, InfoIcon } from '../../components/icons';

export const TopMenuNavigation = () => {
  const [menuVisible, setMenuVisible] = React.useState(false);
  const navigation = useNavigation();
  const textCat = Dimensions.get('window').width<380 ? 'label' : 'h6';
  const appName = Dimensions.get('window').width<300 ? 'IARS' : 'Incident Accuracy Reporting System';
  
  const toggleMenu = () => {
    setMenuVisible(!menuVisible);
  };

  const renderMenuAction = () => (
    <TopNavigationAction icon={MenuIcon} onPress={toggleMenu}/>
  );

  const navigateToAbout = () => {
    setMenuVisible(false);
    navigation.navigate('About');
  }

  const renderOverflowMenuAction = () => (
    <React.Fragment>
      <OverflowMenu
        anchor={renderMenuAction}
        visible={menuVisible}
        onBackdropPress={toggleMenu}>
        <MenuItem accessoryLeft={InfoIcon} onPress={navigateToAbout} title='About'/>
      </OverflowMenu>
    </React.Fragment>
  );

  const renderTitle = (props) => (
    <View style={styles.titleContainer}>
      <Avatar
        style={styles.logo}
        shape='square' 
        source={require('../../assets/images/icon-cfcfrj.png')}
      />
      <Text {...props} category={textCat}>{appName}</Text>
    </View>
  );

  return (
    <TopNavigation
      title={renderTitle}
      accessoryRight={renderOverflowMenuAction}
      style={styles.navContainer}
    />
    
  );
};

const styles = StyleSheet.create({
  navContainer: {
    paddingTop: 64,
  },
  titleContainer: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  logo: {
    marginHorizontal: 8,
  },
});