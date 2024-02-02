import 'dart:async';
import 'dart:math';

import 'package:coffee_challenge/utils/imports.dart';
import 'package:coffee_challenge/utils/maps.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  late CameraPosition cameraPosition;
  late GoogleMapController mapController;

  // Default initial positions
  LatLng userLocation = const LatLng(19.11649199547134, 72.931268479333);
  LatLng driveLocation = const LatLng(19.115375481985, 72.9305818376);

  BitmapDescriptor userIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor driverIcon = BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueAzure,
  );

  Set<Polyline> polylines = {};
  bool isLoaded = false;

  @override
  void initState() {
    debugPrint('InitState: TrackingScreen');
    doAllLocationStuff();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: buildBottomSheet(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: context.height * 0.8,
            child: !isLoaded
                ? Center(child: Image.asset('assets/images/loading.gif'))
                : GoogleMap(
                    initialCameraPosition: cameraPosition,
                    myLocationButtonEnabled: false,
                    onMapCreated: (val) {
                      mapController = val;
                      setState(() {
                        cameraPosition = CameraPosition(
                          target: userLocation,
                          zoom: 14.4746,
                        );
                      });
                    },
                    polylines: polylines,
                    myLocationEnabled: false,
                    markers: {
                      Marker(
                        markerId: const MarkerId('userMarker'),
                        position: userLocation,
                        icon: userIcon,
                        infoWindow: const InfoWindow(
                            title: 'User Location',
                            snippet: 'Current Location'),
                      ),
                      Marker(
                        markerId: const MarkerId('driveMarker'),
                        position: driveLocation,
                        icon: driverIcon,
                        infoWindow: const InfoWindow(
                          title: 'Drive Location',
                          snippet: 'Static Drive Location',
                        ),
                      ),
                    },
                  ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 30,
              right: 30,
              top: context.height * 0.08,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      shadows: [
                        BoxShadow(
                          color: KColors.grey_4E4E4,
                          blurRadius: 24,
                          offset: const Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: SvgPicture.asset('assets/icons/back.svg'),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    mapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: userLocation,
                          zoom: 19,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      shadows: [
                        BoxShadow(
                          color: KColors.grey_4E4E4,
                          blurRadius: 24,
                          offset: const Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: SvgPicture.asset('assets/icons/gps.svg'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DraggableScrollableSheet buildBottomSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      expand: false,
      minChildSize: 0.3,
      maxChildSize: 0.6,
      builder: (context, controller) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: KColors.grey_4E4E4,
                blurRadius: 24,
                offset: const Offset(0, -10),
                spreadRadius: 0,
              )
            ],
          ),
          child: SingleChildScrollView(
            controller: controller,
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Container(
                  width: 44,
                  height: 5,
                  decoration: ShapeDecoration(
                    color: KColors.whiteEAEAEA,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.50),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '10 minutes left',
                  style: TextStyle(
                    color: KColors.grey_303336,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Delivery to ',
                        style: TextStyle(
                          color: KColors.grey_7F7F7F,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Jl. Kpg Sutoyo',
                        style: TextStyle(
                          color: KColors.grey_303336,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    children: [
                      for (int i = 0; i < 4; i++)
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          height: 4,
                          decoration: ShapeDecoration(
                            color: KColors.green_35C07D,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        )),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: KColors.whiteEAEAEA,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: KColors.greyDEDEDE),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Image.asset('assets/images/bike.png',
                            height: context.width * 0.1),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Delivered your order',
                            style: TextStyle(
                              color: KColors.grey_303336,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: context.width * 0.5,
                            child: Text(
                              'We deliver your goods to you in the shortes possible time.',
                              style: TextStyle(
                                color: KColors.grey_7F7F7F,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Image.asset('assets/images/driver.png',
                          width: context.width * 0.18),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Johan Hawn',
                            style: TextStyle(
                              color: KColors.grey_303336,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Personal Courier',
                            style: TextStyle(
                              color: KColors.grey_7F7F7F,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: KColors.greyDEDEDE),
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: SvgPicture.asset('assets/icons/phone.svg'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> doAllLocationStuff() async {
    try {
      userIcon = await MapUtils.getBytesFromAsset(
          'assets/images/user_marker.png', 120);
      driverIcon = await MapUtils.getBytesFromAsset(
          'assets/images/driver_marker.png', 120);

      setState(() {});
      debugPrint('Success: GetBytesFromAsset');

      userLocation = await MapUtils.getLocation() ?? userLocation;
      cameraPosition = CameraPosition(target: userLocation, zoom: 14.4746);
      isLoaded = true;
      debugPrint('Success: GetLocation');

      driveLocation = MapUtils.generateRandomCoordinates(
        baseLatitude: userLocation.latitude,
        baseLongitude: userLocation.longitude,
        radius: 30,
      );
      debugPrint('Success: GenerateRandomCoordinates');

      // List<PointLatLng> coordinates =  MapUtils.getPolyline(
      //   userLocation:
      //       PointLatLng(userLocation.latitude, userLocation.longitude),
      //   driveLocation:
      //       PointLatLng(driveLocation.latitude, driveLocation.longitude),
      // );

      List<LatLng> coordinates = await MapUtils.getPolyline(
        userLocation:
            PointLatLng(userLocation.latitude, userLocation.longitude),
        driveLocation:
            PointLatLng(driveLocation.latitude, driveLocation.longitude),
      );
      debugPrint('Success: GetPolyline');

      setState(() {
        polylines.add(MapUtils.generatePolyLineFromPoints(coordinates));
      });
    } catch (e) {
      debugPrint('Error: $e');
      // Handle the error as needed
    }
  }
}
