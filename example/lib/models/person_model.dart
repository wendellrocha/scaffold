import 'dart:convert';

final class PersonMoodel {
  final String name;
  final int age;

  const PersonMoodel({
    required this.name,
    required this.age,
  });

  PersonMoodel copyWith({
    String? name,
    int? age,
  }) {
    return PersonMoodel(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
    };
  }

  factory PersonMoodel.fromMap(Map<String, dynamic> map) {
    return PersonMoodel(
      name: map['name'] as String,
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonMoodel.fromJson(String source) =>
      PersonMoodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PersonMoodel(name: $name, age: $age)';

  @override
  bool operator ==(covariant PersonMoodel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}
