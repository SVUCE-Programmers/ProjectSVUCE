import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/screens/admin%20screens/add_students_view/add_student_view_model.dart';
import 'package:svuce_app/ui/screens/main/consumers/imports.dart';
import 'package:svuce_app/ui/utils/animated_drop_down.dart';
import 'package:svuce_app/ui/utils/button_animation.dart';
import 'package:svuce_app/ui/utils/text_field.dart';

showEditStudentBottomSheet(
    AddStudentViewModel model, BuildContext context, UserModel userModel) {
  final TextEditingController nameController =
      TextEditingController(text: userModel.fullName);
  final TextEditingController phoneController =
      TextEditingController(text: userModel.phoneNumber.toString());
  final TextEditingController emailController =
      TextEditingController(text: userModel.email);
  final TextEditingController typeController =
      TextEditingController(text: userModel.userType);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final UiHelpers uiHelpers = UiHelpers.fromContext(context);
  showModalBottomSheet(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    context: context,
    builder: (context) => Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                "Edit Student",
                style: uiHelpers.headline,
              ),
              SizedBox(
                height: 15,
              ),
              AnimatedInputField(
                  title: "Name", textEditingController: nameController),
              AnimatedInputField(
                  title: "Phone Number",
                  textEditingController: phoneController),
              AnimatedInputField(
                  title: "Email", textEditingController: emailController),
              AnimatedDropdownWidget(
                textEditingController: typeController,
                title: "User Type",
                items: ["STUDENT", "ADMIN"],
              ),
              AnimatedButton(
                onTap: () => model.updateStudent(userModel.copyWith(
                    fullName: nameController.text,
                    email: emailController.text,
                    userType: typeController.text,
                    phoneNumber: int.parse(phoneController.text))),
                title: Text(
                  "Update student",
                  style: uiHelpers.button,
                ),
              ),
              AnimatedPadding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  duration: Duration(milliseconds: 500))
            ],
          ),
        ),
      ),
    ),
  );
}
