import 'package:api_tempate_flutter/core/constants/layout.dart';
import 'package:api_tempate_flutter/src/features/admin/features/account/presentation/widgets/account_date_employed.dart';
import 'package:api_tempate_flutter/src/features/admin/features/account/presentation/widgets/gender_from_field.dart';
import 'package:api_tempate_flutter/src/features/admin/features/account/presentation/widgets/plane_text_from_field.dart';
import 'package:api_tempate_flutter/src/models/subject.dart';
import 'package:flutter/material.dart';

class TeacherRegisterationPage extends StatelessWidget {
  const TeacherRegisterationPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController qualificationController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController nextOfKinController = TextEditingController();
    TextEditingController nextOfkinNumberController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    List<Subject> subjectList = [];
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    DateEmployed dateEmployed = DateEmployed();
    GenderClass gender = GenderClass();
    Layout layout = Layout(context: context);
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              PlaneTextFormField(
                controller: fullNameController,
                labelText: 'Full Name',
              ),
              PlaneTextFormField(
                controller: lastNameController,
                labelText: 'Last Name',
              ),
              GenderFromField(gender: gender),
              DateDropdowns(
                dateEmployed: dateEmployed,
              ),
              PlaneTextFormField(
                controller: qualificationController,
                labelText: 'Qualification',
              ),
              PlaneTextFormField(
                controller: phoneNumberController,
                labelText: 'Phone Number',
              ),
              PlaneTextFormField(
                controller: nextOfKinController,
                labelText: 'Next Of Kin ',
              ),
              PlaneTextFormField(
                controller: nextOfkinNumberController,
                labelText: 'Next Of kin Number',
              ),
              PlaneTextFormField(
                controller: addressController,
                labelText: 'Address',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Subject Registration:',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontSize: 10),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.amber,
                        height: 150,
                        child: ListView.builder(
                          itemCount: (subjectList.length / 3).ceil(),
                          itemBuilder: (context, index) {
                            int startIndex = index * 3;
                            int endIndex = startIndex + 3;
                            List<Subject> subjects = subjectList.sublist(
                                startIndex,
                                endIndex.clamp(0, subjectList.length).toInt());

                            return layout.isLargeScreen
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children:
                                        generateCheckBox(layout, subjects),
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children:
                                        generateCheckBox(layout, subjects),
                                  );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> generateCheckBox(Layout layout, List<Subject> subjects) {
  return subjects
      .map((subject) => SizedBox(
            width:
                layout.isLargeScreen ? layout.width! * 0.2 : double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  subject.subject,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
                const SizedBox(
                  width: 10,
                ),
                Checkbox(
                  shape: const CircleBorder(),
                  value: true,
                  onChanged: (value) {},
                ),
              ],
            ),
          ))
      .toList();
}
