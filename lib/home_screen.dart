import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<String> callFriend() {
    bool isMotherCalled = Random().nextBool();
    print(isMotherCalled);
    if (isMotherCalled) {
      return Future.error("mommy called");
    }
    return Future.delayed(Duration(seconds: 2), () {
      return "ami asci";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<String>(
          future: callFriend(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error as String);
            } else {
              return Text(snapshot.data ?? "");
            }
          },
        ),
      ),
    );
  }
}
