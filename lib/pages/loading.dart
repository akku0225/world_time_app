import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert'; //for using jason decode

//A Uniform Resource Identifier is a sequence of characters used for identification of a particular resource. It enables for the interaction of the representation of the resource over the network using specific protocols.12-Jun-2017
//The example of URI is urn:isbn:0-476-27557-4, whereas the example of URL, is https://google.com. The URI can be used to find resources in HTML, XML, and other files also, whereas, URL can only be used to locate a web page. Each URL can be a URI, whereas all URIs cannot always be URLs.
// Some URIs provide a means of locating and retrieving information resources on a network (either on the Internet or on another private network, such as a computer filesystem or an Intranet), these are Uniform Resource Locators (URLs).
//A URL provides the location of the resource. A URI identifies the resource by name at the specified location or URL.
// Other URIs provide only a unique name, without a means of locating or retrieving the resource or information about it, these are Uniform Resource Names (URNs).
// The web technologies that use URIs are not limited to web browsers. URIs are used to identify anything described using the Resource Description Framework (RDF),
//HTTP Response is the server's information as a result of the client's request. Additionally, it acts as an acknowledgment that the performance of the requested action is successful. In case there is an error in carrying out the client's request, the server responds with an error message.10
//The main aim of URL is to get the location or address of a resource whereas the main aim of URI is to find a resource.
//URL is used to locate only web pages, on the other hand, URI in used in HTML, XML and other file
//A URI search the name as well as the location of a resource or file, which is in a uniform format.
//The Information written in the URL gives you the ability to switch from one web page to another with just one mouse click.
//URL tells you how to access a particular resource.
//WHAT IS URI.parse:   parse methode creates new Uri object by parsing a uri string
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    Response
        response = //get what ever we get if success then the string if fail then error msg
        await get(Uri.parse(
            'https://jsonplaceholder.typicode.com/albums/1')); //this argument will be treated as a string but to fetch data we need URI so uri.parse

    Map data = jsonDecode(response
        .body); //body property is actual json string that we get from get
    // //this looks like a map but actually a string  so we have to decode it to a map
//print (data['title']);after decode we can use it as a map
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("loading page"),
    );
  }
}
