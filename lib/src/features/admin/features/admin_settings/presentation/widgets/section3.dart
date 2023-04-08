import 'package:api_tempate_flutter/src/features/admin/features/admin_settings/data/models/subject.dart';
import 'package:api_tempate_flutter/src/features/admin/features/admin_settings/presentation/bloc/admin_settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/constants/constants.dart';

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSenior = false;
    bool isJunior = true;
    Set<int> juniorSchoolSubjectSet = {};
    Set<int> seniorSchoolSubjectSet = {};
    BuildContext? selectorBlocContext;
    List<Subject> subjectList = [];

    void onCheckJuniorSchool(bool? value, int subjectId) {
      if (value == null) return;
      if (value) {
        juniorSchoolSubjectSet.add(subjectId);
      } else {
        juniorSchoolSubjectSet.remove(subjectId);
      }
    }

    void onCheckSeniorSchool(bool? value, int subjectId) {
      if (value == null) return;
      if (value) {
        seniorSchoolSubjectSet.add(subjectId);
      } else {
        seniorSchoolSubjectSet.remove(subjectId);
      }
    }

    var size = MediaQuery.of(context).size;
    List<Widget> generateCheckBox(BuildContext ctx, List<Subject> subjects) {
      return subjects
          .map((subject) => SizedBox(
                width: size.width > 700 ? size.width * 0.2 : double.maxFinite,
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
                      value: isJunior
                          ? juniorSchoolSubjectSet.contains(subject.id)
                          : seniorSchoolSubjectSet.contains(subject.id),
                      onChanged: (value) {
                        if (isJunior) {
                          onCheckJuniorSchool(value, subject.id);
                        } else {
                          onCheckSeniorSchool(value, subject.id);
                        }
                        ctx.read<SelectorBloc>().add(SelectedEvent(subject.id));
                      },
                    ),
                  ],
                ),
              ))
          .toList();
    }

    void onChangeToSecondarySchool() {
      context
          .read<AdminSettingsBloc>()
          .add(const ChangeJuniorSeniorEvent(true));
      selectorBlocContext!.read<SelectorBloc>().add(SelectedEvent(-2));
    }

    void onChangeToJuniorSchool() {
      context
          .read<AdminSettingsBloc>()
          .add(const ChangeJuniorSeniorEvent(false));
      selectorBlocContext!.read<SelectorBloc>().add(SelectedEvent(-2));
    }

    //Get the list of subjects
    context.read<AdminSettingsBloc>().add(GetAllSchoolSubjectEvent());

    return BlocListener<AdminSettingsBloc, AdminSettingsState>(
      listener: (context, state) {
        if (state is GetAllSchoolSubjectState) {
          subjectList = state.schoolSubjectsList;
          selectorBlocContext!.read<SelectorBloc>().add(SelectedEvent(-3));
        }
        if (state is SuniorAndSeniorSchoolSubjectSet) {
          seniorSchoolSubjectSet = state.seniorSchoolSubjectSet;
          juniorSchoolSubjectSet = state.juniorSchoolSubjectSet;
          selectorBlocContext!.read<SelectorBloc>().add(SelectedEvent(-3));
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("SUBJECTS SELECTION"),
                        const SizedBox(
                          height: 5,
                        ),
                        BlocBuilder<AdminSettingsBloc, AdminSettingsState>(
                          buildWhen: (previous, current) {
                            return current is JuniorSchoolState ||
                                current is SeniorSchoolState;
                          },
                          builder: (context, state) {
                            if (state is JuniorSchoolState) {
                              isJunior = true;
                              isSenior = false;
                            } else if (state is SeniorSchoolState) {
                              isSenior = true;
                              isJunior = false;
                            }
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                schoolWithSection('JUNIOR SCHOOL', isJunior,
                                    onChangeToJuniorSchool),
                                schoolWithSection('SENIOR SCHOOL', isSenior,
                                    onChangeToSecondarySchool),
                              ],
                            );
                          },
                        ),
                        BlocProvider(
                          create: (context) => SelectorBloc(),
                          child: BlocBuilder<SelectorBloc, int>(
                            builder: (context, state) {
                              selectorBlocContext = context;
                              return SizedBox(
                                height: 150,
                                width: double.maxFinite,
                                child: ListView.builder(
                                  itemCount: (subjectList.length / 3).ceil(),
                                  itemBuilder: (context, index) {
                                    int startIndex = index * 3;
                                    int endIndex = startIndex + 3;
                                    List<Subject> subjects =
                                        subjectList.sublist(
                                            startIndex,
                                            endIndex
                                                .clamp(0, subjectList.length)
                                                .toInt());

                                    return size.width > 700
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: generateCheckBox(
                                                context, subjects),
                                          )
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: generateCheckBox(
                                                context, subjects),
                                          );
                                  },
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelectorBloc extends Bloc<SelectorEvent, int> {
  SelectorBloc() : super(-1) {
    int selected = -1;
    on<SelectorEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SelectedEvent>((event, emit) {
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

abstract class SelectorEvent {
  const SelectorEvent();
  @override
  List<Object> get props => [];
}

class SelectedEvent extends SelectorEvent {
  final int currentSelect;

  SelectedEvent(this.currentSelect);
}

Widget schoolWithSection(
    String school, bool isUnderLined, Function changeSection) {
  return TextButton(
      onPressed: () => changeSection(),
      child: Text(
        school,
        style: TextStyle(
          color: Colors.black,
          decoration:
              isUnderLined ? TextDecoration.underline : TextDecoration.none,
          decorationColor: Colors.black,
          decorationThickness: 2,
        ),
      ));
}
