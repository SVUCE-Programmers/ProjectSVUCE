import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/location_model.dart';
import 'package:svuce_app/core/services/theme_service.dart';
import 'package:svuce_app/ui/screens/Static%20Pages/campus%20map/utils/data.dart';

class CampuusMapViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final log = getLogger("Campus View Model");
  final ThemeService _themeService = locator<ThemeService>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GoogleMapController mapController;
  final TextEditingController searchController = TextEditingController();
  LatLng initialPosition;
  List<Position> positionList = [];
  List<LocationModel> locationList = [];
  Set<Marker> markers = HashSet<Marker>();
  goBack() {
    _navigationService.back();
  }

  search() {
    log.v(locationModelList);
    log.v("Text is: ${searchController.text.length}");
    if (searchController.text.length != 0) {
      locationList.clear();
      locationModelList.asMap().forEach((key, value) {
        log.v(value.name.toLowerCase());
        if (value.name
            .toLowerCase()
            .contains(searchController.text.toLowerCase())) {
          locationList.add(value);
        }
      });
      log.v(locationList);
      notifyListeners();
    } else {
      locationList = locationModelList.map((e) => e).toList();
      notifyListeners();
    }
  }

  navigateToLocation(LocationModel locationModel) {
    _navigationService.back();
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(
        locationModel.latitude,
        locationModel.longitude,
      ),
      zoom: 18.4746,
    )));
  }

  getPresentLocation() async {
    try {
      Position p = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      initialPosition = LatLng(p.latitude, p.longitude);
      notifyListeners();
    } catch (e) {
      //TODOSHow nackbar
    }
  }

  void onMapCreated(GoogleMapController controller) async {
    try {
      mapController = controller;
      controller.setMapStyle(
          _themeService.isDarkMode ? mapNightStyle : lightMapStyle);

      final locData = await Geolocator.getCurrentPosition();
      markers.add(Marker(
          markerId: MarkerId("0"),
          position: LatLng(locData.latitude, locData.longitude),
          infoWindow: InfoWindow(title: "Your place", snippet: "My Location")));
      notifyListeners();
    } catch (e) {}
  }

  setPosition() {
    locationModelList.asMap().forEach((key, value) {
      positionList.add(Position(
          altitude: 0,
          speedAccuracy: 0,
          heading: 0,
          accuracy: 0,
          speed: 0,
          latitude: value.latitude,
          longitude: value.longitude,
          timestamp: DateTime(2021, 06, 26)));
      markers.add(Marker(
          markerId: MarkerId("0"),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: InfoWindow(
              title: "${value.name}", snippet: "${value.description}")));
    });

    log.wtf("markers are:$markers");

    notifyListeners();
  }

  getList() {
    locationList = locationModelList.map((e) => e).toList();
    log.v("At Get List Filling is:$locationModelList");
    notifyListeners();
  }

  init() async {
    getList();
    await getPresentLocation();
    setPosition();
  }
}
