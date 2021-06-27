import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

class AlumniView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, List<String>> data = {
      "Welfare of SVUCE Alumni": [
        "Provide moral support to SVUCE Alumni when they are in need, professionally or personally",
        "Encourage and support entrepreneurship among SVUCE Alumni",
        "Encourage social networking and support gatherings for SVUCE Alumni, locally all across the globe"
      ],
      "Welfare of SVUCE": [
        "Encourage SVUCE Spirit among the budding engineers of SVUCE and pass it to the future generations",
        "Encourage and support SVUCE budding engineers to participate in the top competitive examinations like IES, IAS, IPS, GATE, CAT or others that IITians compete",
        "Encourage the SVUCE Alumni to support SVUCE financially to retain its academic excellence",
        "To maintain a directory of the alumni",
        "Help the Alumni to maintain contacts with the college",
        "Arrange annual gatherings of the alumni and enrol fresh members.",
        "Institute prizes in the name of the association for encouraging academic excellence and all round performance"
      ],
    };
    UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About",
                style: uiHelpers.headline,
              ),
              SizedBox(height: 10),
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    Text(
                      "${index + 1}.  " + data.keys.elementAt(index),
                      style: uiHelpers.title,
                    ),
                    SizedBox(height: 10),
                    Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                            data.values.elementAt(index).length,
                            (subIdx) => Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '   •  ',
                                      style: uiHelpers.title,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${data.values.elementAt(index)[subIdx]}',
                                        style: uiHelpers.body,
                                      ),
                                    )
                                  ],
                                ))),
                    SizedBox(height: 20),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                itemCount: data.length,
                primary: false,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      icon: Icon(FlutterIcons.web_mco), onPressed: () {}),
                  IconButton(
                      icon: Icon(FlutterIcons.google_play_ent),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(FlutterIcons.app_store_faw5d),
                      onPressed: () {}),
                ],
              ),
              uiHelpers.verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }
}
