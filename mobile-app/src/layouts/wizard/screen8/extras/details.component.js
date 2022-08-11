import React from 'react';
import { Dimensions, StyleSheet } from "react-native";

import {
  Divider,
  IndexPath,
  Input,
  Layout,
  RadioGroup,
  Radio,
  Select,
  SelectItem,
  Text
} from "@ui-kitten/components";

export const DetailScreen = () => {
  const phoneOptions = ['Call', 'Text'];
  const contactOptions = ['E-Mail', 'Phone'];
  const [phoneMethodIndex, setPhoneMethodIndex] = React.useState(new IndexPath(0));
  const [contactMethodIndex, setContactMethodIndex] = React.useState(new IndexPath(0));

  return (
    <Layout style={styles.contentContainer} >
      <Input
        placeholder='Enter your e-mail'
        label="E-Mail address"
        style={styles.infoInput}
        keyboardType="email-address"
        textContentType="emailAddress"
      />
      <Divider style={styles.divider} />
      <Input
        placeholder='Enter your phone numer'
        label="Phone number"
        style={styles.infoInput}
        keyboardType="phone-pad"
        textContentType="telephoneNumber"
      />
      <Select
        label="Preferred"
        value={phoneOptions[phoneMethodIndex.row]}
        selectedIndex={phoneMethodIndex}
        onSelect={index => setPhoneMethodIndex(index)}
        >
          <SelectItem title='Call' />
          <SelectItem title='Text' />
      </Select>
      <Divider style={styles.divider} />
      <Select
        label="Preferred contact method"
        value={contactOptions[contactMethodIndex.row]}
        selectedIndex={contactMethodIndex}
        onSelect={index => setContactMethodIndex(index)}>
          <SelectItem title='E-mail'/>
          <SelectItem title='Phone'/>
      </Select>
    </Layout>
  );
};

const styles = StyleSheet.create({
  contentContainer: {
    flex: 1,
    padding: 10
  },
  infoInput: {
    margin: 2
  },
  divider: {
    marginTop: 10,
    marginBottom: 10
  }
});