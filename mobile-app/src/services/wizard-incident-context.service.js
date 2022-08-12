import React, { useState, createContext } from 'react';

const wizardIncidentContext = createContext({
  incident: {},
  setTimestamp: (newTimestamp) => { },
  setIsLive: (newisLive) => { },
  setIsDraft: (newDraft) => { },
  setTextLocation: (newTextLocation) => { },
  setGps: (newLatitude, newLongitude) => { },
  setIncidentType: (newType) => { },
  setViewpoint: (newView) => { },
  setDescription: (newDescription) => { },
  setFiles: (newFiles) => { },
  resetId: () => { },
});

export const WizardIncidentContextProvider = (props) => {
  const [incident, setIncident] = useState({
    id: null,
    timestamp: null,
    isLive: null,
    isDraft: null,
    textLocation: null,
    gps: null,
    incidentType: null,
    viewpoint: null,
    description: null,
    files: null
  });

  const setIdHandler = () => {
    if( incident.id==null ) {
      const tmpId = Math.random().toString(36).slice(2).toUpperCase();
      setIncident(
        (prevState) => ({
          ...prevState,
          id: tmpId,
          isDraft: true
        })
      );
    }
  };

  const resetIdHandler = () => {
    setIncident({
      id: null,
      timestamp: null,
      isLive: null,
      isDraft: null,
      textLocation: null,
      gps: null,
      incidentType: null,
      viewpoint: null,
      description: null,
      files: null
    })
  }

  setIdHandler();

  const setTimestampHandler = (newValue) => {
    setIncident(
      (prevState) => ({
        ...prevState,
        timestamp: newValue
      })
    );
  };

  const setIsLiveHandler = (newValue) => {
    setIncident(
      (prevState) => ({
        ...prevState,
        isLive: newValue
      })
    );
  };

  const setIsDraftHandler = (newValue) => {
    setIncident(
      (prevState) => ({
        ...prevState,
        isDraft: newValue
      })
    );
  };

  const setTextLocationHandler = (newValue) => {
    setIncident(
      (prevState) => ({
        ...prevState,
        textLocation: newValue
      })
    );
  };

  const setGpsHandler = ({ latitude, longitude }) => {
    setIncident(
      (prevState) => ({
        ...prevState,
        gps: { latitude: latitude, longitude: longitude }
      })
    );
  };

  const setIncidentTypeHandler = (newValue) => {
    setIncident(
      (prevState) => ({
        ...prevState,
        incidentType: newValue
      })
    );
  };

  const setViewpointHandler = (newValue) => {
    setIncident(
      (prevState) => ({
        ...prevState,
        viewpoint: newValue
      })
    );
  };

  const setDescriptionHandler = (newValue) => {
    setIncident(
      (prevState) => ({
        ...prevState,
        description: newValue
      })
    );
  };

  const setFilesHandler = (newFiles) => {
    setIncident(
      (prevState) => ({
        ...prevState,
        files: newFiles
      })
    );
  };

  return (
    <wizardIncidentContext.Provider
      value={{
        incident: incident,
        setIsLive: setIsLiveHandler,
        setId: setIdHandler,
        setTimestamp: setTimestampHandler,
        setIsDraft: setIsDraftHandler,
        setTextLocation: setTextLocationHandler,
        setGPS: setGpsHandler,
        setIncidentType: setIncidentTypeHandler,
        setViewpoint: setViewpointHandler,
        setDescription: setDescriptionHandler,
        setFiles: setFilesHandler,
        resetId: resetIdHandler
      }}
    >
      {props.children}
    </wizardIncidentContext.Provider>
  );
};

export default wizardIncidentContext;