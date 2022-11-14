import React, { useContext } from "react";
import { Routes, Route } from 'react-router-dom';

import { Content, Theme } from '@carbon/react';

import AuthContext from './components/Auth/auth-context';

import NavHeader from "./components/NavHeader/NavHeader";
import Dashboard from "./content/Dashboard/Dashboard";
import Login from './content/Login/Login';
import NewReport from './content/NewReport/NewReport';
import Register from "./content/Register/Register";
import UserProfile from "./content/UserProfile/UserProfile";

import "./app.scss";

const App = () => {
  const ctx = useContext(AuthContext);

  return (
    <>
      {ctx.isLoggedIn && 
        <Theme theme="g100">
          <NavHeader title="React Carbon Dashboard" />
        </Theme>
      }
      <Routes>
        <Route path="/" element={
          ( !ctx.isLoggedIn && <Login title="React Carbon Dashboard" /> ) || <Content><Dashboard /></Content>
          } />
        <Route path="/register" element={ <Register/> } />
        <Route path="/newreport" element={
          ( !ctx.isLoggedIn && <Login title="React Carbon Dashboard" /> ) || <Content><NewReport/></Content>
          } />
        <Route path="/userprofile" element={
          ( !ctx.isLoggedIn && <Login title="React Carbon Dashboard" /> ) || <Content><UserProfile/></Content>
          } />
      </Routes>
    </>
  );
};

export default App;