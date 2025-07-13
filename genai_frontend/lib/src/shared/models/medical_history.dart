class MedicalHistory {
  final int? id;
  final int patientId;

  // Main fields from form
  final String diagnosis;
  final String notes;
  final String? condition;
  final String? description;
  final List<String> medications;
  final String severity;

  // Vitals
  final double? height;
  final double? weight;
  final double? bloodPressure;
  final double? heartRate;
  final double? temperature;

  final String? conclusion;
  final String? fileUrl;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  MedicalHistory({
    this.id,
    required this.patientId,
    required this.diagnosis,
    required this.notes,
    this.condition,
    this.description,
    this.medications = const [],
    required this.severity,
    this.height,
    this.weight,
    this.bloodPressure,
    this.heartRate,
    this.temperature,
    this.conclusion,
    this.fileUrl,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'patient_id': patientId,
      'diagnosis': diagnosis,
      'notes': notes,
      'condition': condition,
      'description': description,
      'medications': medications.join(','),
      'severity': severity,
      'height': height,
      'weight': weight,
      'blood_pressure': bloodPressure,
      'heart_rate': heartRate,
      'temperature': temperature,
      'conclusion': conclusion,
      'file_url': fileUrl,
      if (createdAt != null) 'created_at': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updated_at': updatedAt!.toIso8601String(),
    };
  }

  factory MedicalHistory.fromMap(Map<String, dynamic> map) {
    return MedicalHistory(
      id: map['id'],
      patientId: map['patient_id'],
      diagnosis: map['diagnosis'] ?? '',
      notes: map['notes'] ?? '',
      condition: map['condition'],
      description: map['description'],
      medications: map['medications'] != null
          ? map['medications']
                .toString()
                .split(',')
                .where((m) => m.isNotEmpty)
                .toList()
          : [],
      severity: map['severity'],
      height: map['height'],
      weight: map['weight'],
      bloodPressure: map['blood_pressure'],
      heartRate: map['heart_rate'],
      temperature: map['temperature'],
      conclusion: map['conclusion'],
      fileUrl: map['file_url'],
      createdAt: map['created_at'] != null
          ? DateTime.parse(map['created_at'])
          : null,
      updatedAt: map['updated_at'] != null
          ? DateTime.parse(map['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory MedicalHistory.fromJson(Map<String, dynamic> json) =>
      MedicalHistory.fromMap(json);

  MedicalHistory copyWith({
    int? id,
    int? patientId,
    String? diagnosis,
    String? notes,
    String? condition,
    String? description,
    List<String>? medications,
    String? severity,
    double? height,
    double? weight,
    double? bloodPressure,
    double? heartRate,
    double? temperature,
    String? conclusion,
    String? fileUrl,
    DateTime? diagnosisDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return MedicalHistory(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      diagnosis: diagnosis ?? this.diagnosis,
      notes: notes ?? this.notes,
      condition: condition ?? this.condition,
      description: description ?? this.description,
      medications: medications ?? this.medications,
      severity: severity ?? this.severity,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      bloodPressure: bloodPressure ?? this.bloodPressure,
      heartRate: heartRate ?? this.heartRate,
      temperature: temperature ?? this.temperature,
      conclusion: conclusion ?? this.conclusion,
      fileUrl: fileUrl ?? this.fileUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
