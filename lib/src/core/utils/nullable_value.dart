class NullableValue<T> {
  final T? _value;

  T get value => _value as T;

  const NullableValue(T value) : _value = value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NullableValue && _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}
