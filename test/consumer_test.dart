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
    // provider cho key 1
    var simpleProvider = MaterialApp(
      home: ProviderController(
          providers: [
            Provider<String?>(providerKey: providerKey, value: valueString)
          ],
          builderChild: () {
            return Consumer(
                providerKey: providerKey,
                builder: (context, value) {
                  return Column(
                    children: [
                      Text(
                        value.toString(),
                        textDirection: TextDirection.ltr,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ProviderController.of(context)
                              .getProviderByKey(key: providerKey)!
                              .setValue(valueStringNext);
                        },
                        child: Text("button"),
                      )
                    ],
                  );
                });
          }),
    );
    // test lan dau
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          return simpleProvider;
        },
      ),
    );
    var valueFinder = find.text(valueString);
    expect(valueFinder, valueFinder);

    final finder = find.byType(ElevatedButton);

    await tester.ensureVisible(finder);
    await tester.pump();

    await tester.tap(finder);
    await tester.pump();
    valueFinder = find.text(valueStringNext);
    expect(valueFinder, valueFinder);
    // final BuildContext context = tester.element(find.byType(ProviderController));
    // await ProviderController.of(context).getProviderByKey(key: providerKey)!.setValue(valueStringNext);
    // await tester.pump();
    // valueFinder = find.text(valueStringNext);
    // expect(valueFinder, valueFinder);
  });
}
