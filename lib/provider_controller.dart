import 'dart:async';

import 'package:my_provider/index.dart';

class ProviderController {
  Map<String, Provider> providers = {};


  void addProvider({required List<Provider> providers}) {
    providers.forEach((provider) {
      this.providers[provider.getKey()] = provider;
    });
  }
  Provider? getProviderByKey({required key}){
    return this.providers[key];
  }
  dynamic getValue({required key}){
    return this.providers[key]!.getValue();
  }
  StreamController getStream({required key}){
    return this.providers[key]!.getStream();
  }


}
