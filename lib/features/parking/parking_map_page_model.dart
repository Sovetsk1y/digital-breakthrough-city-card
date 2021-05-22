import 'dart:typed_data';

import 'package:city_card_novoros/domain/parking/parking_place.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

Future<Uint8List> getBytesFromAsset({
  required String asset,
  required int width,
  required int height,
}) async {
  ByteData data = await rootBundle.load(asset);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width, targetHeight: height);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}

final Set<ParkingPlace> parkingPoints = {
  ParkingPlace(
    id: '0',
    latitude: 44.736838,
    longitude: 37.770532,
    address: 'Address 1',
  ),
  ParkingPlace(
    id: '1',
    latitude: 44.736828,
    longitude: 37.770332,
    address: 'Address 2',
  ),
  ParkingPlace(
    id: '2',
    latitude: 44.736708,
    longitude: 37.770832,
    address: 'Address 3',
  ),
  ParkingPlace(
    id: '3',
    latitude: 44.720592,
    longitude: 37.760016,
    address: 'Address 4',
  ),
};
