enum PersonGender {
  feminine(description: 'Feminino'),
  masculine(description: 'Masculino');

  final String description;

  const PersonGender({required this.description});

  factory PersonGender.fromInt(int value) => PersonGender.values[value];
}
