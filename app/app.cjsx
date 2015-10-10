React = require 'react'
ReactDom = require 'react-dom'
{ Link } = require 'react-router'
{
  Navbar, NavBrand,
  Grid, Row, Col
} = require 'react-bootstrap'

Header = require './header.cjsx'
SideBar = require './sidebar.cjsx'
Body = require './body.cjsx'

window.React = React
window.ReactDom = ReactDom

module.exports = React.createClass
  render: ->
    <div>
      <Header />
        <Row className="body">
          <Col xs={12}><Body /></Col>
        </Row>
    </div>
