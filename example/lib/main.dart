import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:gosdk/gosdk.dart';
import 'package:gosdk_example/method_channel_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await Gosdk.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body:Column(
          children: [
            InkWell(
              onTap: () async {
                String resultString = await MethodChannelUtils.sendCode('19951552676');
                dynamic result = jsonDecode(resultString);
                debugPrint('result------>${result['massage']}');
              },
              child: Container(
                height: 100,
                width: 200,
                color: Colors.green,
                child: const Text('send'),
              ),
            ),
            InkWell(
              onTap: () async {
                String resultString = await MethodChannelUtils.login(name: '张三',department: '北京综合支持中心',phone:'19951552676',code: '238467');
                dynamic result = jsonDecode(resultString);
                debugPrint('result------>${result['massage']}');
              },
              child: Container(
                height: 100,
                width: 200,
                color: Colors.green,
                child: const Text('login'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
