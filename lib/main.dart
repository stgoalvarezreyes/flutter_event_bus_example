import 'package:example_event_bus/page/home_page.dart';
import 'package:example_event_bus/service/event_bus_service.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

void main() {
  Get.put(EventBusService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
      home: const HomePage(title: 'Flutter Event Bus Example'),
      debugShowCheckedModeBanner: false,
    );
  }
}
