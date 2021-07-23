class Provider<TValue> {
  Provider({required this.providerKey, this.value});

  final String providerKey;
  final TValue? value;

  setValue(TValue nextValue) {
    throw UnimplementedError();
  }
}
