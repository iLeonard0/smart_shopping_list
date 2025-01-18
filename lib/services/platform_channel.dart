import 'package:flutter/services.dart';

class PlatformChannelService {
  static const platform = MethodChannel('com.example.smart_shopping_list/channel');

  Future<String> getPlatformData() async {
    try {
      final String result = await platform.invokeMethod('getPlatformData');
      return result;
    } on PlatformException catch (e) {
      return "Erro: ${e.message}";
    }
  }
}
