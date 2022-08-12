import React, { useState, createContext } from 'react';

import { data } from './data';

const incidentsContext = createContext({
  incidents: [],
  updateIncidents: (op, item) => {},
});

export const IncidentsContextProvider = (props) => {
  const [incidents, setIncidents] = useState(data);

  const updateIncidentsHandler = (op, item) => {
    if( op==='ADD' ) {
      setIncidents( oldArray => [...oldArray, item] );
    } else if ( op==='REMOVE' ) {
      setIncidents(incidents.filter( x => x.id !== item.id));
    }
  };

  return (
    <incidentsContext.Provider
      value={{
        incidents: incidents,
        updateIncidents: updateIncidentsHandler
      }}
    >
      {props.children}
    </incidentsContext.Provider>
  );
};

export default incidentsContext;