import React, { useContext, useState } from 'react';
import moment from 'moment';
import { ActivityIndicatorComponent, StyleSheet } from "react-native";

import {
  Divider,
  Datepicker,
  Icon,
  Input,
  Layout,
  Text,
} from "@ui-kitten/components";

import wizardIncidentContext from '../../services/wizard-incident-context.service';

const CalendarIcon = (props) => (
  <Icon {...props} name='calendar' />
);

const renderTime = (d) => {
  let strTime = moment(d).format('h:mm a');
  return strTime;
}

const NOW = new Date();

const TIME_ERROR_MSG_EXAMPLE = "Examples: 11:13 am or 2:00 pm";
const TIME_ERROR_MSG_LINE = "Time format incorrect."
const TIME_REGEX_MATCH = new RegExp("^(1[0-2]|0?[1-9]):[0-5][0-9] (AM|PM)$", "i");

export default () => {
  const { incident, setTimestamp } = useContext(wizardIncidentContext);
  
  const [date, setDate] = useState(incident.timestamp==null ? NOW : new Date().setTime(incident.timestamp));
  const [time, setTime] = useState(incident.timestamp==null ? '' : renderTime(new Date().setTime(incident.timestamp)));
  const [error, setError] = useState(null);

  const onTimeChangeHandler = (newTime) => {
    const result = TIME_REGEX_MATCH.test(newTime);
    if( result ) {
      setError(null);
      setTimeComponent(newTime);
    } else {
      setError(TIME_ERROR_MSG_LINE);
    }
    setTime(newTime);
  }

  const setTimeComponent = (t) => {
    try { 
      const dateOnly = moment(date).format('L');
      const strDate = moment(dateOnly +' '+ t, 'MM/DD/YYYY hh:mm a').format();
      const newDate = moment(strDate).toDate();

      setDate(newDate);
      setTimestamp(newDate.getTime());
    } catch(e) {
      console.error(e);
      setError(e);
    }
  }

  return (
    <Layout style={styles.container}>
      <Text category='h6' style={styles.titleContainer}>When did this event occur?</Text>
      <Divider />
      <Datepicker
        label='Select date'
        placeholder='Pick Date'
        date={date}
        onSelect={nextDate => setDate(nextDate)}
        accessoryRight={CalendarIcon}
        style={styles.inputContainer}
      />
      <Input
        label='Enter time'
        placeholder={renderTime(NOW)}
        disabled={false}
        value={time}
        style={styles.inputContainer}
        keyboardType="default"
        textContentType="none"
        onChangeText={newValue => onTimeChangeHandler(newValue)}
      />
      <Text category='s1' appearance='hint'>{TIME_ERROR_MSG_EXAMPLE}</Text>
      { error && <Text style={styles.errorText} category='h5' status='danger'>{error}</Text>}
    </Layout>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    width: '100%'
  },
  titleContainer: {
    marginTop: 15,
    marginBottom: 15
  },
  contentContainer: {
    flex: 1,
    width: '100%',
    marginTop: 15
  },
  inputContainer: {
    width: '90%',
    paddingTop: 10,
    paddingBottom: 10
  },
  errorText: {
    marginTop: 20
  }
});