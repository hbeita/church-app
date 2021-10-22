import React, { Children, useEffect, useState } from "react";
import {Button, Row, Col, Container, Table} from "react-bootstrap"
import {
  navigate
} from "@reach/router"


const PrayPetitionTr = ({petition}) => {
  return <tr >
    <td>{petition.pray_from}</td>
    <td>{petition.pray_for}</td>
  </tr>
}

const PrayPetitionsTable = () => {
  const [prayPetitions, setPrayPetitions] = useState([]);

  useEffect(() => {
    fetch('/church/api/v1/pray_petitions/index', {
      method: 'GET'
    }).then(response => response.json())
      .then(data => setPrayPetitions(data))
      .catch(error => console.error('Error:', error))
    console.log("setting petitions");
  }, []);

  return <Table striped bordered hover>
    <thead>
      <tr>
        <th>Peticion de</th>
        <th>Peticion</th>
      </tr>
    </thead>
    <tbody>
    {
      prayPetitions.map((petition) =>
        <PrayPetitionTr petition={petition} key={`petition${petition.id}`}/>
      )
    }
    </tbody>
  </Table>
}

/*
<td><%= link_to 'Show', church_pray_petition %></td>
        <td><%= link_to 'Edit', edit_church_pray_petition_path(church_pray_petition) %></td>
        <td><%= link_to 'Destroy', church_pray_petition, method: :delete, data: { confirm: 'Are you sure?' } %></td>
        */

const PrayPetitionsIndex = () => {
  const HandleClick = () => {
    navigate('/church/pray_petitions/new', { replace: true })
  }

  return <>
    <div style={{marginTop: `20px`}} />
    <PrayPetitionsTable />
    <Button variant="primary" onClick={HandleClick}>Nueva Peticion</Button>
  </>
}

export default (
  PrayPetitionsIndex
)
