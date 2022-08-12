import React, { useContext, useState } from 'react';
import { Dimensions, StyleSheet } from "react-native";

import {
  Divider,
  IndexPath,
  Input,
  Layout,
  Select,
  SelectItem,
} from "@ui-kitten/components";

import contactContext from '../../../../services/contact-context.service';

export const DetailScreen = () => {
  const { setEmailAddress, setPhoneNumber, setContactOption, setPhoneContactOption } = useContext(contactContext);

  const [emailAddressInput, setEmailAddressInput] = useState('');
  const [phoneNumberInput, setPhoneNumberInput] = useState('');
  const [phoneMethodIndex, setPhoneMethodIndex] = useState(new IndexPath(0));
  const [contactMethodIndex, setContactMethodIndex] = useState(new IndexPath(0));

  const phoneOptions = ['Call', 'Text'];
  const contactOptions = ['E-Mail', 'Phone'];

  const onEmailAddressEndEditingHandler = () => {
    setEmailAddress(emailAddressInput);
  }

  const onPhoneNumberEndEditingHandler = () => {
    setPhoneNumber(phoneNumberInput);
  }

  const phoneContactOptionOnSelectHandler = (index) => {
    setPhoneMethodIndex(index);
    setPhoneContactOption(index==1?'call':'text');
  }

  const contactOptionOnSelectHandler = (index) => {
    setContactMethodIndex(index);
    setContactOption(index==1?'call':'text');
  }

  return (
    <Layout style={styles.contentContainer} >
      <Input
        placeholder='Enter your e-mail'
        label="E-Mail address"
        style={styles.infoInput}
        keyboardType="email-address"
        textContentType="emailAddress"
        value={emailAddressInput}
        onChangeText={(newValue) => setEmailAddressInput(newValue)}
        onEndEditing={(event) => onEmailAddressEndEditingHandler(event)}
      />
      <Divider style={styles.divider} />
      <Input
        placeholder='Enter your phone numer'
        label="Phone number"
        style={styles.infoInput}
        keyboardType="phone-pad"
        textContentType="telephoneNumber"
        value={phoneNumberInput}
        onChangeText={(newValue) => setPhoneNumberInput(newValue)}
        onEndEditing={(event) => onPhoneNumberEndEditingHandler(event)}
      />
      <Select
        label="Preferred"
        value={phoneOptions[phoneMethodIndex.row]}
        selectedIndex={phoneMethodIndex}
        onSelect={phoneContactOptionOnSelectHandler}
        >
          <SelectItem title='Call' />
          <SelectItem title='Text' />
      </Select>
      <Divider style={styles.divider} />
      <Select
        label="Preferred contact method"
        value={contactOptions[contactMethodIndex.row]}
        selectedIndex={contactMethodIndex}
        onSelect={contactOptionOnSelectHandler}>
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