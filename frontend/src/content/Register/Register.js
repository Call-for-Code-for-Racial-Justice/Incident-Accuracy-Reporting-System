import React from 'react';

import Card from '../../components/Card/Card';
import {
  Form,
  TextInput,
  Button,
} from '@carbon/react';

import { Add } from '@carbon/react/icons';

const getRandomInt = (min, max) => {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min) + min); //The maximum is exclusive and the minimum is inclusive
}

const backgroundImages = require.context('../../images/', true); 
const randBg = backgroundImages('./background-'+ getRandomInt(0,27).toString().padStart(3,'0') +'.jpg');

const Register = (props) => {
  return (
    <div className="register__main" style={{backgroundImage: `url(${randBg})`}}>
      <div className="register__right-pane" >
        <Card className="register">
          <p>{props.title}</p>
          <h2>Register</h2>
          <Form>
            <div className="register__control">
              <TextInput
                id="username"
                required
                placeholder="Username"
              />
            </div>
            <div className="register__control">
              <TextInput
                type="email"
                id="email"
                required
                placeholder="Email"
              />
            </div>
            <div className="register__control">
              <TextInput
                type="password"
                id="password"
                required
                placeholder="Password"
              />
            </div>
            <div className="register__control">
              <TextInput
                type="password"
                id="passwordConfirm"
                required
                placeholder="Repeat Password"
              />
            </div>
            <div className="register__button">
              <Button renderIcon={(props) => <Add size={20} {...props} />} type="submit">Create Account</Button>
            </div>
          </Form>
        </Card>
      </div>
    </div>
  );
};

export default Register;