import React from 'react';
import {
  useSafeAreaInsets,
} from 'react-native-safe-area-context';
import {
  Layout,
  useTheme,
} from '@ui-kitten/components';

export const SafeAreaLayout = ({
  insets,
  ...props
}) => {
  const theme = useTheme();
  const insetsConfig = useSafeAreaInsets();
  const backgroundColor = theme[`background-basic-color-${props.level}`];

  return (
    <Layout
      {...props}
      style={[
        props.style,
        backgroundColor && { backgroundColor },
        {
          paddingTop: insets === 'top' ? insetsConfig.top : 0,
          paddingBottom: insets === 'bottom' ? insetsConfig.bottom : 0,
        },
      ]}
    />
  );
};
