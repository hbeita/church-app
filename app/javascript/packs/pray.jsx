import React, { useEffect, useState } from "react";
import {Button, Form, Row, Col, Container, Card} from "react-bootstrap"
import ReactDOM from 'react-dom'
import {Router, navigate, Link} from "@reach/router"

const CenterView = (props) => {
  return <>
  <Container className="d-flex flex-column min-vh-100 justify-content-center align-items-center text-center">
    <blockquote className="blockquote mb-0">
      <p className="bible-verse">
      Esta es la confianza que tenemos al acercarnos a Dios: que, si pedimos conforme a su voluntad, él nos oye.
      </p>
      <footer className="blockquote-footer">
        <p className=" bible-verse">1 Juan 5:14</p>
      </footer>
    </blockquote>
    <Card style={{ width: '24rem' }}>
        {props.children}
    </Card>
  </Container>
  </>
}

export const ThanksPage = () => {
  const handleClick = () => {
    navigate('/acmv_pray', {replace: true}) // change for a link router
  }

  return <CenterView>
  <Card.Header>Gracias</Card.Header>
    <Card.Body>
      <Card.Text>
        Tu peticion ha sido recibida y estaremos orando por ella 🙏🏼
      </Card.Text>
      <Button variant="primary" type="link" onClick={handleClick}>Otra peticion</Button>
    </Card.Body>
  </CenterView>
}

export const FormPage = () => {
  const [name, setName] = useState("");
  const [prayPetition, setPrayPetition] = useState("");

  const submitInformation = () => {
    var url = '/api/v1/prays/create';
    // TO-DO stringify the whole form not send pieces
    var data = {
      pray: {
        submitted_by: prayPetition,
        pray: name
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

    <Card.Header>
    ACMV
    <br />
    <span className="card-sub-header">Peticion de oracion</span>
    </Card.Header>
    <Card.Body>
      <Form onSubmit={HandleSubmit}>
        <Form.Group controlId="formBasicEmail">
          <Form.Label>Nombre</Form.Label>
          <Form.Control
            type="text"
            placeholder="Nombre"
            value={name}
            onChange={e => setName(e.target.value)}/>
        </Form.Group>

        <Form.Group controlId="formBasicEmail">
          <Form.Label>Petición</Form.Label>
          <Form.Group controlId="exampleForm.ControlTextarea1">
          <Form.Control as="textarea"
            rows={5}
            cols={100}
            placeholder="Pido oración por..."
            onChange={e => setPrayPetition(e.target.value)}/>
        </Form.Group>
        </Form.Group>
        <br />
        <Button variant="primary" type="submit">
          Enviar
        </Button>
    </Form>
    </Card.Body>
  </CenterView>
}



const Routes = () => {
  return <Router>
    <ThanksPage path="/thanks" />
    <FormPage path="/acmv_pray" />
  </Router>
};

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Routes />,
    document.getElementById('pray-container'),
  )
})
