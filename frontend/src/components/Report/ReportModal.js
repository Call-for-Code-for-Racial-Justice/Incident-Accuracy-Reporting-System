import React from 'react';
import Moment from 'moment';

import { 
  Modal,
  TextInput,
  Select,
  SelectItem
} from '@carbon/react';

const ReportModal = (props) => {
  const incident = props.incident;
  const formattedDate = Moment(incident.case_date, "MM/DD/YYYY").format('YYYY-MM-DD');

  return (
    <Modal
      open={props.modalIsOpen}
      modalHeading="Edit this incident."
      modalLabel="Incident resources"
      primaryButtonText="Update"
      secondaryButtonText="Cancel"
      onSecondarySubmit={props.modalCancelHandler}
      onRequestClose={props.modalCancelHandler}
    >
    <p style={{ marginBottom: '1rem' }}>
      Remember only certain portions of the incident may be updated.
    </p>
    <TextInput
      data-modal-primary-focus
      id="number"
      labelText="Number"
      value={incident.number}
      style={{ marginBottom: '1rem' }}
      disabled
    />
    <TextInput
      data-modal-primary-focus
      id="location"
      labelText="Location"
      value={incident.location}
      style={{ marginBottom: '1rem' }}
      disabled
    />
    <TextInput 
      id="case_date"
      value={formattedDate}
      labelText="Case Date"
      type="date"
      disabled
    />
    <Select id="incident_type" defaultValue={incident.incident_type} labelText="Incident Type">
      <SelectItem value="Negligence" text="Negligence" />
      <SelectItem value="Harrassment" text="Harrassment" />
      <SelectItem value="Brutality" text="Brutality" />
    </Select>
    <Select id="case_officer" defaultValue={incident.case_officer} labelText="Case Officer">
      <SelectItem value="Harry" text="Harry" />
      <SelectItem value="Rick" text="Rick" />
      <SelectItem value="Simon" text="Simon" />
      <SelectItem value="Bobby" text="Bobby" />
      <SelectItem value="William" text="William" />
      <SelectItem value="David" text="David" />
    </Select>
  </Modal>
  );
}

export default ReportModal;