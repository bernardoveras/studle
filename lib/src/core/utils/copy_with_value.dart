class CopyWithValue<T> {
  /// Whether this [CopyWithValue] wrapper contains a present [value] that should be
  /// inserted or updated.
  final bool present;

  final T? _value;

  /// If this value is [present], contains the value to update or insert.
  T get value => _value as T;

  /// Create a (present) value by wrapping the [value] provided.
  const CopyWithValue(T value)
      : _value = value,
        present = true;

  /// Create an absent value that will not be written into the database, the
  /// default value or null will be used instead.
  const CopyWithValue.absent()
      : _value = null,
        present = false;

  /// Create a value that is absent if [value] is `null` and [present] if it's
  /// not.
  ///
  /// The functionality is equiavalent to the following:
  /// `x != null ? Value(x) : Value.absent()`.
  ///
  /// This constructor should only be used when [T] is not nullable. If [T] were
  /// nullable, there wouldn't be a clear interpretation for a `null` [value].
  /// See the overall documentation on [CopyWithValue] for details.
  const CopyWithValue.ofNullable(T? value)
      : assert(
          value != null || null is! T,
          "Value.ofNullable(null) can't be used for a nullable T, since the "
          'null value could be both absent and present.',
        ),
        _value = value,
        present = value != null;

  @override
  String toString() => present ? 'Value($value)' : 'Value.absent()';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CopyWithValue && present == other.present && _value == other._value;

  @override
  int get hashCode => present.hashCode ^ _value.hashCode;
}