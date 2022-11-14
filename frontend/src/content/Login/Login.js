import React, { useState, useEffect, useReducer, useContext, useRef } from "react";
import { Link } from 'react-router-dom';

import AuthContext from "../../components/Auth/auth-context";

import Card from '../../components/Card/Card';
import {
  Form,
  TextInput,
  Button,
} from '@carbon/react';

import { ArrowRight } from '@carbon/react/icons';

import staticBg from '../../images/background-013.jpg';

import Register from '../Register/Register';

const getRandomInt = (min, max) => {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min) + min); //The maximum is exclusive and the minimum is inclusive
}

const backgroundImages = require.context('../..//images/', true);
const randBg = backgroundImages('./background-'+ getRandomInt(0,27).toString().padStart(3,'0') +'.jpg');


const emailReducer = (lastState, lastAction) => {
  if (lastAction.type === "USER_INPUT") {
    return {
      value: lastAction.val,
      isValid: lastAction.val === 'demo'
    };
  }
  if (lastAction.type === "INPUT_BLUR") {
    return {
      value: lastState.value,
      isValid: lastState.value === 'demo'
    };
  }
  return {
    value: "",
    isValid: false,
  };
};

const passwordReducer = (lastState, lastAction) => {
  if (lastAction.type === "USER_INPUT") {
    return {
      value: lastAction.val,
      isValid: lastAction.val === 'demo'
    };
  }
  if (lastAction.type === "INPUT_BLUR") {
    return {
      value: lastState.value,
      isValid: lastState.value === 'demo'
    };
  }
  return {
    value: "",
    isValid: false,
  };
};

const Login = (props) => {
  console.log(randBg);
  const [formIsValid, setFormIsValid] = useState(false);

  const [emailState, dispatchEmail] = useReducer(emailReducer, {
    value: '',
    isValid: null
  });

  const [passwordState, dispatchPassword] = useReducer(passwordReducer, {
    value: '',
    isValid: null
  });

  const authCtx = useContext(AuthContext);

  const emailInputRef = useRef();
  const passwordInputRef = useRef();

  const { isValid: emailIsValid } = emailState;
  const { isValid: passwordIsValid } = passwordState;

  useEffect(() => {
    const identifier = setTimeout(() => {
      setFormIsValid(emailIsValid && passwordIsValid);
    }, 500);

    //clean up
    return () => {
      clearTimeout(identifier);
    };
  }, [emailIsValid, passwordIsValid]);

  const emailChangeHandler = (event) => {
    dispatchEmail({ type: "USER_INPUT", val: event.target.value });
  };

  const passwordChangeHandler = (event) => {
    dispatchPassword({ type: "USER_INPUT", val: event.target.value });
  };

  const validateEmailHandler = () => {
    dispatchEmail({ type: "INPUT_BLUR" });
  };

  const validatePasswordHandler = () => {
    dispatchEmail({ type: "INPUT_BLUR" });
  };

  const submitHandler = (event) => {
    event.preventDefault(); 
    if( formIsValid ) {
      authCtx.onLogin();
    } else if ( !emailIsValid ) {
      emailInputRef.current.focus();
    } else {
      passwordInputRef.current.focus();
    }
  };

  return (
    <div className="login__main" style={{backgroundImage: `url(${randBg})`}}>
      <div className="login__right-pane" >
        <Card className="login">
          <p>{props.title}</p>
          <h2>Log in</h2>
          <Form onSubmit={submitHandler}>
            <div className="login__control">
              <TextInput
                ref={emailInputRef}
                id="username"
                required
                placeholder="Username"
                labelText=""
                value={emailState.value}
                onChange={emailChangeHandler}
                onBlur={validateEmailHandler}
              />
            </div>
            <div className="login__control">
              <TextInput
                ref={passwordInputRef}
                type="password"
                id="password"
                required
                placeholder="Password"
                labelText=""
                value={passwordState.value}
                onChange={passwordChangeHandler}
                onBlur={validatePasswordHandler}
              />
            </div>
            <div className="login__button">
              <Button renderIcon={(props) => <ArrowRight size={20} {...props} />} type="submit">Continue</Button>
            </div>
            <div className="login__register">
              <span>Don't have an account?  <Link to="/register">Register</Link></span>
            </div>
          </Form>
        </Card>
      </div>
    </div>
  );
};

export default Login;