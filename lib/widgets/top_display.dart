import 'package:flutter/material.dart';

class TopHalfDisplay extends StatelessWidget {
  final String text1;
  final String text2;
  const TopHalfDisplay({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Fixed size, doesn't scroll
          Text(
            text1,
            style: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 52, 64, 84),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            text2,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 52, 64, 84),
              fontWeight: FontWeight.w400,
            ),
          ),

          // Expanded makes it fill in all the remaining space
        ],
      ),
    );
  }
}

class TopHalfDisplayIncomeExpenses extends StatelessWidget {
  final String text1;
  const TopHalfDisplayIncomeExpenses({
    super.key,
    required this.text1,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Fixed size, doesn't scroll
          Text(
            text1,
            style: const TextStyle(
              fontSize: 32,
              color: Color.fromARGB(255, 52, 64, 84),
              fontWeight: FontWeight.bold,
            ),
          ),

          // Expanded makes it fill in all the remaining space
        ],
      ),
    );
  }
}
