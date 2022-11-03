import React from 'react';
import { useNavigate } from "react-router-dom";

import {
  Breadcrumb,
  BreadcrumbItem,
  Form,
  TextInput,
  TextArea,
  Button,
  Grid,
  Column
} from '@carbon/react';

import userProfileImage from '../../images/userprofile.jpg';
import Card from '../../components/Card/Card';

const UserProfile = (props) => {
  let navigate = useNavigate(); 
  const routeChange = () =>{ 
    let path = `/`; 
    navigate(path);
  }

  const userDetails = {
    company: 'Acme',
    fullName: 'Johnathan Davis',
    username: 'jdavis44',
    email: 'jdavis44@acme.com',
    address: '44 West Ave, Apt 441',
    city: 'Austin',
    state: 'Texas',
    zipcode: '78758',
    aboutMe: 'Enjoys riding bikes, sky diving and swimming'
  };

  return (
    <Grid fullWidth className="userprofile-page">
      <Column lg={16} md={8} sm={4} >
        <Grid className="userprofile-page__banner">
          <Column lg={16} md={4} sm={4}>
            <Breadcrumb noTrailingSlash aria-label="Page navigation">
              <BreadcrumbItem>
                <a href="/">Home</a>
              </BreadcrumbItem>
              <BreadcrumbItem>
                User Profile
              </BreadcrumbItem>
            </Breadcrumb>
          </Column>
          <Column lg={16} md={4} sm={4}>
            <h1 className="userprofile-page__heading">
              User <span style={{fontWeight: 'bold'}}>{userDetails.fullName}</span>
            </h1>
          </Column>
        </Grid>
        <Form>
          <Grid>
            <Column lg={3} md={4} sm={4} style={{textAlign: 'center'}}>
              <Card className="userprofile-page__card">
                <img src={userProfileImage} alt="User" style={{border: '0px solid #000', width: '98%', borderRadius: '5%'}} /><br />
                <span className="userprofile-page__fullnameUnderPic">{userDetails.fullName}</span><br />
                <span className="userprofile-page__usernameUnderPic">{userDetails.username}</span>
              </Card>
            </Column>
            <Column lg={13} md={4} sm={4}>
              <Card className="userprofile-page__card">
                <Grid className="userprofile_page__fields">
                  <Column lg={16} md={4} sm={4}>
                    <Grid>
                      <Column lg={8} md={4} sm={4}>
                        <TextInput 
                          id="company"
                          disabled
                          labelText="Company (Disabled)"
                          value={userDetails.company}
                        />
                      </Column>
                      <Column lg={3} md={4} sm={4}>
                        <TextInput 
                          id="username"
                          labelText="Username"
                          value={userDetails.username}
                        />
                      </Column>
                      <Column lg={5} md={4} sm={4}>
                        <TextInput 
                          id="email"
                          labelText="Email Address"
                          value={userDetails.email}
                        />
                      </Column>
                    </Grid>
                    <Grid>
                      <Column lg={8} md={4} sm={4}>
                        <TextInput 
                          id="firstname"
                          labelText="First Name"
                          value={userDetails.fullName.split(' ').slice(1)}
                        />
                      </Column>
                      <Column lg={8} md={4} sm={4}>
                        <TextInput 
                          id="lastname"
                          labelText="Last Name"
                          value={userDetails.fullName.split(' ').slice(-1)}
                        />
                      </Column>
                    </Grid>
                    <Grid>
                      <Column lg={16} md={4} sm={4}>
                        <TextInput 
                          id="address"
                          labelText="Address"
                          value={userDetails.address}
                        />
                      </Column>
                    </Grid>
                    <Grid>
                      <Column lg={6} md={4} sm={4}>
                        <TextInput 
                          id="city"
                          labelText="City"
                          value={userDetails.city}
                        />
                      </Column>
                      <Column lg={5} md={4} sm={4}>
                        <TextInput 
                          id="state"
                          labelText="State"
                          value={userDetails.state}
                        />
                      </Column>
                      <Column lg={5} md={4} sm={4}>
                        <TextInput 
                          id="zipcode"
                          labelText="Postal Code"
                          value={userDetails.zipcode}
                        />
                      </Column>
                    </Grid>
                    <Grid>
                      <Column lg={16} md={4} sm={4}>
                        <TextArea
                          id="aboutme"
                          labelText="About Me"
                          value={userDetails.aboutMe}
                        />
                      </Column>
                    </Grid>
                  </Column>
                </Grid>
              </Card>
            </Column>
          </Grid>
          <Grid className="userprofile-page__actions">
            <Column lg={16} md={8} sm={4} className="userprofile-page__update">
              <Button type="submit">Update</Button>
              <Button type="button" kind="secondary" onClick={routeChange}>Close</Button>
            </Column>
          </Grid>
        </Form>
      </Column>
    </Grid>
  );
};

export default UserProfile;