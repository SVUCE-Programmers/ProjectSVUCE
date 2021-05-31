import 'package:flutter/material.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

class HealthCenterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UiHelpers uiHelpers = UiHelpers.fromContext(context);
    final List<String> titles = [
      "Students",
      "Research Scholars",
      "Employees of S.V.University and their dependent family members like parents andunmarried children",
      "Retired employees and their spouses and",
      "Guests and visitors to the University on various programmes"
    ];
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
                "Sri Venkateswara University Health centre was established in 1963. It is a serviceOriented mini-hospital extending free medical service to the",
                style: uiHelpers.body,
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
              SizedBox(height: 10),
              Text(
                "The total population covered is about 20,000/-. The average daily outpatient strengthof the centre is about 300. The Centre has aone Senior Medical Officer, one LadyJunior Medical Officer and two Junior Medical Officers, who are assisted by paramedicalstaff members. Specialist consultancy services in general Medicines, general sugary,Dental surgery and Ophthalmology drawn from the specialists of S.V.R.R. GovernmentGeneral Hospital, Tirupati are available at the Health centre on specified days.",
                style: uiHelpers.body,
              ),
              SizedBox(height: 10),
              Text(
                  "The Centre renders Out Patient treatment, Inpatient treatment with 12 beds, Minorsurgical procedures, Antenatal Check-ups and post natal care, Immunization, AnnualMedical check-ups for students and call duty services. The centre also has a Clinicallaboratory and Bio-chemical laboratory, X-Rays, Dental X-Ray, E.C.G etc., for diagnosticpurpose, besides an Ambulance Van for the transport of the patients. It has proposalsto acquire diagnostic equipments like Ultrasound Scanner and Upper gastro-intestinalendoscope",
                  style: uiHelpers.body),
              uiHelpers.verticalSpaceLow,
            ],
          ),
        ),
      ),
    );
  }
}
