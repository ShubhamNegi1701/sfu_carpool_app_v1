import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const GoogleApiKey = "AIzaSyDMIiuEny9d4SrnacqdU7-0_c8YgdvaVjg";
const LatLng _vancouver = const LatLng(49.2827, -123.1207);

GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: GoogleApiKey);

Set<Marker> markers = Set();
Set<Polyline> polyLines = Set();

class MainMapPage extends StatefulWidget {
  @override
  Map createState() => Map();
}

class Map extends State<MainMapPage> {
  var startController = new TextEditingController();
  List<String> _campuses = ['SFU Burnaby', 'SFU Surrey', 'SFU Vancouver'];

  String _destinationId;
  LatLng _destination;
  bool _destinationInitialized = false;
  LatLng _start;
  bool _startInitialized = false;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        body: new Stack(
          children: <Widget>[
            new GoogleMap(
              initialCameraPosition: new CameraPosition(
                target: _vancouver,
                zoom: 10.0,
              ),
              markers: markers,
              polylines: polyLines,
            ),
            new Positioned(
              top: 10,
              right: 15,
              left: 15,
              child: Container(
                color: Colors.white,
                child: new Column(
                  children: [
                    new TextFormField(
                      onTap: () async {
                        Prediction startPrediction = await PlacesAutocomplete.show(
                            context: context,
                            apiKey: GoogleApiKey,
                            mode: Mode.overlay,
                            location: new Location(49.2827, -123.1207),
                            radius: 10000);
                        predictLocation(startPrediction);
                      },
                      decoration: new InputDecoration(
                          hintText: 'Select your starting point'
                      ),
                      controller: startController,
                    ),
                    new DropdownButton(
                      hint: Text('Select your destination'),
                      value: _destinationId,
                      onChanged: (newValue){
                        if(newValue == 'SFU Burnaby'){
                          setState(() {
                            _destination = new LatLng(49.2787, -122.9192);
                            _destinationId = newValue;
                            _destinationInitialized = true;
                          });
                        }
                        else if(newValue == 'SFU Surrey'){
                          setState(() {
                            _destination = new LatLng(49.1867, -122.8494);
                            _destinationId = newValue;
                            _destinationInitialized = true;
                          });
                        }
                        else if(newValue == 'SFU Vancouver'){
                          setState(() {
                            _destination = new LatLng(49.2846, -123.1115);
                            _destinationId = newValue;
                            _destinationInitialized = true;
                          });
                        }
                        replaceMarkers();
                      },
                      items: _campuses.map((location) {
                        return new DropdownMenuItem(
                          value: location,
                          child: new Text(location),
                        );
                      }).toList(),
                    ),
                    new RaisedButton(
                        onPressed: () async {
                          String route = await getRoute(_start, _destination);
                          drawRoute(route);
                        }
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void replaceMarkers () async {
    markers = {};
    addMarker(_start, 'start', _startInitialized);
    addMarker(_destination, _destinationId, _destinationInitialized);
  }

  void addMarker (LatLng newMarker, String newId, bool initialized) async {
    if(initialized) {
      setState(() {
        markers.add(Marker(
          markerId: MarkerId(newId),
          position: newMarker,
        ));
      });
    }
  }

  void predictLocation(Prediction p) async {
    if (p != null) {
      PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId);

      double lat = detail.result.geometry.location.lat;
      double lng = detail.result.geometry.location.lng;

      _start = new LatLng(lat, lng);
      _startInitialized = true;

      setState(() {
        replaceMarkers();
        startController.text = detail.result.formattedAddress;
      });
    }
  }

  Future<String> getRoute(LatLng start, LatLng destination) async {
    String url = "https://maps.googleapis.com/maps/api/directions/json?origin=${start.latitude},${start.longitude}&destination=${destination.latitude},${destination.longitude}&key=$GoogleApiKey";
    http.Response response = await http.get(url);
    var values = jsonDecode(response.body);
    return values["routes"][0]["overview_polyline"]["points"];
  }

  void drawRoute(String encodedPoly) {
    setState(() {
      polyLines.add(Polyline(
          polylineId: PolylineId(_start.toString()),
          width: 5,
          points: _convertToLatLng(_decodePoly(encodedPoly)),
          color: Colors.red)
      );
    });
  }

  List _decodePoly(String poly){
    var list = poly.codeUnits;
    var lList = new List();
    int index = 0;
    int len = poly.length;
    int c = 0;

    do {
      var shift = 0;
      int result = 0;

      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);

      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];

    print(lList.toString());

    return lList;
  }

  List<LatLng> _convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    return result;
  }
}

