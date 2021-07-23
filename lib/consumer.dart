import 'package:flutter/widgets.dart';
import 'package:my_provider/provider_controller.dart';

class Consumer<TValue> extends StatefulWidget {
  Consumer({required this.providerKey, required this.builder,required this.providerController});

  final String providerKey;
  final Function(BuildContext context, TValue child) builder;
  final ProviderController providerController;

  @override
  _ConsumerState<TValue> createState() => _ConsumerState<TValue>();
}

class _ConsumerState<TValue> extends State<Consumer<TValue>> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.providerController.getStream(key: widget.providerKey).stream,
      builder: (context, snapshot) => widget.builder(context,widget.providerController.getValue(key: widget.providerKey)),
    );

    return this.widget.builder(context,widget.providerController.getValue(key: this.widget.providerKey));
  }
}

