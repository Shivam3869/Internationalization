import 'package:flutter/material.dart';

import 'international/international_app.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

String logoutSuccessful = "Logout Successfully";

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("internationalization"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InternationalizationHome()));
              }, child: Builder(builder: (context) {
                return const Text("Internationalization");
              })),
            ],
          ),
        ));
  }
}
