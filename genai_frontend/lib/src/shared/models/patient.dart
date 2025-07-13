class Patient {
  final int id;
  final String name;
  final String phone;
  final String homeAddress;
  final DateTime createdAt;
  final DateTime updatedAt;

  Patient({
    required this.id,
    required this.name,
    required this.phone,
    required this.homeAddress,
    required this.createdAt,
    required this.updatedAt,
  });

  // Convert Patient to Map for database storage
  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'name': name,
      'phone': phone,
      'home_address': homeAddress,
      // 'created_at': createdAt.toIso8601String(),
      // 'updated_at': updatedAt.toIso8601String(),
    };
  }

  // Create Patient from Map
  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      homeAddress: map['home_address'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() => toMap();

  // Create from JSON
  factory Patient.fromJson(Map<String, dynamic> json) => Patient.fromMap(json);

  // CopyWith method for updates
  Patient copyWith({
    int? id,
    String? name,
    String? phone,
    String? homeAddress,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Patient(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      homeAddress: homeAddress ?? this.homeAddress,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'Patient(id: $id, name: $name, phone: $phone, homeAddress: $homeAddress)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Patient && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
