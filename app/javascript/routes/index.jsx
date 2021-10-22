import React from "react";
import {Router, navigate, Link} from "@reach/router"
import {FormPage, ThanksPage} from '../packs/church/pray_petition'
import PrayPetitions from '../packs/church/pray_petitions'
import {Navbar, Container, Nav} from "react-bootstrap"

export default () => {
  return <>
  <Navbar bg="dark" variant="dark">
    <Container>
      <Navbar.Brand as={Link} to="/">ACMV</Navbar.Brand>
      <Nav className="me-auto">
      <Nav.Link as={Link} to="/">Peticiones</Nav.Link>
        <Nav.Link as={Link} to="/church/pray_petitions/new">Nueva Petición</Nav.Link>
      </Nav>
    </Container>
    </Navbar>
    <br />
    <Router>
      <FormPage path="/church/pray_petitions/new" />
      <ThanksPage path="/thanks" />
      <PrayPetitions path="/"/>
    </Router>
  </>
};
