import 'package:flutter/material.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

class TeqipScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                scrollDirection: Axis.horizontal,
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.all(),
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
            ],
          ),
        ),
      ),
    );
  }
}
