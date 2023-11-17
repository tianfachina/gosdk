package com.example.gosdk


import android.util.Log
import androidx.annotation.NonNull
//import go.xhsbeian.gojni.Xhsbeian
import xhsbeian.Xhsbeian

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** GosdkPlugin */
class GosdkPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "gosdk")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
        "getPlatformVersion" -> {
          result.success("Android ${android.os.Build.VERSION.RELEASE}")
        }
        "sendCode" -> {
          val text:String = (call.argument<String>("text"))?:""
            result.success(Xhsbeian.sendCode(text))
        }
        "login" -> {
            val name:String = (call.argument<String>("name")) ?:""
            val department:String = (call.argument<String>("department")) ?:""
            val phone:String = (call.argument<String>("phone")) ?:""
            val code:String = (call.argument<String>("code"))?:""
            result.success(Xhsbeian.login(name,department,phone,code))
        }
        else -> {
          result.notImplemented()
        }
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
