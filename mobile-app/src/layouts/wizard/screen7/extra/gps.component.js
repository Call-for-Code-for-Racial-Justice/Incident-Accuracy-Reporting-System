import React, { useContext } from 'react';

import { GPSContent, GPSDescriptionContent } from './render-items.component';

import wizardIncidentContext from '../../../../services/wizard-incident-context.service';

const GPSScreen = () => {
  const { incident } = useContext(wizardIncidentContext);
  const gps = incident.gps;

  return (
    <>
      { gps && <GPSContent gps={gps} /> }
      { !gps && <GPSDescriptionContent textLocation={incident.textLocation} /> }
    </>
  );
};

export default GPSScreen;