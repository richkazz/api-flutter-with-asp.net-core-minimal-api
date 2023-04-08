import 'package:api_tempate_flutter/core/constants/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/constants/constants.dart';
import '../bloc/admin_settings_bloc.dart';

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    const int classSelectType = 1;
    final Layout layout = Layout(context: context);
    final List<bool> selectedClass = List.filled(40, false);
    Set<String> schoolClasses = {};

    final children2 = [
      if (layout.isLargeScreen)
        const Expanded(
          child: ClassSettings(classSelectType: classSelectType),
        )
      else
        const ClassSettings(classSelectType: classSelectType),
      const SizedBox(
        height: 10,
        width: 10,
      ),
      MultipleClassSelection(generateCheckBox: () {}),
    ];

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: layout.isLargeScreen
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children2,
            )
          : SizedBox(
              height: 400,
              child: Column(
                children: children2,
              ),
            ),
    );
  }
}

class MultipleClassSelection extends StatelessWidget {
  final Function generateCheckBox;
  const MultipleClassSelection({
    super.key,
    required this.generateCheckBox,
  });

  @override
  Widget build(BuildContext context) {
    final List<bool> selectedClass = List.filled(40, false);
    Set<String> schoolClasses = {};
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("MULTIPLE SELECTION"),
              const SizedBox(
                height: 2,
              ),
              const Text("select your class"),
              const SizedBox(
                height: 5,
              ),
              BlocBuilder<AdminSettingsBloc, AdminSettingsState>(
                buildWhen: (previous, current) {
                  if (current is SchoolClasseSetState) {
                    schoolClasses = current.schoolClasses;
                  }
                  return current is SchoolClasseSetState;
                },
                builder: (context, state) {
                  return BlocProvider(
                      create: (context) => ClassSelectorBloc(),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              SizedBox(width: 50, child: Text('Class')),
                              SizedBox(
                                  width: 30, child: Center(child: Text('A'))),
                              SizedBox(
                                  width: 30, child: Center(child: Text('B'))),
                              SizedBox(
                                  width: 30, child: Center(child: Text('C'))),
                              SizedBox(
                                  width: 30, child: Center(child: Text('D'))),
                              SizedBox(
                                  width: 30, child: Center(child: Text('E'))),
                              SizedBox(
                                  width: 30, child: Center(child: Text('F'))),
                            ],
                          ),
                          ...List.generate(6, (index) {
                            final startIndex = index * 6;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 50,
                                  child:
                                      Text(Constants.classes[startIndex ~/ 6]),
                                ),
                                ...List.generate(6, (subIndex) {
                                  final checkboxIndex = startIndex + subIndex;
                                  makeClassSelected(schoolClasses, startIndex,
                                      subIndex, selectedClass, checkboxIndex);
                                  return BlocBuilder<ClassSelectorBloc, int>(
                                    buildWhen: (previous, current) =>
                                        current == checkboxIndex ||
                                        (previous == checkboxIndex &&
                                            current == -1),
                                    builder: (context, state) {
                                      return Checkbox(
                                        shape: const CircleBorder(),
                                        value: selectedClass[checkboxIndex],
                                        onChanged: (value) {
                                          _addOrRemoveAClasssFromTheSet(
                                              value,
                                              schoolClasses,
                                              startIndex,
                                              subIndex);
                                          onCheckAClass(selectedClass,
                                              checkboxIndex, value, context);
                                        },
                                      );
                                    },
                                  );
                                }),
                              ],
                            );
                          }),
                        ],
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addOrRemoveAClasssFromTheSet(
      bool? value, Set<String> schoolClasses, int startIndex, int subIndex) {
    final classString = getClassAsString(startIndex, subIndex);
    if (value == true) {
      schoolClasses.add(classString);
    } else {
      schoolClasses.remove(classString);
    }
  }

  void onCheckAClass(List<bool> selectedClass, int checkboxIndex, bool? value,
      BuildContext ctx) {
    selectedClass[checkboxIndex] = value!;

    ctx.read<ClassSelectorBloc>().add(SelectedClassEvent(checkboxIndex));
  }

  void makeClassSelected(Set<String> schoolClasses, int startIndex,
      int subIndex, List<bool> selectedClass, int checkboxIndex) {
    if (schoolClasses.contains(getClassAsString(startIndex, subIndex))) {
      selectedClass[checkboxIndex] = true;
    }
  }

  String getClassAsString(int startIndex, int subIndex) =>
      "${Constants.classes[startIndex ~/ 6]}-${Constants.alphabets[subIndex]}";
}

class ClassSettings extends StatelessWidget {
  const ClassSettings({
    super.key,
    required this.classSelectType,
  });

  final int classSelectType;

  @override
  Widget build(BuildContext context) {
    final Layout layout = Layout(context: context);
    return Container(
      width: double.maxFinite,
      height: layout.isLargeScreen ? 270 : 100,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("CLASS SETTING"),
            const SizedBox(
              height: 2,
            ),
            const Text("Kindly select  your class setting format"),
            const SizedBox(
              height: 5,
            ),
            BlocBuilder<AdminSettingsBloc, AdminSettingsState>(
              buildWhen: (previous, current) {
                return false;
              },
              builder: (context, state) {
                return Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                            value: classSelectType,
                            items: const [
                              DropdownMenuItem(
                                value: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text('SINGLE SELECTION'),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text('MULTIPLE SELECTION'),
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              //onTermSelected(value!);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ClassSelectorBloc extends Bloc<ClassSelectorEvent, int> {
  ClassSelectorBloc() : super(-1) {
    int selected = -1;
    on<ClassSelectorEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SelectedClassEvent>((event, emit) {
      if (event.currentSelect == selected) {
        emit(-1);
        selected = -1;
      } else {
        selected = event.currentSelect;
        emit(event.currentSelect);
      }
    });
  }
}

abstract class ClassSelectorEvent {
  const ClassSelectorEvent();
  @override
  List<Object> get props => [];
}

class SelectedClassEvent extends ClassSelectorEvent {
  final int currentSelect;

  SelectedClassEvent(this.currentSelect);
}
