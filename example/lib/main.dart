import 'package:flutter/material.dart';
import 'package:lq_dynamic_icon/dynamic_icon.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final _dynamicIconPlugin = DynamicIcon(iconList: ['default', 'icon2', 'icon3']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置应用图标'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
                onPressed: () {
                  _dynamicIconPlugin.setupAppIcon('default');
                },
                child: const Text('设置Icon1')),
            const SizedBox(height: 30),
            TextButton(
                onPressed: () {
                  _dynamicIconPlugin.setupAppIcon('icon2');
                },
                child: const Text('设置Icon2')),
            const SizedBox(height: 30),
            TextButton(
                onPressed: () {
                  _dynamicIconPlugin.setupAppIcon('icon3');
                },
                child: const Text('设置Icon3')),
          ],
        ),
      ),
    );
  }
}
