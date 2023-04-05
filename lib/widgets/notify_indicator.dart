import 'package:flutter/material.dart';

class Notify {
  static Future<dynamic> askConfirmationNotify(
      BuildContext context, Function function) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm your choice'),
          content:
              const Text('Are you sure you want to proceed with this action?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(
                    context, false); // Return false to indicate cancel
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
                function(); // Return true to indicate confirmation
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  static Widget success1(
      BuildContext context, String message, Function function) {
    return GestureDetector(
      onTap: () => function(),
      child: Container(
        color: const Color.fromRGBO(0, 0, 0, 0.6),
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check,
                  size: 40,
                  color: Colors.green,
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }

  static Widget error(BuildContext context, String message, Function function) {
    return GestureDetector(
      onTap: () => function(),
      child: Container(
        color: const Color.fromRGBO(0, 0, 0, 0.6),
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 40,
                    color: Colors.red,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  static Widget loading1(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: const Color.fromRGBO(0, 0, 0, 0.6),
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget smallLoading(BuildContext context, Color color,
      {double width = 20, double height = 20}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: width,
                height: height,
                child: CircularProgressIndicator(
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget delete(
    BuildContext context,
    Function functionCancel,
    Function functionOk,
  ) {
    return Container(
      color: const Color.fromRGBO(0, 0, 0, 0.6),
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Container(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.delete,
                size: 40,
                color: Colors.red,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buttonDelete(functionCancel, 'Cancel'),
                  const SizedBox(
                    width: 20,
                  ),
                  _buttonDelete(functionOk, 'Delete'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget confirmation(BuildContext context, Function functionCancel,
      Function functionOk, String message) {
    return Container(
      color: const Color.fromRGBO(0, 0, 0, 0.6),
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Container(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buttonDelete(functionCancel, 'Cancel'),
                  const SizedBox(
                    width: 20,
                  ),
                  _buttonDelete(functionOk, 'Yes'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buttonDelete(Function action, String text) {
    return GestureDetector(
      onTap: () => action(),
      child: Container(
          width: 80,
          height: 40,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Center(
              child: Text(
            text,
            style: const TextStyle(fontSize: 20),
          ))),
    );
  }
}
