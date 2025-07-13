class AIReport {
  final int id;
  final int medicalHistoryId;
  final String title;
  final String content;
  final DateTime createdAt;

  AIReport({
    required this.id,
    required this.medicalHistoryId,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'medical_history_id': medicalHistoryId,
      'title': title,
      'content': content,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory AIReport.fromMap(Map<String, dynamic> map) {
    return AIReport(
      id: map['id'],
      medicalHistoryId: map['medical_history_id'],
      title: map['title'],
      content: map['content'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  Map<String, dynamic> toJson() => toMap();
  factory AIReport.fromJson(Map<String, dynamic> json) =>
      AIReport.fromMap(json);

  AIReport copyWith({
    int? id,
    int? medicalHistoryId,
    String? title,
    String? content,
    DateTime? createdAt,
  }) {
    return AIReport(
      id: id ?? this.id,
      medicalHistoryId: medicalHistoryId ?? this.medicalHistoryId,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
