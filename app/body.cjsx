React = require 'react'
ReactDom = require 'react-dom'
{
  Table
} = require 'react-bootstrap'

window.React = React
window.ReactDom = ReactDom

module.exports = React.createClass
  getInitialState:  ->
    return currentFiles: [], stack: []

  onReadDir: (file) ->
    stack = @state.stack
    stack.push file.path
    @setState currentFiles: file.children, stack: stack
    console.log stack

  componentDidMount: ->
    ipc.on 'response-read-dir', @onReadDir
    ipc.send 'request-read-dir'

  onClickFile: (i) ->
    file = @state.currentFiles[i]
    if file.dir
      ipc.send 'request-read-dir', file.path

  render: ->
    self = this
    files = @state.currentFiles.map (file, i) =>
      <tr onClick={self.onClickFile.bind(self, i)} key={i}>
        <td>{file.path}</td>
        <td>{file.mtime + ''}</td>
      </tr>

    <div>
      <Table condensed hover>
        <thead>
          <tr>
            <th>Name</th>
            <th>Modified Time</th>
          </tr>
        </thead>
        <tbody>
          {files}
        </tbody>
      </Table>
    </div>
