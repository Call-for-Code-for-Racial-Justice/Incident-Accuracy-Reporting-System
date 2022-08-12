import React, { useContext, useRef, useState, useEffect } from 'react';
import { Dimensions, ScrollView, StyleSheet, View } from "react-native";

import * as Location from 'expo-location';

import MapView, { Marker } from 'react-native-maps';

import {
  Input,
  Layout,
  Text,
} from "@ui-kitten/components";

import wizardIncidentContext from "../../services/wizard-incident-context.service";

export default () => {
  const { incident, setGPS, setTextLocation } = useContext(wizardIncidentContext);

  const [location, setLocation] = useState(incident.gps == null ? null : { coords: incident.gps });
  const [errorMsg, setErrorMsg] = useState(null);
  const [textLocationInput, setTextLocationInput] = useState(incident.textLocation==null ? '' : incident.textLocation);

  const textLocationInputRef = useRef(null);

  useEffect(() => {
    (async () => {
      let { status } = await Location.requestForegroundPermissionsAsync();
      if (status !== 'granted') {
        setErrorMsg('Permission to access location was denied');
        return;
      }

      let location = await Location.getCurrentPositionAsync({});
      setLocation(location);
      setGPS({
        latitude: location.coords.latitude,
        longitude: location.coords.longitude
      });
    })();
  }, []);

  let text = 'Waiting..';
  if (errorMsg) {
    text = errorMsg;
  } else if (location) {
    text = JSON.stringify(location);
  }

  const RenderMap = () => {
    const gps = location.coords;

    return (
      <View style={styles.gpsContentContainer}>
        <MapView
          style={styles.map}
          initialRegion={{
            latitude: gps.latitude,
            longitude: gps.longitude,
            latitudeDelta: 0.05,
            longitudeDelta: 0.04,
          }}
        >
          <Marker coordinate={gps} />
        </MapView>
      </View>
    );
  };

  const onTextLocationChangeHandler = (newValue) => {
    setTextLocationInput(newValue);
  }

  const onTextLocationEndEditingHandler = () => {
    setTextLocation(textLocationInput);
  }

  return (
    <Layout style={styles.contentContainer}>
      {location &&
        <>
          <Text category='h5' style={styles.textContainer}>GPS detected.</Text>
          <RenderMap />
        </>
      }
      {!location &&
        <Layout style={styles.notFoundContainer}>
          <Text status='danger' category='h6' style={styles.textContainer}>Location not detected.</Text>
          <ScrollView style={styles.container}>
            <Input
              label="Please describe the location?  (Add cross streets or near businesses)"
              multiline={true}
              textStyle={styles.descriptionContainer}
              placeholder="Describe the location."
              value={textLocationInput}
              onChangeText={newValue => onTextLocationChangeHandler(newValue)}
              onEndEditing={event => onTextLocationEndEditingHandler(event)}
              ref={textLocationInputRef}
            />
          </ScrollView>
        </Layout>
      }
    </Layout>
  );
};

const styles = StyleSheet.create({
  contentContainer: {
    flex: 1,
    minHeight: '100%'
  },
  gpsContentContainer: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
    maxWidth: '100%',
    maxHeight: '100%',
    //maxHeight: Dimensions.get('window').height*0.30+24,
  },
  map: {
    flex: 25,
    width: '100%',
    minHeight: Dimensions.get('window').height * 0.40
  },
  textContainer: {
    paddingBottom: 10
  },
  locationDescriptionContainer: {
    minHeight: 100
  },
  notFoundContainer: {
    flex: 1,
    width: '95%',
    minHeight: '90%',
    margin: 10
  },
  descriptionContainer: {
    minHeight: 100
  }
});