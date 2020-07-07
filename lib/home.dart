import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:geocoder/geocoder.dart';

const GoogleApiKey = "AIzaSyDMIiuEny9d4SrnacqdU7-0_c8YgdvaVjg";
const LatLng _vancouver = const LatLng(49.2827, -123.1207);

GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: GoogleApiKey);

Set<Marker> markers = Set();

class MainMapPage extends StatefulWidget {
  @override
  Map createState() => Map();
}

class Map extends State<MainMapPage> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        body: new Stack(
            children: <Widget>[
              GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _vancouver,
                    zoom: 10.0,
                  ),
                  markers: markers
              ),
              Positioned(
                  top: 10,
                  right: 15,
                  left: 15,
                  child: Container(
                      color: Colors.white,
                      child: RaisedButton(
                          onPressed: () async {
                            Prediction p = await PlacesAutocomplete.show(
                                context: context,
                                apiKey: GoogleApiKey,
                                mode: Mode.overlay,
                                location: Location(49.2827, -123.1207),
                                radius: 10000);
                            addMarker(p);
                          },
                          child: new Text('Ride Now')
                      )
                  )
              )
            ]
        ),
      ),
    );
  }

  void addMarker(Prediction p) async {
    if (p != null) {
      PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(
          p.placeId);

      double lat = detail.result.geometry.location.lat;
      double lng = detail.result.geometry.location.lng;

      setState(() {
        markers.add(Marker(
            markerId: MarkerId('test'),
            position: LatLng(lat, lng)
        ));
      });
    }
  }
}
