import 'package:flutter/material.dart';

AppBar adminAppBar(String title) {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Stack(
          children: [
            Center(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.logout, color: Colors.black),
              ),
            ),
            const Positioned(
              top: 38,
              child: Center(
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
    title: Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 15, color: Colors.black),
      ),
    ),
    leadingWidth: 300,
    backgroundColor: Colors.white,
    leading: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        SizedBox(
          width: 10,
        ),
        Icon(Icons.account_balance, color: Colors.black),
        SizedBox(
          width: 37,
        ),
        Expanded(
          child: Text(
            "SMART BRAINS",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        )
      ],
    ),
  );
}
