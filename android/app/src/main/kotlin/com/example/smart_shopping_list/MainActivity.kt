package com.example.smart_shopping_list

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import android.util.Log

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.smart_shopping_list/channel"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        MethodChannel(flutterEngine!!.dartExecutor, CHANNEL).setMethodCallHandler { call, result ->
            // Quando o Flutter fizer uma chamada
            if (call.method == "getPlatformData") {
                val platformData = getPlatformData()
                if (platformData != null) {
                    result.success(platformData)  // Retorna o dado para o Flutter
                } else {
                    result.error("UNAVAILABLE", "Platform data not available.", null)
                }
            } else {
                result.notImplemented()  // Caso o método não esteja implementado
            }
        }
    }

    private fun getPlatformData(): String {
        // Retorna uma string simples ou dados processados do Android
        return "Dados do Android"
    }
}
