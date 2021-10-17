import React, { useState } from "react";
import { render } from "react-dom";
import {Button, Form, Row, Col, Container} from "react-bootstrap"
import {
  createMemorySource,
  createHistory,
  LocationProvider,
  navigate,
  Router
} from "@reach/router"

// container text-center d-flex align-items-center justify-content-center
const CenterView = (props) => {
  return <Container>
      <Row className="show-grid">
          <Col xs={1} md={4}></Col>
          <Col xs={4} md={4}>{props.children}</Col>
          <Col xs={1} md={4}></Col>
      </Row>
  </Container>
}

const ThanksPage = () => {
  const handleClick = () => {
    navigate('/church/pray_petitions/new', {replace: true})
  }

  return <CenterView>
    <h1>Gracias por enviarnos tu peticion.</h1>
    <Button variant="primary" type="link" onClick={handleClick}>Otra peticion</Button>
  </CenterView>
}

const FormPage = () => {
  const [name, setName] = useState("");
  const [prayPetition, setPrayPetition] = useState("");

  const submitInformation = () => {
    var url = '/church/api/v1/pray_petitions/create';
    // TO-DO stringify the whole form not send pieces
    var data = {
      pray_petition: {
        pray_for: prayPetition,
        pray_from: name
    }};

    fetch(url, {
      method: 'POST',
      body: JSON.stringify(data),
      headers:{
        'Content-Type': 'application/json'
      }
    }).then(rest => {
      console.log(`we have to do something here ${rest}`)
      navigate("/thanks", {replace: true})
    })
    .catch(error => console.error('Error:', error))
  }

  const HandleSubmit = (evt) => {
    evt.preventDefault();
    submitInformation()
  }

  return <CenterView>
    <Row className="show-grid te  xt-center">
      <Col xs={1} md={1}></Col>
      <Col xs={6} md={6}>
        <h2>Peticion de oracion</h2>
      </Col>
      <Col xs={1} md={1}></Col>
    </Row>
    <Form onSubmit={HandleSubmit}>
        <Form.Group className="mb-3" controlId="formBasicEmail">
          <Form.Label>Nombre</Form.Label>
          <Form.Control
            type="text"
            placeholder="Nombre"
            value={name}
            onChange={e => setName(e.target.value)}/>
          <Form.Text className="text-muted">
            No compartimos tu información.
          </Form.Text>
        </Form.Group>

        <Form.Group className="mb-3" controlId="formBasicEmail">
          <Form.Label>Petición</Form.Label>
          <Form.Group className="mb-3" controlId="exampleForm.ControlTextarea1">
          <Form.Control as="textarea"
            rows={3}
            cols={"100"}
            placeholder="Pido oración por..."
            onChange={e => setPrayPetition(e.target.value)}/>
        </Form.Group>
        </Form.Group>
        <Button variant="primary" type="submit">
          Enviar
        </Button>
    </Form>
  </CenterView>
}

const AppV2 = () => (
  <Router>
    <FormPage path="/church/pray_petitions/new" />
    <ThanksPage path="/thanks" />
  </Router>
)

document.addEventListener("DOMContentLoaded", () => {
  render(<AppV2 />, document.getElementById("pray-petition-div"));
});
