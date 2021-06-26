import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/screens/Static%20Pages/campus%20map/campus_map_view_model.dart';

class CampusMapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<CampuusMapViewModel>(
      onModelReady: (m) => m.init(),
      viewModel: CampuusMapViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(
        endDrawer: Drawer(),
        body: Stack(
          children: [
            Container(
              width: uiHelpers.width,
              height: uiHelpers.height,
              child: model.initialPosition == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: model.initialPosition,
                        zoom: 16,
                      ),
                      onMapCreated: model.onMapCreated,
                      myLocationButtonEnabled: true,
                      compassEnabled: true,
                      rotateGesturesEnabled: true,
                      zoomControlsEnabled: true,
                      zoomGesturesEnabled: true,
                      markers: model.markers,
                    ),
            ),
          ],
        ),
        appBar: AppBar(
          leading: IconButton(
              onPressed: model.goBack,
              icon: Icon(
                backIcon,
                color: uiHelpers.textPrimaryColor,
              )),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("Campus Map", style: uiHelpers.headline),
        ),
      ),
    );
  }
}
