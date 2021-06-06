import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/utils/date_utils.dart';
import 'package:svuce_app/ui/screens/admin%20screens/create%20event/create_event_view_model.dart';
import 'package:svuce_app/ui/utils/button_animation.dart';
import 'package:svuce_app/ui/utils/text_field.dart';

class CreateEventView extends HookWidget {
  const CreateEventView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<CreateEventViewModel>(
        onModelReady: (m) => m.init(),
        builder: (context, uiHelpers, model) => Scaffold(
              body: Form(
                key: model.formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20)
                        .copyWith(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedInputField(
                          textEditingController: model.titleController,
                          title: "Title",
                          hintText: "Enter title...",
                        ),
                        AnimatedInputField(
                          maxLines: 3,
                          textEditingController: model.descController,
                          delay: 1,
                          title: "Description",
                          hintText: "Enter description...",
                        ),
                        AnimatedInputField(
                            delay: 1.5,
                            enabled: false,
                            suffixIcon: Icon(
                              FlutterIcons.calendar_fea,
                              color: uiHelpers.textSecondaryColor,
                            ),
                            onTap: () async {
                              var datePicker = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(DateTime.now().year + 4));

                              var timePicker = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now());
                              if (datePicker != null && timePicker != null) {
                                model.startController.text = DateTimeUtils()
                                        .getWholeDate(
                                            datePicker.millisecondsSinceEpoch)
                                        .toString() +
                                    "  " +
                                    timePicker.hour.toString() +
                                    ":" +
                                    timePicker.minute.toString();
                              }
                            },
                            title: "Start Date",
                            textEditingController: model.startController),
                        AnimatedInputField(
                            downPadding: 20,
                            delay: 1.75,
                            enabled: false,
                            suffixIcon: Icon(
                              FlutterIcons.calendar_fea,
                              color: uiHelpers.textSecondaryColor,
                            ),
                            onTap: () async {
                              var datePicker = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(DateTime.now().year + 4));

                              var timePicker = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now());
                              if (datePicker != null && timePicker != null) {
                                model.endController.text = DateTimeUtils()
                                        .getWholeDate(
                                            datePicker.millisecondsSinceEpoch)
                                        .toString() +
                                    "  " +
                                    timePicker.hour.toString() +
                                    ":" +
                                    timePicker.minute.toString();
                              }
                            },
                            title: "End Date",
                            textEditingController: model.endController),
                        AnimatedButton(
                          animatePaddingValue: 4,
                          minLeadingWidth: 20,
                          onTap: () => model.createEvent(),
                          delay: 2.25,
                          title: Text(
                            "Upload an image",
                            style: uiHelpers.button.copyWith(fontSize: 14),
                          ),
                          leading: Icon(
                            FlutterIcons.upload_fea,
                            color: Colors.white,
                            size: 20,
                          ),
                          xDistance: 0,
                          yDistance: 30,
                        ),
                        AnimatedButton(
                          shapeBorder: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          onTap: () => model.createEvent(),
                          elevation: 8,
                          delay: 2.5,
                          title: Center(
                              child: Text("Create Event",
                                  style: uiHelpers.button)),
                          xDistance: 0,
                          yDistance: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                    icon: Icon(
                      backIcon,
                      color: uiHelpers.textPrimaryColor,
                    ),
                    onPressed: model.goBack),
                title: Text(
                  "Create Event",
                  style: uiHelpers.headline,
                ),
              ),
            ),
        viewModel: CreateEventViewModel());
  }
}
