import 'package:flutter/material.dart';
import 'userform.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("User Details"),
          centerTitle: true,
        ),
        body: const UserForm(),
      );
}
