import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app_bloc/bloc/app_bloc.dart';
import '../bloc/admin_settings_bloc.dart';

class Section1 extends StatelessWidget {
  const Section1({super.key});

  @override
  Widget build(BuildContext context) {
    int? selectedItem = 1;
    int? examTypeRadioGroupValue = 1;
    void onExamScoreTypeChange(int? val) {
      examTypeRadioGroupValue = val;
      context.read<AdminSettingsBloc>().add(ExamScoreTypeEvent(val!));
    }

    void onTermSelected(val) {
      selectedItem = val;
      context
          .read<AdminSettingsBloc>()
          .add(val == 1 ? FirstTermEvent() : SecondEvent());
    }

    var size = MediaQuery.of(context).size;
    var children2 = [
      Expanded(
        child: Container(
          color: Colors.white,
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Select The Term"),
                const SizedBox(
                  height: 5,
                ),
                BlocBuilder<AdminSettingsBloc, AdminSettingsState>(
                  buildWhen: (previous, current) {
                    return current is FirstTermState ||
                        current is SecondTermState;
                  },
                  builder: (context, state) {
                    return Container(
                      width: double.maxFinite,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          value: selectedItem,
                          items: const [
                            DropdownMenuItem(
                              value: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text('FIRST TERM'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text('SECOND TERM'),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            void doSomething() => onTermSelected(value!);
                            context
                                .read<AppBloc>()
                                .add(NotifyConfirmationEvent(doSomething));
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Expanded(
        child: Container(
          color: Colors.white,
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Select your Grading System"),
                const SizedBox(
                  height: 5,
                ),
                BlocBuilder<AdminSettingsBloc, AdminSettingsState>(
                  buildWhen: (previous, current) {
                    return current is ExamScoreTypeState ||
                        current is ExamScoreTypeStateSecond;
                  },
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Text('40  60'),
                            Radio(
                                value: 1,
                                groupValue: examTypeRadioGroupValue,
                                onChanged: (val) {
                                  onExamScoreTypeChange(val);
                                })
                          ],
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        Row(
                          children: [
                            const Text('30  70'),
                            Radio(
                                value: 2,
                                groupValue: examTypeRadioGroupValue,
                                onChanged: (val) {
                                  onExamScoreTypeChange(val);
                                })
                          ],
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      )
    ];
    return size.width > 700
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children2,
          )
        : SizedBox(
            height: 170,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children2,
            ),
          );
  }
}
