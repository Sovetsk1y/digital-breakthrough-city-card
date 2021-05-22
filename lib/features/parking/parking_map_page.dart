import 'dart:async';
import 'dart:ui';

import 'package:city_card_novoros/features/components/bouncing_button.dart';
import 'package:city_card_novoros/features/components/buttons.dart';
import 'package:city_card_novoros/features/parking/parking_map_page_model.dart';
import 'package:city_card_novoros/utils/styles.dart';
import 'package:city_card_novoros/utils/svg_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:city_card_novoros/features/components/back_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'components/parking_finished_dialog.dart';
import 'components/parking_preset_bottom_sheet.dart';

class ParkingMapPage extends StatefulWidget {
  ParkingMapPage({Key? key}) : super(key: key);

  @override
  _ParkingMapPageState createState() => _ParkingMapPageState();
}

class _ParkingMapPageState extends State<ParkingMapPage> {
  late GoogleMapController _controller;
  BitmapDescriptor? _bitmapDescriptor;
  BitmapDescriptor? _meBitmapDescriptor;

  final _myPosition = LatLng(44.736818, 37.770512);
  final double _zoom = 18;

  int _parkingSeconds = 0;

  Timer? _parkingTimer;

  static const double _sideSize = 44;
  static const double _borderRadius = 12;

  bool _showingDialog = false;

  void _startParking() {
    _parkingTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _parkingSeconds += 1;
      });
    });
  }

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
  void dispose() {
    _parkingTimer?.cancel();
    super.dispose();
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
              zoom: _zoom,
            ),
          ),
          Positioned(
            left: 26,
            top: 42,
            child: AppBackButton(),
          ),
          Positioned(
            right: 26,
            top: 42,
            child: BouncingButton(
              scale: BounceScale.iconButton(),
              child: Container(
                height: _sideSize,
                width: _sideSize,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
                child: Center(
                    child: Icon(
                  CupertinoIcons.exclamationmark,
                  size: 26,
                  color: Colors.white,
                )),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Visibility(
                  visible: _parkingTimer?.isActive ?? false,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            timerSvgPath,
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 100,
                            child: Text(
                              '${(_parkingSeconds ~/ 60).toString().padLeft(2, '0')}:${(_parkingSeconds % 60).toInt().toString().padLeft(2, '0')}',
                              style: primaryTextBold34,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          stops: [0.8, 1],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(0.1),
                          ])),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Visibility(
                        visible: !(_parkingTimer?.isActive ?? false),
                        child: AppButton(
                            onTap: () {
                              showMaterialModalBottomSheet(
                                  animationCurve: Curves.easeInOut,
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  expand: true,
                                  builder: (context) =>
                                      ParkingPresetBottomSheet(
                                        onParkingStarted: _startParking,
                                      ));
                            },
                            child: Text(
                              'Припарковаться',
                              style: secondaryTextSemiBold17.copyWith(
                                  color: Colors.white),
                            )),
                      ),
                      Visibility(
                        visible: _parkingTimer?.isActive ?? false,
                        child: AppButton(
                            onTap: () {
                              _parkingTimer?.cancel();
                              setState(() {
                                _parkingSeconds = 0;
                                _showingDialog = true;
                              });
                              showDialog(
                                context: context,
                                useRootNavigator: false,
                                barrierColor: Colors.black26,
                                builder: (context) => ParkingFinishedDialog(),
                              ).then((value) {
                                setState(() {
                                  _parkingSeconds = 0;
                                  _parkingTimer?.cancel();
                                  _showingDialog = false;
                                });
                              });
                            },
                            child: Text(
                              'Закончить парковку',
                              style: secondaryTextSemiBold17.copyWith(
                                  color: Colors.white),
                            )),
                      ),
                      const SizedBox(height: 48),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: _showingDialog,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          )
        ],
      ),
    );
  }
}
