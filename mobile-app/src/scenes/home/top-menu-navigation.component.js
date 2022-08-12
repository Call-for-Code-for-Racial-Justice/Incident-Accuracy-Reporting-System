import React, { useContext, useState } from 'react';
import { useNavigation } from '@react-navigation/native';
import { StyleSheet, View, Dimensions } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { Avatar, Divider, Layout, MenuItem, OverflowMenu, Text, Toggle, TopNavigation, TopNavigationAction, useTheme } from '@ui-kitten/components';

import { MenuIcon, InfoIcon } from '../../components/icons';

import themeContext from '../../services/theme-context.service';

export const TopMenuNavigation = () => {
  const { theme, toggleTheme } = useContext(themeContext);

  const [menuVisible, setMenuVisible] = useState(false);
  const [checked, setChecked] = React.useState(theme==='light');

  const navigation = useNavigation();
  const safeAreaInsets = useSafeAreaInsets();
  const themeSettings = useTheme();

  const textCat = Dimensions.get('window').width < 380 ? 'label' : 'h6';
  const appName = Dimensions.get('window').width < 300 ? 'IARS' : 'Incident Accuracy Reporting System';

  const toggleMenu = () => {
    setMenuVisible(!menuVisible);
  };

  const renderMenuAction = () => (
    <TopNavigationAction icon={MenuIcon} onPress={toggleMenu} />
  );

  const navigateToAbout = () => {
    setMenuVisible(false);
    navigation.navigate('About');
  }

  const onToggleChangeHandler = (isChecked) => {
    setChecked(isChecked);
    toggleTheme();
    setMenuVisible(false);
  };

  const renderThemeToggle = () => (
    <Layout style={{ alignItems: 'center', width: '100%', paddingTop: 5, paddingBottom: 5 }}>
      <Text category='label'>Theme</Text>
      <Divider style={{margin: 5, width: '100%', height: 1}} />
      <Toggle checked={checked} onChange={onToggleChangeHandler}>
        {checked ? "Light" : "Dark"}
      </Toggle>
    </Layout>
  );

  const renderOverflowMenuAction = () => (
    <React.Fragment>
      <OverflowMenu
        anchor={renderMenuAction}
        visible={menuVisible}
        onBackdropPress={toggleMenu}>
        <MenuItem accessoryLeft={InfoIcon} onPress={navigateToAbout} title='About' />
        <MenuItem title={renderThemeToggle} />
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
      style={{ backgroundColor: themeSettings['background-basic-color-1'], paddingTop: safeAreaInsets.top }}
    />
  );
};

const styles = StyleSheet.create({
  titleContainer: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  logo: {
    marginHorizontal: 8,
  },
});