import React, { useContext, useState } from "react";
import moment from 'moment';

import { LayoutList } from "../../components/layout-list.component";

import incidentsContext from '../../services/incidents-context.service';

export const IncidentsListScreen = ({ navigation }) => {
  const { incidents } = useContext(incidentsContext);

  const transformedIncidents = incidents.map((x) => {
    return {
      title: x.incidentType,
      description: moment(x.timestamp).format('MM/DD/YYYY hh:mm a'),
    }
  });

  const onItemPress = (index) => {
    const tmpIncident = {
      incident: incidents[index],
    };
    navigation.navigate("Incident Viewer", tmpIncident);
  };

  return <LayoutList data={transformedIncidents} onItemPress={onItemPress} />;
};
