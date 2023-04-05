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
    List<bool> selectedSeniorSubject = List<bool>.filled(40, false);
    List<bool> selectedJuniorSubject = List<bool>.filled(40, false);
    BuildContext? SelectorBlocContext;
    List<Widget> generateCheckBox(BuildContext ctx) {
      List<Widget> item = [];
      var size = MediaQuery.of(context).size;
      for (var i = 0; i < Constants.subjects.length; i += 3) {
        List<Widget> rowItem = [];
        for (var j = i; (j < i + 3 && j < Constants.subjects.length); j++) {
          rowItem.add(SizedBox(
            width: size.width > 700 ? size.width * 0.2 : double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  Constants.subjects[j],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
                const SizedBox(
                  width: 10,
                ),
                Checkbox(
                  shape: const CircleBorder(),
                  value: isJunior
                      ? selectedJuniorSubject[j]
                      : selectedSeniorSubject[j],
                  onChanged: (value) {
                    if (isJunior) {
                      selectedJuniorSubject[j] = value!;
                    } else {
                      selectedSeniorSubject[j] = value!;
                    }
                    ctx.read<SelectorBloc>().add(SelectedEvent(j));
                  },
                ),
              ],
            ),
          ));
        }
        item.add(size.width > 700
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: rowItem,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: rowItem,
              ));
      }
      return item;
    }

    void onChangeToSecondarySchool() {
      context
          .read<AdminSettingsBloc>()
          .add(const ChangeJuniorSeniorEvent(true));
      SelectorBlocContext!.read<SelectorBloc>().add(SelectedEvent(-2));
    }

    void onChangeToJuniorSchool() {
      context
          .read<AdminSettingsBloc>()
          .add(const ChangeJuniorSeniorEvent(false));
      SelectorBlocContext!.read<SelectorBloc>().add(SelectedEvent(-2));
    }

    return Padding(
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
                            SelectorBlocContext = context;
                            return Column(
                              children: generateCheckBox(context),
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
