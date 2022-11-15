import React from 'react';
import { useNavigate } from "react-router-dom";

import {
  Breadcrumb,
  BreadcrumbItem,
  FileUploaderDropContainer,
  Form,
  FormGroup,
  TextInput,
  Select,
  SelectItem,
  TextArea,
  Button,
  Grid,
  Column
} from '@carbon/react';

import Card from '../../components/Card/Card';

const NewReport = () => {
  let navigate = useNavigate(); 
  const routeChange = () =>{ 
    let path = `/`; 
    navigate(path);
  }

  return (
    <Grid className="newreport-page" fullWidth>
      <Column lg={16} md={8} sm={4}>
        <Grid className="newreport-page__banner">
          <Column lg={16} md={4} sm={4}>
            <Breadcrumb noTrailingSlash aria-label="Page navigation">
              <BreadcrumbItem>
                <a href="/">Home</a>
              </BreadcrumbItem>
              <BreadcrumbItem>
                New Report
              </BreadcrumbItem>
            </Breadcrumb>
          </Column>
          <Column lg={16} md={4} sm={4} >
            <h1 className="newreport-page__heading">
              New <span style={{fontWeight: 'bolder'}}>Witness Report</span>
            </h1>
          </Column>
        </Grid>
        <Form>
          <Grid>
            <Column lg={10} md={4} sm={4}>
              <Card className="newreport-page__card">
                <h4>Incident</h4>
                <Select id="incident_type" defaultValue="placeholder-item" >
                  <SelectItem disabled hidden value="placeholder-item" text="Choose an option" />
                  <SelectItem value="po_h" text="Police Harrassment" />
                  <SelectItem value="po_b" text="Police Brutality" />
                </Select>
                <TextInput 
                  id="case_number"
                  placeholder="Case Number"
                  labelText="Case Number"
                />
                <TextInput 
                  id="date"
                  placeholder="Date"
                  labelText="Date"
                  type="date"
                />
                <TextInput 
                  id="time"
                  labelText="Select a time"
                  type="time"
                />
                <TextArea
                  id="incident_description"
                  labelText="Please describe incident"
                />
                <Select id="audio_language" defaultValue="placeholder-item" >
                  <SelectItem disabled hidden value="placeholder-item" text="Choose an option" />
                  <SelectItem value="lang_eng" text="English" />
                  <SelectItem value="lang_esp" text="Spanish" />
                  <SelectItem value="lang_fr"  text="French" />
                  <SelectItem value="lang_it"  text="Italian" />
                  <SelectItem value="lang_jap" text="Japanese" />
                  <SelectItem value="lang_sk"  text="Korean" />
                </Select>
              </Card>
            </Column>
            <Column lg={6} md={4} sm={4}>
              <Card className="newreport-page__card">
                <h4>Address</h4>
                <TextInput 
                  id="street"
                  placeholder="Street"
                  labelText="Street"
                />
                <TextInput 
                  id="city"
                  placeholder="City"
                  labelText="City"
                />
                <TextInput 
                  id="state"
                  placeholder="State"
                  labelText="State"
                />
                <TextInput 
                  id="zipcode"
                  placeholder="Zip Code"
                  labelText="Zip Code"
                />
              </Card>
            </Column>
          </Grid>
          <Grid>
            <Column lg={16} md={8} sm={4} className="newreport-page__r2">
              <Card className="newreport-page__card">
                <h4>Upload Files (Audio, Video)</h4>
                <FormGroup legendText="">
                  <FileUploaderDropContainer 
                    id="files"
                    labelText="Drag and drop files here or click to upload"
                  />
                </FormGroup>
              </Card>
            </Column>
          </Grid>
          <Grid className="newreport-page__actions">
            <Column lg={16} md={8} sm={4} className="newreport-page__save">
              <Button type="submit">Save</Button>
              <Button type="button" kind="secondary" onClick={routeChange}>Cancel</Button>
            </Column>
          </Grid>
        </Form>
      </Column>
    </Grid>
  );
};

export default NewReport;