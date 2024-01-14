import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wireless_headphone_store/screens/headphones/_partials/headphones_screen_content.dart';
import 'package:wireless_headphone_store/screens/headphones/_partials/headphones_screen_header.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.chevron_left,
          size: 32,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 32,
            ),
          )
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              HeadphonesScreenHeader(),
              SizedBox(height: 20),
              HeadphonesScreenContent(),
            ],
          ),
        ),
      ),
    );
  }
}
