import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/screens/admin%20screens/add_students_view/add_student_view_model.dart';
import 'package:svuce_app/ui/utils/text_field.dart';
import 'package:svuce_app/ui/widgets/bottom%20sheets/edit_student_data.dart';

class UpdateUserWidget extends HookWidget {
  final AddStudentViewModel model;

  const UpdateUserWidget({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isrollType = useState(true);
    final focusNode = useFocusNode();

    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return Scaffold(
      body: IgnorePointer(
        ignoring: model.isBusy,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
            child: Column(
              children: [
                model.isBusy
                    ? LinearProgressIndicator(
                        backgroundColor:
                            uiHelpers.primaryColor.withOpacity(0.2),
                        valueColor:
                            AlwaysStoppedAnimation(uiHelpers.primaryColor),
                      )
                    : SizedBox(),
                ListTile(
                  tileColor: uiHelpers.surfaceColor,
                  trailing: CupertinoSwitch(
                    value: isrollType.value,
                    activeColor: uiHelpers.primaryColor,
                    onChanged: (value) async {
                      model.log.wtf(value);
                      isrollType.value = !isrollType.value;
                      FocusScope.of(context)
                          .requestFocus(new FocusNode()); //remove focus
                      WidgetsBinding.instance.addPostFrameCallback(
                          (_) => model.userController.clear()); // clear content
                      model.clearTextField();
                    },
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  title: Text(
                    "Change search type",
                    style: uiHelpers.title,
                  ),
                  subtitle: Text(
                    "Enable to search user by rollNo",
                    style: uiHelpers.body,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                AnimatedInputField(
                    delay: 0,
                    focusNode: focusNode,
                    textInputType: isrollType.value
                        ? TextInputType.number
                        : TextInputType.emailAddress,
                    suffixIcon: GestureDetector(
                      onTap: () => model.searchUser(isrollType.value),
                      child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: uiHelpers.primaryColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(
                            Icons.search,
                            size: 20,
                            color: Colors.white,
                          )),
                    ),
                    title: "Search user",
                    hintText:
                        "Enter  ${isrollType.value ? "Roll No" : "Email"}....",
                    textEditingController: model.userController),
                uiHelpers.verticalSpaceMedium,
                model.userModelList.length == 0
                    ? SizedBox()
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        primary: false,
                        child: Table(
                          border: TableBorder.all(
                              color: uiHelpers.textSecondaryColor),
                          columnWidths: {
                            0: FixedColumnWidth(150),
                            1: FixedColumnWidth(240),
                            2: FixedColumnWidth(100),
                            3: FixedColumnWidth(100),
                            4: FixedColumnWidth(80),
                            5: FixedColumnWidth(100),
                            6: FixedColumnWidth(200)
                          },
                          children: [
                            TableRow(
                                children: [
                              "Name",
                              "Email",
                              "Phone Number",
                              "Roll No",
                              "Gender",
                              "User Type",
                              "Actions"
                            ]
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            e,
                                            style: uiHelpers.title,
                                            textAlign: TextAlign.center,
                                          ),
                                        ))
                                    .toList()),
                            ...model.userModelList.map((e) =>
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e.fullName,
                                      style: uiHelpers.body,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e.email,
                                      style: uiHelpers.body,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e.phoneNumber.toString(),
                                      style: uiHelpers.body,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e.rollNo.toString(),
                                      style: uiHelpers.body,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e.gender.toString(),
                                      style: uiHelpers.body,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e.userType.toString(),
                                      style: uiHelpers.body,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () =>
                                              showEditStudentBottomSheet(
                                                  model, context, e),
                                          icon: Icon(Icons.edit,
                                              color: uiHelpers.primaryColor)),
                                      IconButton(
                                          onPressed: () =>
                                              model.shareStudent(e),
                                          icon: Icon(Icons.share,
                                              color: uiHelpers.primaryColor)),
                                      IconButton(
                                          onPressed: () =>
                                              model.deleteStudent(e),
                                          icon: Icon(Icons.delete,
                                              color: uiHelpers.primaryColor))
                                    ],
                                  )
                                ]))
                          ],
                        ),
                      ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
        ),
      ),
    );
  }
}
