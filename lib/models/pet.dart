import 'dart:convert';

class Pet {
  String petName;
  String specie;
  bool isDog;
  String id;
  Pet({
    required this.petName,
    required this.specie,
    required this.isDog,
    required this.id,
  });

  Pet copyWith({
    String? petName,
    String? specie,
    bool? isDog,
    String? id,
  }) {
    return Pet(
      petName: petName ?? this.petName,
      specie: specie ?? this.specie,
      isDog: isDog ?? this.isDog,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'petName': petName,
      'specie': specie,
      'isDog': isDog,
      'id': id,
    };
  }

  factory Pet.fromMap(Map<String, dynamic> map) {
    return Pet(
      petName: map['petName'],
      specie: map['specie'],
      isDog: map['isDog'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pet.fromJson(String source) => Pet.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Pet(petName: $petName, specie: $specie, isDog: $isDog, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Pet &&
      other.petName == petName &&
      other.specie == specie &&
      other.isDog == isDog &&
      other.id == id;
  }

  @override
  int get hashCode {
    return petName.hashCode ^
      specie.hashCode ^
      isDog.hashCode ^
      id.hashCode;
  }
}
