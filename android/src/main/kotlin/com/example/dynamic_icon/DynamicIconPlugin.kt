package com.example.dynamic_icon

import android.content.ComponentName
import android.content.Context
import android.content.pm.PackageManager
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** DynamicIconPlugin */
class DynamicIconPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    var iconList: List<String> = emptyList()
    var appContext: Context? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        appContext = flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "dynamic_icon")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "setupAppIcon") {
            val iconName = call.arguments.toString();
            val isSuccess = setupIcon(iconName)
            result.success(isSuccess)
        } else if (call.method == "setupIconList") {
            iconList = call.arguments as List<String>
            result.success("设置成功")
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun setupIcon(iconName: String): Boolean {
        val context = appContext ?: return false
        for (name in iconList) {
            var cName = name;
            if (name == "default") {
                cName = "MainActivity"
            }
            val componentName = ComponentName(context, context.packageName + ".$cName")
            val enable = name == iconName;
            updateAlias(enable, componentName)
        }
        return true;
    }


    private fun updateAlias(enable: Boolean, componentName: ComponentName) {
        val context = appContext ?: return
        val newState = if (enable) {
            PackageManager.COMPONENT_ENABLED_STATE_ENABLED
        } else {
            PackageManager.COMPONENT_ENABLED_STATE_DISABLED
        }
        context.packageManager.setComponentEnabledSetting(componentName, newState, PackageManager.DONT_KILL_APP)
    }
}
