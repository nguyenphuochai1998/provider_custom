import 'package:flutter/widgets.dart';

class Consumer<TValue> extends StatelessWidget {
  Consumer({required this.providerKey, required this.builder});

  final String providerKey;
  final Function(BuildContext context, TValue child) builder;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
