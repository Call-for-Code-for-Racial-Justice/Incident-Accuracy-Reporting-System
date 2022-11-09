import React from 'react';
import { StyleSheet } from 'react-native';
import { Card, List, Text } from '@ui-kitten/components';

export const LayoutList = (props) => {
  const { contentContainerStyle, onItemPress, ...listProps } = props;

  const renderItem = (info) => {
    return (
      <Card
        style={styles.itemContainer}
        onPress={() => onItemPress(info.index)}
        >
        <Text
          category='s1'>
          {info.item.title}
        </Text>
        <Text
          style={styles.itemDescription}
          appearance='hint'>
          {info.item.description}
        </Text>
      </Card>
    )
  };

  return (
    <List
      {...listProps}
      contentContainerStyle={[styles.container, contentContainerStyle]}
      renderItem={renderItem}
    />
  );
};

const styles = StyleSheet.create({
  container: {
    paddingHorizontal: 8,
    paddingVertical: 8,
  },
  itemContainer: {
    marginVertical: 8,
    marginHorizontal: 8,
  },
  itemDescription: {
    marginTop: 4,
  },
});
