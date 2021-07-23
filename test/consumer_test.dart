import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:my_provider/index.dart';
import 'package:my_provider/provider_controller.dart';

const providerKey = 'SIMPLE_PROVIDER';
const providerKey2 = 'SIMPLE_PROVIDER2';
const valueString = 'HELLO';
const valueStringNext = 'GOOD BYE';
const valueString3rd = 'provider_vn';

main() {
  testWidgets("Consumer: basic usage", (WidgetTester tester) async {
    ProviderController providerController = new ProviderController();
    // provider cho key 1
    var simpleProvider =
        Provider<String?>(providerKey: providerKey, value: valueString);
    // provider cho key 2
    var simpleProvider2 =
        Provider<String?>(providerKey: providerKey2, value: valueString3rd);
    providerController.addProvider(providers: [simpleProvider,simpleProvider2]);
    var consumer = Consumer<String>(
        providerController: providerController,
        providerKey: providerKey,
        builder: (context, value) {
          return Text(value, textDirection: TextDirection.ltr);
        });
    var consumerKey2 = Consumer<String>(
        providerController: providerController,
        providerKey: providerKey2,
        builder: (context, value) {
          return Text(value, textDirection: TextDirection.ltr);
        });

    // test lan dau
    await tester.pumpWidget(Column(
      children: [
        consumer,consumerKey2
      ],
    ));
    var valueFinder = find.text(valueString);


    expect(valueFinder, valueFinder);

    // test thử thay đổi cho key 2
    await providerController.getProviderByKey(key: providerKey2)!.setValue(valueString3rd);
    await tester.pump();
    valueFinder = find.text(valueString3rd);
    expect(valueFinder, valueFinder);
  //   // test lần 2
  //   await providerController
  //       .getProviderByKey(key: providerKey)!
  //       .setValue(valueStringNext);
  //   // with initial value
  //   await tester.pump();
  //   valueFinder = find.text(valueStringNext);
  //   expect(valueFinder, findsOneWidget);
  //
  //   // test lần 3
  //   await providerController
  //       .getProviderByKey(key: providerKey)!
  //       .setValue(valueString3rd);
  //   await tester.pump();
  //   valueFinder = find.text(valueString3rd);
  //   expect(valueFinder, findsOneWidget);
  });
}
