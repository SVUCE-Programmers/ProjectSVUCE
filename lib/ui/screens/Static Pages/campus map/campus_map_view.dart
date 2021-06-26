import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/screens/Static%20Pages/campus%20map/campus_map_view_model.dart';
import 'package:svuce_app/ui/utils/text_field.dart';
import 'package:svuce_app/ui/widgets/animations/fade_transition.dart';

class CampusMapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<CampuusMapViewModel>(
      onModelReady: (m) => m.init(),
      viewModel: CampuusMapViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(
        key: model.scaffoldKey,
        endDrawer: SafeArea(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), bottomLeft: Radius.circular(40)),
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 10),
              width: uiHelpers.width * 0.7,
              height: uiHelpers.height,
              color: uiHelpers.backgroundColor,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text("Quick Links", style: uiHelpers.headline),
                    SizedBox(
                      height: 20,
                    ),
                    AnimatedInputField(
                        suffixIcon: Container(
                          height: 50,
                          width: 50,
                          child: Icon(
                            FlutterIcons.search_fea,
                            color: Colors.white,
                          ),
                        ),
                        onChanged: (v) => model.search(),
                        title: "Search",
                        textEditingController: model.searchController),
                    ListView.builder(
                        itemBuilder: (context, index) => FadeAnimation(
                              xDistance: 0,
                              yDistance: 50,
                              delay: 0.8 + index * 0.2,
                              child: GestureDetector(
                                onTap: () => model.navigateToLocation(
                                    model.locationList.elementAt(index)),
                                child: Card(
                                  color: uiHelpers.surfaceColor,
                                  child: ListTile(
                                    title: Text(model.locationList[index].name),
                                  ),
                                ),
                              ),
                            ),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        primary: false,
                        itemCount: model.locationList.length)
                  ],
                ),
              ),
            ),
          ),
        ),
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
          actions: [
            IconButton(
                onPressed: () => model.scaffoldKey.currentState.openEndDrawer(),
                icon: Icon(FlutterIcons.grid_fea,
                    color: uiHelpers.textPrimaryColor))
          ],
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
