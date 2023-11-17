
import 'dart:async';

import 'package:flutter/services.dart';

class Gosdk {
  static const MethodChannel _channel = MethodChannel('gosdk');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
