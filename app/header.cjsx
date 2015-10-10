React = require 'react'
ReactDom = require 'react-dom'
{
  Col, CollapsibleNav
  ButtonToolbar, ButtonGroup, Button
  Input
  Nav, Navbar, NavBrand, NavItem,
} = require 'react-bootstrap'
{ Link } = require 'react-router'
{ LinkContainer } = require 'react-router-bootstrap'
Package = require '../package.json'

window.React = React
window.ReactDom = ReactDom

module.exports = React.createClass
  render: ->
      searchButton = <Button>search</Button>

      <Navbar inverse fixedTop={yes} toggleNavKey={0}>
        <CollapsibleNav eventKey={0}>
          <Nav navbar>
            <ButtonToolbar className="navbar-form">
              <ButtonGroup>
                <Button>&lt;</Button>
                <Button>&gt;</Button>
              </ButtonGroup>
            </ButtonToolbar>
          </Nav>
          <Nav navbar right>
            <div className="navbar-form">
              <Input type="text" buttonAfter={searchButton} />
            </div>
          </Nav>
        </CollapsibleNav>
      </Navbar>
