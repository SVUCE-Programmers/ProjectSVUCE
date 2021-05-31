import 'package:flutter/material.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

class HostelView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
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
              SizedBox(height: 8),
              Text(
                "Sri Venkateswara University College of Engineering (SVUCE), Tiruapti is a residentialinstitute and provides accommodation to students wishing to reside in the hostels.The SVUCE Men’s hostels are administered by a Warden and he is assisted by fourDeputy Wardens in all matters relating to the hostels. Warden and Deputy Wardensall are faculty members of SVUCE. Hostel Office is located within the SVUCE premises,and has one Office Superintendent, three Junior Assistants, one record Assistantand two Attenders, who assist the Warden / Dy. Wardens in matters related to variousactivities of the hostel. Hostel Office maintains all files, registers, records,ledgers, account books, supplier’s bills, payment registers, etc., pertaining tothe mess, hostel residents and the employees. The Hostel Office is open on all workingdays.\n\nThe SVUCE Men’s hostels comprises of four-Boys Hostel Blocks, namely Visveswara,Viswakarma, Viswateja and Viswapragati. B.Tech Second, Third & Final year studentsare accommodated in Visveswara and Viswakarma Hostel Blocks. B.Tech first year studentsare placed at Viswateja Hostel Block, where as the Viswapragati Hostel Block ismeant exclusively for M.Tech Students.",
                style: uiHelpers.body.copyWith(height: 1.25),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Contact Details",
                style: uiHelpers.headline,
              ),
              SizedBox(height: 15),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                primary: false,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Table(
                    columnWidths: {
                      0: FixedColumnWidth(300),
                      1: FixedColumnWidth(350)
                    },
                    border:
                        TableBorder.all(color: uiHelpers.textSecondaryColor),
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Principal- Cum- Chief Warden",
                            style: uiHelpers.title,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "(+91)-877-2289341, (+91)-877-2289561(O)",
                            style: uiHelpers.body,
                          ),
                        )
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Hostel Office",
                            style: uiHelpers.title,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "(+91)-877-2248539, (+91)-877-2289459",
                            style: uiHelpers.body,
                          ),
                        )
                      ])
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "SVUCE Men's Hostels",
                style: uiHelpers.headline,
              ),
              SizedBox(height: 10),
              Text(
                "Men's Hostels of S V U College of Engineering are located nearer to NCC building. Hostels have good scenic view of Tirumala Hills. S V U C E Men's Hostels have following Four Blocks:",
                style: uiHelpers.body,
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                primary: false,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Table(
                    columnWidths: {
                      0: FixedColumnWidth(200),
                      1: FixedColumnWidth(160),
                      2: FixedColumnWidth(130),
                    },
                    border:
                        TableBorder.all(color: uiHelpers.textSecondaryColor),
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "SVUCE Men's Hostel Block",
                            style: uiHelpers.title,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Year of Establishment",
                            style: uiHelpers.title,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Capacity",
                            style: uiHelpers.title,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Viswakarma Block",
                            style: uiHelpers.body,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "1970",
                            style: uiHelpers.body,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "240",
                            style: uiHelpers.body,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Visweswara Block",
                            style: uiHelpers.body,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "1973",
                            style: uiHelpers.body,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "240",
                            style: uiHelpers.body,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Viswateja Block",
                            style: uiHelpers.body,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "1985",
                            style: uiHelpers.body,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "148",
                            style: uiHelpers.body,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Viswa Pragati Block",
                            style: uiHelpers.body,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "2007",
                            style: uiHelpers.body,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "90",
                            style: uiHelpers.body,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ]),
                    ],
                  ),
                ),
              ),
              uiHelpers.verticalSpaceLow,
            ],
          ),
        ),
      ),
    );
  }
}
