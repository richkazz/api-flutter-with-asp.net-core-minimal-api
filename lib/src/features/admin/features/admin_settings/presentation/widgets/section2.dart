import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/constants/constants.dart';
import '../bloc/admin_settings_bloc.dart';

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    int classSelectType = 1;
    List<bool> selectedClass = List<bool>.filled(40, false);
    List<Widget> generateCheckBox(BuildContext ctx) {
      List<Widget> item = [];

      item.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          SizedBox(width: 50, child: Text('Class')),
          SizedBox(width: 30, child: Center(child: Text('A'))),
          SizedBox(width: 30, child: Center(child: Text('B'))),
          SizedBox(width: 30, child: Center(child: Text('C'))),
          SizedBox(width: 30, child: Center(child: Text('D'))),
          SizedBox(width: 30, child: Center(child: Text('E'))),
          SizedBox(width: 30, child: Center(child: Text('F'))),
        ],
      ));
      int classIndex = 0;
      for (var i = 0; i <= 30; i += 6) {
        item.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 50, child: Text(Constants.classes[classIndex++])),
            Checkbox(
              shape: const CircleBorder(),
              value: selectedClass[i],
              onChanged: (value) {
                selectedClass[i] = value!;
                ctx.read<ClassSelectorBloc>().add(SelectedClassEvent(i));
              },
            ),
            Checkbox(
              shape: const CircleBorder(),
              value: selectedClass[i + 1],
              onChanged: (value) {
                selectedClass[i + 1] = value!;
                ctx.read<ClassSelectorBloc>().add(SelectedClassEvent(i + 1));
              },
            ),
            Checkbox(
              shape: const CircleBorder(),
              value: selectedClass[i + 2],
              onChanged: (value) {
                selectedClass[i + 2] = value!;
                ctx.read<ClassSelectorBloc>().add(SelectedClassEvent(i + 2));
              },
            ),
            Checkbox(
              shape: const CircleBorder(),
              value: selectedClass[i + 3],
              onChanged: (value) {
                selectedClass[i + 3] = value!;
                ctx.read<ClassSelectorBloc>().add(SelectedClassEvent(i + 3));
              },
            ),
            Checkbox(
              shape: const CircleBorder(),
              value: selectedClass[i + 4],
              onChanged: (value) {
                selectedClass[i + 4] = value!;
                ctx.read<ClassSelectorBloc>().add(SelectedClassEvent(i + 4));
              },
            ),
            Checkbox(
              shape: const CircleBorder(),
              value: selectedClass[i + 5],
              onChanged: (value) {
                selectedClass[i + 5] = value!;
                ctx.read<ClassSelectorBloc>().add(SelectedClassEvent(i + 5));
              },
            ),
          ],
        ));
      }
      return item;
    }

    var size = MediaQuery.of(context).size;
    List<Widget> children2 = [
      size.width > 700
          ? Expanded(
              child:
                  ClassSettings(size: size, classSelectType: classSelectType),
            )
          : ClassSettings(size: size, classSelectType: classSelectType),
      const SizedBox(
        height: 10,
        width: 10,
      ),
      MultipleClassSelection(
        generateCheckBox: generateCheckBox,
      )
    ];
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: size.width > 700
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children2,
            )
          : SizedBox(
              height: 600,
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
              BlocProvider(
                create: (context) => ClassSelectorBloc(),
                child: BlocBuilder<ClassSelectorBloc, int>(
                  builder: (context, state) {
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
    );
  }
}

class ClassSettings extends StatelessWidget {
  const ClassSettings({
    super.key,
    required this.size,
    required this.classSelectType,
  });

  final Size size;
  final int classSelectType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: size.width > 700 ? 270 : 100,
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
