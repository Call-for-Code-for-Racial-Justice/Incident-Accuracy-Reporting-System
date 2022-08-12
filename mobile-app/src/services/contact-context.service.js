import React, { useState, createContext } from 'react';

const contactContext = createContext({
  contactDetails: {},
  setIncidentId: (value) => {},
  setPhoneNumber: (value) => {},
  setEmailAddress: (value) => {},
  setPhoneContactOption: (value) => {},
  setContactOption: (value) => {},
  resetContactDetails: () => {}
});

export const ContactContextProvider = (props) => {
  const [contactDetails, setContactDetails] = useState({
    incidentId: null,
    emailAddress: null,
    phoneNumber: null,
    phoneContactOption: 'Call',
    contactOption: 'E-Mail'
  });

  const resetContactDetailsHandler = () => {
    setContactDetails({
      incidentId: null,
      emailAddress: null,
      phoneNumber: null,
      phoneContactOption: 'Call',
      contactOption: 'E-Mail'
    });
  }

  const setIncidentIdHandler = (newValue) => {
    setContactDetails(
      (prevState) => ({
        ...prevState,
        incidentId: newValue
      })
    );
  };

  const setEmailAddressHandler = (newValue) => {
    setContactDetails(
      (prevState) => ({
        ...prevState,
        emailAddress: newValue
      })
    );
  };

  const setPhoneNumberHandler = (newValue) => {
    setContactDetails(
      (prevState) => ({
        ...prevState,
        phoneNumber: newValue
      })
    );
  };

  const setPhoneContactOptionHandler = (newValue) => {
    setContactDetails(
      (prevState) => ({
        ...prevState,
        phoneContactOption: newValue
      })
    );
  };

  const setContactOptionHandler = (newValue) => {
    setContactDetails(
      (prevState) => ({
        ...prevState,
        contactOption: newValue
      })
    );
  }

  return (
    <contactContext.Provider
      value={{
        contactDetails: contactDetails,
        setIncidentId: setIncidentIdHandler,
        setPhoneNumber: setPhoneNumberHandler,
        setEmailAddress: setEmailAddressHandler,
        setPhoneContactOption: setPhoneContactOptionHandler,
        setContactOption: setContactOptionHandler,
        resetContactDetails: resetContactDetailsHandler
      }}
    >
      {props.children}
    </contactContext.Provider>
  );
};

export default contactContext;