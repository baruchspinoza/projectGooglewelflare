import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(My());

class My extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<My> {
  late GoogleMapController mapController;

  List<CustomMarker> markersList = [
    CustomMarker(
        title: 'Mozambique',
        subtitle: '9.6 million people hungry',
        lat: -19.302233,
        lon: 34.9144977),
    CustomMarker(
        title: 'Venezuela',
        subtitle: 'Bolivar ( 9.1 MILLION PEOPLE ARE HUNGRY)',
        lat: 8.1264851,
        lon: -63.5336002),
    CustomMarker(
        title: 'Madagascar',
        subtitle: 'Ankoroka Madagascar 11 million people hungry',
        lat: -23.351743,
        lon: 43.7913082),
  ];

  final LatLng _center = const LatLng(21.289374, -12.598739);
  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    mapController = controller;

    _markers.clear();
    for (final item in markersList) {
      final marker = Marker(
        markerId: MarkerId(item.title),
        position: LatLng(item.lat, item.lon),
        infoWindow: InfoWindow(
          title: item.title,
          snippet: item.subtitle,
        ),
        onTap: () async {
          await showDialog<dynamic>(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Choose your donation type'),
              content: Text(
                  'You can donate to this city with the buttons on the right and left.'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/catalog_food');

                    // dismisses only the dialog and returns nothing
                  },
                  child: Text('Food Donation'),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/catalog_health');

                    // dismisses only the dialog and returns nothing
                  },
                  child: Text('Health Donation'),
                ),
              ],
            ),
          );
        },
      );
      _markers[item.title] = marker;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Google Welflare'),
              backgroundColor: Colors.blue,
            ),
            body: Stack(
              children: <Widget>[
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: -10,
                  ),
                  markers: _markers.values.toSet(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: FloatingActionButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/catalog_food'),
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.food_bank, size: 40.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: FloatingActionButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/catalog_health'),
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.healing, size: 35.0),
                    ),
                  ),
                ),
              ],
            )));
  }
}

class CustomMarker {
  final String title;
  final String subtitle;
  final double lat;
  final double lon;

  CustomMarker(
      {required this.title,
      required this.subtitle,
      required this.lat,
      required this.lon});
}
