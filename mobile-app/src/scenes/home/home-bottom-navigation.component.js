import React, { useEffect, useRef } from 'react';
import { Animated } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { Icon } from '@ui-kitten/components';
import { BottomNavigationTab, Divider, StyleService, useTheme } from '@ui-kitten/components';

import { BrandBottomNavigation } from '../../components/brand-bottom-navigation.component';

const useVisibilityAnimation = (visible) => {
  const animation = useRef(new Animated.Value(visible ? 1 : 0));

  useEffect(() => {
    Animated.timing(animation.current, {
      duration: 200,
      toValue: visible ? 1 : 0,
      useNativeDriver: true,
    }).start();
  }, [visible]);

  return {
    transform: [
      {
        // @ts-ignore
        translateY: animation.current.interpolate({
          inputRange: [0, 1],
          outputRange: [50, 0],
        }),
      },
    ],
    position: visible ? null : 'absolute',
  };
};

export const HomeBottomNavigation = ({ navigation, state, descriptors }) => {
  const focusedRoute = state.routes[state.index];
  const { tabBarVisible } = descriptors[focusedRoute.key].options;
  const safeAreaInsets = useSafeAreaInsets();
  const themeSettings = useTheme();

  const transforms = useVisibilityAnimation(tabBarVisible);

  const onSelect = (index) => {
    navigation.navigate(state.routeNames[index]);
  };

  return (
    <Animated.View style={[styles.container, transforms, { backgroundColor: themeSettings['background-basic-color-1'], paddingBottom: tabBarVisible ? safeAreaInsets.bottom : 0 }]}>
      <Divider />
      <BrandBottomNavigation
        appearance='noIndicator'
        selectedIndex={state.index}
        onSelect={onSelect}>

        <BottomNavigationTab
          title='Incidents'
          icon={<Icon name='archive-outline'/>}
        />
        <BottomNavigationTab
          title='Create'
          icon={<Icon name='plus-circle-outline'/>}
        />
      </BrandBottomNavigation>
    </Animated.View>
  );
};

const styles = StyleService.create({
  container: {
    left: 0,
    right: 0,
    bottom: 0,
  },
});
