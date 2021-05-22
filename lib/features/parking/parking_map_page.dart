import 'package:city_card_novoros/features/parking/parking_map_page_model.dart';
import 'package:flutter/material.dart';

import 'package:city_card_novoros/features/components/back_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParkingMapPage extends StatefulWidget {
  ParkingMapPage({Key? key}) : super(key: key);

  @override
  _ParkingMapPageState createState() => _ParkingMapPageState();
}

class _ParkingMapPageState extends State<ParkingMapPage> {
  late GoogleMapController _controller;
  BitmapDescriptor? _bitmapDescriptor;
  BitmapDescriptor? _meBitmapDescriptor;

  final _myPosition = LatLng(44.726492, 37.767116);

  @override
  void initState() {
    super.initState();

    getBytesFromAsset(
      asset: 'assets/images/geopoint.png',
      width: 40,
      height: 40 ~/ 0.55,
    ).then(
      (byteData) {
        setState(() {
          _meBitmapDescriptor = BitmapDescriptor.fromBytes(byteData);
        });
      },
    );
    getBytesFromAsset(
      asset: 'assets/images/parking_icon.png',
      width: 80,
      height: 80 ~/ 0.65,
    ).then(
      (byteData) {
        setState(() {
          _bitmapDescriptor = BitmapDescriptor.fromBytes(byteData);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) {
              _controller = controller;
            },
            markers: _bitmapDescriptor == null
                ? {}
                : parkingPoints
                    .map((place) => Marker(
                          markerId: MarkerId(place.id),
                          position: LatLng(place.latitude, place.longitude),
                          icon: _bitmapDescriptor!,
                        ))
                    .toSet()
              ..add(Marker(
                markerId: MarkerId('me'),
                position: _myPosition,
                icon: _meBitmapDescriptor ?? BitmapDescriptor.defaultMarker,
              )),
            initialCameraPosition: CameraPosition(
              target: _myPosition,
              zoom: 16,
            ),
          ),
          Positioned(
            left: 26,
            top: 42,
            child: AppBackButton(),
          ),
        ],
      ),
    );
  }
}
