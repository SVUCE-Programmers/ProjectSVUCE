import 'dart:collection';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:open_location_code/open_location_code.dart' as olc;

class CampuusMapViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final log = getLogger("Campus View Model");
  GoogleMapController mapController;
  LatLng initialPosition;
  List<Position> positionList = [];
  Set<Marker> markers = HashSet<Marker>();

  Map<String, String> codes = {
    "canteen": "J9HW+QX Tirupati",
    "Adminstrative Building": "J9HX+G3 Tirupati",
    "library": "JCJ2+CF Tirupati",
    "Boys hostel office": "J9HW+46 Tirupati",
    "Boys hostels": "J9JW+64 Tirupati",
    "Cse Dept": "J9HV+5V Tirupati",
    "Ece Dept": "J9GW+WG Tirupati",
    "Mech Dept": "J9GW+VR Tirupati",
    "EEE dept": "J9HV+5V Tirupati",
    "Civil Dept": "J9GW+QR Tirupati",
    "Chemical Dept": "J9GW+P7 Tirupati",
    "Main Building": "J9GW+VR Tirupati",
    "Auditorium": "J9HX+QH Tirupati"
  };
  goBack() {
    _navigationService.back();
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
      controller.setMapStyle('''[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#1d2c4d"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#8ec3b9"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1a3646"
      }
    ]
  },
  {
    "featureType": "administrative.country",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#4b6878"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#64779e"
      }
    ]
  },
  {
    "featureType": "administrative.province",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#4b6878"
      }
    ]
  },
  {
    "featureType": "landscape.man_made",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#334e87"
      }
    ]
  },
  {
    "featureType": "landscape.natural",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#023e58"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#283d6a"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#6f9ba5"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1d2c4d"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#023e58"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#3C7680"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#304a7d"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#98a5be"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1d2c4d"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#2c6675"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#255763"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#b0d5ce"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#023e58"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#98a5be"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1d2c4d"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#283d6a"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#3a4762"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#0e1626"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#4e6d70"
      }
    ]
  }
]''');

      final locData = await Geolocator.getCurrentPosition();
      markers.add(Marker(
          markerId: MarkerId("0"),
          position: LatLng(locData.latitude, locData.longitude),
          infoWindow: InfoWindow(title: "Your place", snippet: "My Location")));
      notifyListeners();
    } catch (e) {}
  }

  Position getPosition(String fromPlusCode) {
    olc.CodeArea ca = olc.decode(fromPlusCode);
    Position position = Position(
        altitude: 0,
        speedAccuracy: 0,
        heading: 0,
        accuracy: 0,
        speed: 0,
        latitude: ca.center.latitude,
        longitude: ca.center.longitude,
        timestamp: DateTime.now());
    return position;
  }

  setPosition() {
    codes.forEach((key, value) {
      Position temp = getPosition(value);
      positionList.add(temp);
      markers.add(Marker(
          markerId: MarkerId("0"),
          position: LatLng(temp.latitude, temp.longitude),
          infoWindow: InfoWindow(title: "key", snippet: "Svuce")));
    });
    log.wtf("markers are:$markers");

    notifyListeners();
  }

  init() async {
    await getPresentLocation();
    setPosition();
  }
}
