// repositories/patient_repository.dart
import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/patient.dart';
import '../models/medical_history.dart';
import '../models/ai_report.dart';
import '../models/patient_with_details.dart';

import 'dart:developer' as developer;


class PatientRepository {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Singleton pattern
  static final PatientRepository _instance = PatientRepository._internal();
  factory PatientRepository() => _instance;
  PatientRepository._internal();

  // Table names
  static const String _patientsTable = 'patients';
  static const String _medicalHistoryTable = 'medical_history';
  static const String _aiReportsTable = 'ai_reports';

  // PATIENT CRUD OPERATIONS

  Future<String> createPatient(Patient patient) async {
    try {
      final response = await _supabase
          .from(_patientsTable)
          .insert(patient.toMap())
          .select('id')
          .single();

      return response['id'].toString();
    } catch (e) {
      throw Exception('Failed to create patient: $e');
    }
  }

  Future<Patient?> getPatient(int id) async {
    try {
      final response = await _supabase
          .from(_patientsTable)
          .select()
          .eq('id', id)
          .maybeSingle();

      if (response != null) {
        return Patient.fromMap(response);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get patient: $e');
    }
  }

  Future<List<Patient>> getAllPatients() async {
    try {
      final response = await _supabase
          .from(_patientsTable)
          .select()
          .order('name', ascending: true);

      return response.map((map) => Patient.fromMap(map)).toList();
    } catch (e) {
      throw Exception('Failed to get all patients: $e');
    }
  }

  Future<List<Patient>> searchPatients(String query) async {
    try {
      final response = await _supabase
          .from(_patientsTable)
          .select()
          .or('name.ilike.%$query%,phone.ilike.%$query%')
          .order('name', ascending: true);

      return response.map((map) => Patient.fromMap(map)).toList();
    } catch (e) {
      throw Exception('Failed to search patients: $e');
    }
  }

  Future<void> updatePatient(Patient patient) async {
    try {
      await _supabase
          .from(_patientsTable)
          .update(patient.toMap())
          .eq('id', patient.id);
    } catch (e) {
      throw Exception('Failed to update patient: $e');
    }
  }

  Future<void> deletePatient(int id) async {
    try {
      await _supabase.from(_patientsTable).delete().eq('id', id);
    } catch (e) {
      throw Exception('Failed to delete patient: $e');
    }
  }

  // MEDICAL HISTORY CRUD OPERATIONS

  Future<String> createMedicalHistory(MedicalHistory history) async {
    try {
      final response = await _supabase
          .from(_medicalHistoryTable)
          .insert(history.toMap())
          .select('id')
          .single();

      return response['id'] as String;
    } catch (e) {
      throw Exception('Failed to create medical history: $e');
    }
  }

  Future<MedicalHistory?> getMedicalHistory(int id) async {
    try {
      final response = await _supabase
          .from(_medicalHistoryTable)
          .select()
          .eq('id', id)
          .maybeSingle();

      if (response != null) {
        return MedicalHistory.fromMap(response);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get medical history: $e');
    }
  }

  Future<List<MedicalHistory>> getPatientMedicalHistory(
    int patientId,
  ) async {
    try {
      final response = await _supabase
          .from(_medicalHistoryTable)
          .select()
          .eq('patient_id', patientId)
          .order('updated_at', ascending: false);
      return response.map((map) => MedicalHistory.fromMap(map)).toList();
    } catch (e) {
      throw Exception('Failed to get patient medical history: $e');
    }
  }

  Future<void> updateMedicalHistory(MedicalHistory history) async {
    try {
      await _supabase
          .from(_medicalHistoryTable)
          .update(history.toMap())
          .eq('id', history.id!);
    } catch (e) {
      throw Exception('Failed to update medical history: $e');
    }
  }

  Future<void> deleteMedicalHistory(int id) async {
    try {
      await _supabase.from(_medicalHistoryTable).delete().eq('id', id);
    } catch (e) {
      throw Exception('Failed to delete medical history: $e');
    }
  }

  // AI REPORT CRUD OPERATIONS

  Future<String> createAIReport(AIReport report) async {
    try {
      final response = await _supabase
          .from(_aiReportsTable)
          .insert(report.toMap())
          .select('id')
          .single();

      return response['id'] as String;
    } catch (e) {
      throw Exception('Failed to create AI report: $e');
    }
  }

  Future<AIReport?> getAIReport(int id) async {
    try {
      final response = await _supabase
          .from(_aiReportsTable)
          .select()
          .eq('id', id)
          .maybeSingle();

      if (response != null) {
        return AIReport.fromMap(response);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get AI report: $e');
    }
  }

  Future<List<AIReport>> getPatientAIReports(
    int medicalHistoryId, {
    int limit = 10,
  }) async {
    try {
      final response = await _supabase
          .from(_aiReportsTable)
          .select()
          .eq('medical_history_id', medicalHistoryId)
          .order('created_at', ascending: false)
          .limit(limit);

      return response.map((map) => AIReport.fromMap(map)).toList();
    } catch (e) {
      throw Exception('Failed to get patient reports: $e');
    }
  }

  Future<List<AIReport>> getPatientReports(
    int patientId, {
    int limit = 10,
  }) async {
    try {
      final response = await _supabase
          .from(_aiReportsTable)
          .select()
          .eq('patient_id', patientId)
          .order('created_at', ascending: false)
          .limit(limit);

      return response.map((map) => AIReport.fromMap(map)).toList();
    } catch (e) {
      throw Exception('Failed to get patient reports: $e');
    }
  }

  Future<List<AIReport>> getRecentReports({int limit = 20}) async {
    try {
      final response = await _supabase
          .from(_aiReportsTable)
          .select()
          .order('created_at', ascending: false)
          .limit(limit);

      return response.map((map) => AIReport.fromMap(map)).toList();
    } catch (e) {
      throw Exception('Failed to get recent reports: $e');
    }
  }

  Future<void> updateAIReport(AIReport report) async {
    try {
      await _supabase
          .from(_aiReportsTable)
          .update(report.toMap())
          .eq('id', report.id);
    } catch (e) {
      throw Exception('Failed to update AI report: $e');
    }
  }

  Future<void> deleteAIReport(int id) async {
    try {
      await _supabase.from(_aiReportsTable).delete().eq('id', id);
    } catch (e) {
      throw Exception('Failed to delete AI report: $e');
    }
  }

  // COMBINED OPERATIONS

  Future<PatientWithDetails?> getPatientWithDetails(int patientId) async {
    try {
      final patient = await getPatient(patientId);
      if (patient == null) return null;

      final medicalHistory = await getPatientMedicalHistory(patient.id);
      // final recentReports = await getPatientReports(patient.id, limit: 5);
      return PatientWithDetails(
        patient: patient,
        medicalHistory: medicalHistory,
        // recentReports: recentReports,
      );
    } catch (e) {
      throw Exception('Failed to get patient with details: $e');
    }
  }

  // Future<Map<String, dynamic>> getPatientStatistics(String patientId) async {
  //   try {
  //     // Get medical history count
  //     final historyCountResponse = await _supabase
  //         .from(_medicalHistoryTable)
  //         .select('id', const FetchOptions(count: CountOption.exact))
  //         .eq('patient_id', patientId);

  //     // Get reports count
  //     final reportsCountResponse = await _supabase
  //         .from(_aiReportsTable)
  //         .select('id', const FetchOptions(count: CountOption.exact))
  //         .eq('patient_id', patientId);

  //     // Get last report date
  //     final lastReportResponse = await _supabase
  //         .from(_aiReportsTable)
  //         .select('created_at')
  //         .eq('patient_id', patientId)
  //         .order('created_at', ascending: false)
  //         .limit(1)
  //         .maybeSingle();

  //     return {
  //       'medical_history_count': historyCountResponse.count ?? 0,
  //       'reports_count': reportsCountResponse.count ?? 0,
  //       'last_report_date': lastReportResponse?['created_at'],
  //     };
  //   } catch (e) {
  //     throw Exception('Failed to get patient statistics: $e');
  //   }
  // }

  // UTILITY METHODS

  // Real-time subscriptions
  Stream<List<Patient>> subscribeToPatients() {
    return _supabase
        .from(_patientsTable)
        .stream(primaryKey: ['id'])
        .order('name', ascending: true)
        .map((data) => data.map((map) => Patient.fromMap(map)).toList());
  }

  Stream<List<MedicalHistory>> subscribeToPatientMedicalHistory(
    int patientId,
  ) {
    return _supabase
        .from(_medicalHistoryTable)
        .stream(primaryKey: ['id'])
        .eq('patient_id', patientId)
        .order('diagnosis_date', ascending: false)
        .map((data) => data.map((map) => MedicalHistory.fromMap(map)).toList());
  }

  Stream<List<AIReport>> subscribeToPatientReports(int patientId) {
    return _supabase
        .from(_aiReportsTable)
        .stream(primaryKey: ['id'])
        .eq('patient_id', patientId)
        .order('created_at', ascending: false)
        .map((data) => data.map((map) => AIReport.fromMap(map)).toList());
  }

  // Backup and restore methods
  Future<Map<String, dynamic>> exportPatientData(int patientId) async {
    try {
      final patientDetails = await getPatientWithDetails(patientId);
      if (patientDetails == null) return {};

      return patientDetails.toMap();
    } catch (e) {
      throw Exception('Failed to export patient data: $e');
    }
  }

  Future<void> importPatientData(Map<String, dynamic> data) async {
    try {
      final patientDetails = PatientWithDetails.fromMap(data);

      // Insert patient
      await createPatient(patientDetails.patient);

      // Insert medical history
      for (final history in patientDetails.medicalHistory) {
        await createMedicalHistory(history);
      }
    } catch (e) {
      throw Exception('Failed to import patient data: $e');
    }
  }

  // Batch operations for better performance
  Future<void> createMultiplePatients(List<Patient> patients) async {
    try {
      final patientMaps = patients.map((p) => p.toMap()).toList();
      await _supabase.from(_patientsTable).insert(patientMaps);
    } catch (e) {
      throw Exception('Failed to create multiple patients: $e');
    }
  }

  Future<void> createMultipleMedicalHistories(
    List<MedicalHistory> histories,
  ) async {
    try {
      final historyMaps = histories.map((h) => h.toMap()).toList();
      await _supabase.from(_medicalHistoryTable).insert(historyMaps);
    } catch (e) {
      throw Exception('Failed to create multiple medical histories: $e');
    }
  }

  Future<void> createMultipleReports(List<AIReport> reports) async {
    try {
      final reportMaps = reports.map((r) => r.toMap()).toList();
      await _supabase.from(_aiReportsTable).insert(reportMaps);
    } catch (e) {
      throw Exception('Failed to create multiple reports: $e');
    }
  }

  // Advanced search and filtering
  Future<List<Patient>> searchPatientsAdvanced({
    String? nameQuery,
    String? phoneQuery,
    String? addressQuery,
    DateTime? createdAfter,
    DateTime? createdBefore,
    int limit = 50,
  }) async {
    try {
      var query = _supabase.from(_patientsTable).select();

      if (nameQuery != null && nameQuery.isNotEmpty) {
        query = query.ilike('name', '%$nameQuery%');
      }

      if (phoneQuery != null && phoneQuery.isNotEmpty) {
        query = query.ilike('phone', '%$phoneQuery%');
      }

      if (addressQuery != null && addressQuery.isNotEmpty) {
        query = query.ilike('home_address', '%$addressQuery%');
      }

      if (createdAfter != null) {
        query = query.gte('created_at', createdAfter.toIso8601String());
      }

      if (createdBefore != null) {
        query = query.lte('created_at', createdBefore.toIso8601String());
      }

      final response = await query.order('name', ascending: true).limit(limit);

      return response.map((map) => Patient.fromMap(map)).toList();
    } catch (e) {
      throw Exception('Failed to search patients: $e');
    }
  }

  Future<List<AIReport>> getReportsByType(
    String reportType, {
    int limit = 20,
  }) async {
    try {
      final response = await _supabase
          .from(_aiReportsTable)
          .select()
          .eq('report_type', reportType)
          .order('created_at', ascending: false)
          .limit(limit);

      return response.map((map) => AIReport.fromMap(map)).toList();
    } catch (e) {
      throw Exception('Failed to get reports by type: $e');
    }
  }

  // Health check
  Future<bool> isConnected() async {
    try {
      await _supabase.from(_patientsTable).select('id').limit(1);
      return true;
    } catch (e) {
      return false;
    }
  }
}
