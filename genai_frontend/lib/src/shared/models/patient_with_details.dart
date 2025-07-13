import '../models/patient.dart';
import '../models/medical_history.dart';
import '../models/ai_report.dart';

class PatientWithDetails {
  final Patient patient;
  final List<MedicalHistory> medicalHistory;
  // final List<AIReport> recentReports;

  PatientWithDetails({
    required this.patient,
    required this.medicalHistory,
    // required this.recentReports,
  });

  Map<String, dynamic> toMap() {
    return {
      'patient': patient.toMap(),
      'medical_history': medicalHistory.map((h) => h.toMap()).toList(),
      // 'recent_reports': recentReports.map((r) => r.toMap()).toList(),
    };
  }

  factory PatientWithDetails.fromMap(Map<String, dynamic> map) {
    return PatientWithDetails(
      patient: Patient.fromMap(map['patient']),
      medicalHistory: List<MedicalHistory>.from(
        map['medical_history']?.map((h) => MedicalHistory.fromMap(h)) ?? [],
      ),
      // recentReports: List<AIReport>.from(
      //   map['recent_reports']?.map((r) => AIReport.fromMap(r)) ?? [],
      // ),
    );
  }
}
