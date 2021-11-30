import 'dart:convert';

class Vaccine {
  String id;
  String vaccine;
  DateTime createdAt;
  Vaccine({
    required this.id,
    required this.vaccine,
    required this.createdAt,
  });

  Vaccine copyWith({
    String? id,
    String? vaccine,
    DateTime? createdAt,
  }) {
    return Vaccine(
      id: id ?? this.id,
      vaccine: vaccine ?? this.vaccine,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'vaccine': vaccine,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Vaccine.fromMap(Map<String, dynamic> map) {
    return Vaccine(
      id: map['id'],
      vaccine: map['vaccine'],
      createdAt: DateTime.parse(map['createdAt'].toDate().toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory Vaccine.fromJson(String source) =>
      Vaccine.fromMap(json.decode(source));

  @override
  String toString() =>
      'Vaccine(id: $id, vaccine: $vaccine, createdAt: $createdAt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Vaccine &&
        other.id == id &&
        other.vaccine == vaccine &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => id.hashCode ^ vaccine.hashCode ^ createdAt.hashCode;
}
