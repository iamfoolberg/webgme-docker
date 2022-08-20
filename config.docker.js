'use strict';
var config = require('./config.default');
console.info('### Running in docker mode ####');
module.exports = config;

//config your mongo db url
config.mongo.uri = 'mongodb://127.0.0.1:27017/mywebgme';

//do not change this port, map it in your docker container.
config.server.port=8888;