'use strict';

const ipc = require('ipc');
const os = require('os');
const fs = require('fs');
const path = require('path');
const util = require('util');

ipc.on('request-read-dir', function (event, arg) {
  const dirPath = arg ? arg : os.homedir();
  const dir = fs.existsSync(dirPath) ? fs.readdirSync(dirPath) : null;
  const stats = fs.statSync(dirPath);
  const result = {
    path: dirPath,
    dir: stats.isDirectory(),
    children: []
  };

  if (dir) {
    dir.forEach(f => {
      var filepath = path.join(dirPath, f);
      var stats = fs.statSync(filepath);
      result.children.push({
        path: filepath,
        dir: stats.isDirectory(),
        mtime: stats.mtime + ''
      });
    })
  }

	event.sender.send('response-read-dir', result);
});
