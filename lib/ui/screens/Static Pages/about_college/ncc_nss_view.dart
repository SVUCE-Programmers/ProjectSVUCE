import 'package:flutter/material.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

class NCCNSSView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> activityList = [
      "120 hours of service during an academic year",
      "They have to work on Sundays and evenings to complete this target service.",
      "One special camp in a year during vacation.",
      "Volunteers are provided with refreshment whenever they work."
    ];
    final List<String> titles = [
      "To promote personality development among students through community service.",
      "To instill a sense of discipline among students",
      "To make students physically fit for nation building activities.",
      "To direct students energies to right causes.",
      "To acquire leadership qualities and democratic attitude.",
      "To practice National integration"
    ];
    final List<String> issueList = [
      "Special Camp Certificates are issued to the volunteers who have been involved inthe camp for 10 days with Programme Coordinator's and Vice Chancellor's signatures.",
      "Bonafide N.S.S. Certificates are given to volunteers who have been involved in generalregular N.S.S. for 2 Years",
      "For volunteers who attend National Integration Camps, Inter State Camps, Inter Campson deputation, are given University certificate by the organisers of the camp. Thesecertificates are given priority II and considered in P.G. admissions."
    ];
    UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("About", style: uiHelpers.headline),
              SizedBox(height: 10),
              Text(
                "Sri Venkateswara University carries rightly the pride for having been one of thepioneering institutions in implanting the N.S.S. in the country. It was introducedduring 1969-70. Starting with 300 volunteers, it has grown into a mighty programmewith about 40,000 Volunteers for regular NSS and special camping programmes.",
                style: uiHelpers.body,
              ),
              SizedBox(height: 20),
              Text(
                "Objectives",
                style: uiHelpers.headline,
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  titles.length,
                  (index) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '      •  ',
                        style: uiHelpers.title,
                      ),
                      Expanded(
                        child: Text(
                          '${titles[index]}',
                          style: uiHelpers.body,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "NSS Center",
                style: uiHelpers.headline,
              ),
              SizedBox(height: 10),
              Text(
                  "The NSS Bureau is located at NSS Bhavan near the Administration Building (NeelamSanjeeva Reddy Bhavan).",
                  style: uiHelpers.body),
              SizedBox(
                height: 20,
              ),
              Text(
                "NSS Programme Officers",
                style: uiHelpers.headline,
              ),
              SizedBox(height: 10),
              Text(
                  "260 NSS Programme Officers are there in Engineering, Degree and Junior Collegesof S.V. University area.",
                  style: uiHelpers.body),
              SizedBox(
                height: 20,
              ),
              Text(
                "Admission",
                style: uiHelpers.headline,
              ),
              SizedBox(height: 10),
              Text(
                  "Students who wish to join NSS should apply to the Programme Officer concerned intheir respective Colleges.",
                  style: uiHelpers.body),
              SizedBox(height: 20),
              Text(
                "Activity",
                style: uiHelpers.headline,
              ),
              SizedBox(height: 10),
              Text(
                "NSS volunteers will have the following activity",
                style: uiHelpers.body,
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  activityList.length,
                  (index) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '      •  ',
                        style: uiHelpers.title,
                      ),
                      Expanded(
                        child: Text(
                          '${activityList[index]}',
                          style: uiHelpers.body,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("Issue of certificates", style: uiHelpers.headline),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  issueList.length,
                  (index) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '      •  ',
                        style: uiHelpers.title,
                      ),
                      Expanded(
                        child: Text(
                          '${issueList[index]}',
                          style: uiHelpers.body,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Benefits",
                style: uiHelpers.headline,
              ),
              SizedBox(height: 10),
              Text(
                  "In P.G. Admissions, M.B.A., M.C.A. and other courses there are reservations (5%)under E.C.A. Quota for N.S.S. Volunteers on par with N.C.C. & Sports and culturalactivities.",
                  style: uiHelpers.body),
              uiHelpers.verticalSpaceLow,
            ],
          ),
        ),
      ),
    );
  }
}
