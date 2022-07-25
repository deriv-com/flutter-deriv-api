package com.deriv.flutter_deriv_api

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry

class FlutterDerivApiPlugin: FlutterPlugin, MethodCallHandler {
  companion object {
    const val CHANNEL_NAME = "flutter_deriv_api"

    @JvmStatic
    fun registerWith(registrar: PluginRegistry.Registrar) {
      val instance = FlutterDerivApiPlugin()

      instance.setupChannel(registrar.messenger())
    }
  }

  private lateinit var channel: MethodChannel

  override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    setupChannel(binding.binaryMessenger)
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else {
      result.notImplemented()
    }
  }

  private fun setupChannel(messenger: BinaryMessenger) {
    channel = MethodChannel(messenger, CHANNEL_NAME)
    channel.setMethodCallHandler(this)
  }
}
