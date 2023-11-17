

import 'package:flutter/services.dart';

class MethodChannelUtils {

  static const MethodChannel goSdkChannel = MethodChannel('gosdk');


  static Future<String?> getSayHi(String text) async {
    final sayHi = await goSdkChannel.invokeMethod<String>(
      'getSayHi',
      {"text": text},
    );
    return sayHi;
  }

  static Future sendCode(String text) async {
    return await goSdkChannel.invokeMethod('sendCode',{"text": text});
  }

  static Future login({required String name,required String department,required String phone,required String code}) async {
    return await goSdkChannel.invokeMethod('login',{"name":name,"department":department,"phone": phone,"code": code});
  }

}
