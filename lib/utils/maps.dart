import 'package:coffee_challenge/utils/imports.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

class MapUtils {
  static Future<LatLng?> getLocation() async {
    var location = Location();
    try {
      location.requestPermission();
      var currentLocation = await location.getLocation();
      debugPrint(
          'Location: ${currentLocation.latitude}, ${currentLocation.longitude}');
      LatLng data = LatLng(
        currentLocation.latitude!,
        currentLocation.longitude!,
      );

      return data;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  // Function to generate random latitude and longitude within a certain radius from a given point
  static LatLng generateRandomCoordinates({
    required double baseLatitude,
    required double baseLongitude,
    required double radius,
  }) {
    final random = Random();

    // Radius of the Earth in kilometers
    const earthRadius = 6371.0;

    // Convert radius from kilometers to degrees
    final radiusInDegrees = radius / earthRadius;

    // Generate a random angle for the bearing
    final randomBearing = random.nextDouble() * 2 * pi;

    // Calculate offsets for latitude and longitude
    final randomLatitudeOffset = sin(randomBearing) * radiusInDegrees;
    final randomLongitudeOffset = cos(randomBearing) * radiusInDegrees;

    // Calculate new latitude and longitude
    final newLatitude = baseLatitude + randomLatitudeOffset;
    final newLongitude = baseLongitude + randomLongitudeOffset;

    return LatLng(newLatitude, newLongitude);
  }

  // getPolyline
  static Future<List<LatLng>> getPolyline({
    required PointLatLng userLocation,
    required PointLatLng driveLocation,
  }) async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyBwMrYAYc3XOVv5KN1cnoFGPcSC3_m16BQ',
      userLocation,
      driveLocation,
      travelMode: TravelMode.driving,
    );
    debugPrint('Polyline Result: ${result.points}');
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      debugPrint('No result found');
    }
    return polylineCoordinates;
  }

  //drawPolyline
  static Polyline generatePolyLineFromPoints(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: KColors.kPrimaryColor,
      points: polylineCoordinates,
      width: 4,
    );
    return polyline;
  }

  // static Future<BitmapDescriptor> getBytesFromAsset(String path) async {
  //   ByteData data = await rootBundle.load(path);
  //   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
  //       targetWidth: 50);
  //   ui.FrameInfo fi = await codec.getNextFrame();
  //   var val = (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
  //       .buffer
  //       .asUint8List();

  //   return BitmapDescriptor.fromBytes(val);
  // }

  static Future<BitmapDescriptor> getBytesFromAsset(
      String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    var val = (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();

    return BitmapDescriptor.fromBytes(val);
  }
}
