var http = require('http'), //This module provides the HTTP server functionalities
    path = require('path'), //The path module provides utilities for working with file and directory paths
    express = require('express'), //This module allows this app to respond to HTTP Requests, defines the routing and renders back the required content
    fs = require('fs'), //This module allows to work witht the file system: read and write files back
    xmlParse = require('xslt-processor').xmlParse, //This module allows us to work with XML files
    xsltProcess = require('xslt-processor').xsltProcess; //The same module allows us to utilise XSL Transformations

var router = express(); //We set our routing to be handled by Express
var server = http.createServer(router); //This is where our server gets created

router.get('/', function(req, res) {

    res.writeHead(200, {'Content-Type': 'text/html'}); //We are responding to the client that the content served back is HTML and the it exists (code 200)
    var xml = fs.readFileSync('BeautyWellness.xml', 'utf8'); //We are reading in the XML file
    var xsl = fs.readFileSync('BeautyWellness.xsl', 'utf8'); //We are reading in the XSL file
    var doc = xmlParse(xml); //Parsing our XML file
    var stylesheet = xmlParse(xsl); //Parsing our XSL file
    var result = xsltProcess(doc, stylesheet); //This does our XSL Transformation
    res.end(result.toString()); //Send the result back to the user, but convert to type string first

});

server.listen(process.env.PORT || 3000, process.env.IP || "0.0.0.0", function () {

    var addr = server.address();
    console.log("Server listnening at", addr.address + ":" + addr.port);

});