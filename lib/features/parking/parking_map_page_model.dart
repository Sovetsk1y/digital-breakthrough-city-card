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
    latitude: 44.725592,
    longitude: 37.766016,
    address: 'Address 1',
  ),
  ParkingPlace(
    id: '1',
    latitude: 44.735592,
    longitude: 37.766016,
    address: 'Address 2',
  ),
  ParkingPlace(
    id: '2',
    latitude: 44.721592,
    longitude: 37.762016,
    address: 'Address 3',
  ),
  ParkingPlace(
    id: '3',
    latitude: 44.720592,
    longitude: 37.760016,
    address: 'Address 4',
  ),
};
