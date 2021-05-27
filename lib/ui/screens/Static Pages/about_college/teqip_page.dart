import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/widgets/pdf_viewer.dart';

import 'data/teqip_data.dart';

class TeqipScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();
    UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20).copyWith(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About",
                style: uiHelpers.title,
              ),
              SizedBox(height: 8),
              Text(
                "Technical Education Quality Improvement Programme is a project of Government of India assisted by World Bank. The project was implemented to improve the quality of education in the technical institutions of India.",
                style: uiHelpers.body,
              ),
              uiHelpers.verticalSpaceLow,
              SingleChildScrollView(
                primary: false,
                padding: const EdgeInsets.only(right: 25),
                scrollDirection: Axis.horizontal,
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.all(color: uiHelpers.textSecondaryColor),
                  columnWidths: {
                    0: FixedColumnWidth(150),
                    1: FixedColumnWidth(200),
                    2: FixedColumnWidth(100),
                    3: FixedColumnWidth(320),
                    4: FixedColumnWidth(150)
                  },
                  children: [
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Phase",
                          style: uiHelpers.title
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Objective",
                          style: uiHelpers.title
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Financial Outlay",
                          style: uiHelpers.title
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Major Activities",
                          style: uiHelpers.title
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Remark",
                          style: uiHelpers.title
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (Text(
                          "Phase-I (2005-2010)",
                          style: uiHelpers.body,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (Text(
                          "Strengthening Institutions to improve learning outcomes and employability of graduates.",
                          style: uiHelpers.body,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (Text(
                          "14 crores",
                          style: uiHelpers.body,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (Text(
                          "Procurement of state of art equipment and upgradation of labs ,conduct of FDPS, Training programs for U.G students to enhance technical and employability skills.",
                          style: uiHelpers.body,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (Text(
                          'Successfully completed.',
                          style: uiHelpers.body,
                        )),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (Text(
                          "Phase-II (2011-2017)",
                          style: uiHelpers.body,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (Text(
                          "Scaling up of Postgraduate Education, Demand driven Research & Development and Innovation.",
                          style: uiHelpers.body,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (Text(
                          "12.5 crores",
                          style: uiHelpers.body,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (Text(
                          "Conduct of FDPS, Training programs for U.G students to enhance technical and employability skills.",
                          style: uiHelpers.body,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (Text(
                          'Under Progress.',
                          style: uiHelpers.body,
                        )),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (Text(
                          "Phase-III",
                          style: uiHelpers.body,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (Text(
                          "TEQIP-1.3 is expected with an objective of Faculty Development for effective Teaching (Pedagogical Training) from 2017 on wards.",
                          style: uiHelpers.body,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (Text(
                          "-",
                          textAlign: TextAlign.center,
                          style: uiHelpers.body,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (Text(
                          "-",
                          textAlign: TextAlign.center,
                          style: uiHelpers.body,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (Text(
                          '-',
                          textAlign: TextAlign.center,
                          style: uiHelpers.body,
                        )),
                      )
                    ])
                  ],
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                title: Text(
                  "Board of Governors",
                  style: uiHelpers.title,
                ),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.only(right: 25),
                primary: false,
                scrollDirection: Axis.horizontal,
                child: Table(
                  columnWidths: {
                    0: FixedColumnWidth(75),
                    1: FixedColumnWidth(240),
                    2: FixedColumnWidth(140),
                  },
                  children: [
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "S.No.",
                          style: uiHelpers.title
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Name",
                          style: uiHelpers.title
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Position",
                          style: uiHelpers.title
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
                    ...List.generate(
                        boardGovData.length,
                        (index) => TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: (Text(
                                  "${index + 1}",
                                  textAlign: TextAlign.center,
                                  style: uiHelpers.body,
                                )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: (Text(
                                  "${boardGovData[index].values.elementAt(0)}",
                                  style: uiHelpers.body,
                                )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: (Text(
                                  "${boardGovData[index].values.elementAt(1)}",
                                  textAlign: TextAlign.center,
                                  style: uiHelpers.body,
                                )),
                              ),
                            ]))
                  ],
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.all(color: uiHelpers.textSecondaryColor),
                ),
              ),
              ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  title: Text(
                    "BOG Resolutions",
                    style: uiHelpers.title,
                  )),
              SingleChildScrollView(
                padding: const EdgeInsets.only(right: 25),
                primary: false,
                scrollDirection: Axis.horizontal,
                child: Table(
                  columnWidths: {
                    0: FixedColumnWidth(240),
                    1: FixedColumnWidth(150),
                  },
                  children: [
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Resolution Date",
                          style: uiHelpers.title
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Link",
                          style: uiHelpers.title
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
                    ...List.generate(
                        resolutionData.length,
                        (index) => TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: (Text(
                                  "${resolutionData[index].keys.elementAt(0)}",
                                  textAlign: TextAlign.center,
                                  style: uiHelpers.body,
                                )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MaterialButton(
                                  onPressed: () =>
                                      _navigationService.navigateWithTransition(
                                          PdfViewerWidget(
                                              url: resolutionData[index]
                                                  .values
                                                  .elementAt(0)
                                                  .trim()),
                                          transition: "fade"),
                                  child: (Text(
                                    "Click Here",
                                    style: uiHelpers.body.copyWith(
                                        color: uiHelpers.primaryColor),
                                  )),
                                ),
                              ),
                            ]))
                  ],
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.all(color: uiHelpers.textSecondaryColor),
                ),
              ),
              uiHelpers.verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }
}
