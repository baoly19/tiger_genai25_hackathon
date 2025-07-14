// screens/patient_screen.dart
import 'package:flutter/material.dart';
import '../../../shared/models/patient.dart';
import '../../../shared/models/medical_history.dart';
import '../../../shared/models/ai_report.dart';
import '../../../shared/repositories/patient_repository.dart';

import '../../../features/patients/screens/add_patient_diagnosis.dart';

class PatientScreen extends StatefulWidget {
  final int patientId;

  const PatientScreen({Key? key, required this.patientId}) : super(key: key);

  @override
  _PatientScreenState createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  final PatientRepository _repository = PatientRepository();
  Patient? patient;
  List<MedicalHistory> medicalHistory = [];
  List<AIReport> recentReports = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPatientData();
  }

  Future<void> _loadPatientData() async {
    setState(() => isLoading = true);

    try {
      final patientDetails = await _repository.getPatientWithDetails(
        widget.patientId,
      );

      if (patientDetails != null) {
        setState(() {
          patient = patientDetails.patient;
          medicalHistory = patientDetails.medicalHistory;
          // recentReports = patientDetails.recentReports;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error loading patient data: $e')));
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Patient Details')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (patient == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Patient Details')),
        body: const Center(child: Text('Patient not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(patient!.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadPatientData,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadPatientData,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPatientInfoCard(),
              const SizedBox(height: 16),
              _buildMedicalHistorySection(),
              // const SizedBox(height: 16),
              // _buildRecentReportsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPatientInfoCard() {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person, size: 24, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  'Patient Information',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoRow(Icons.person, 'Name', patient!.name),
            _buildInfoRow(Icons.phone, 'Phone', patient!.phone),
            _buildInfoRow(Icons.home, 'Address', patient!.homeAddress),
            _buildInfoRow(
              Icons.calendar_today,
              'Created',
              _formatDate(patient!.createdAt),
            ),
            _buildInfoRow(
              Icons.update,
              'Updated',
              _formatDate(patient!.updatedAt),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 8),
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value, style: TextStyle(color: Colors.grey[800])),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicalHistorySection() {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      // Max height 70% of the screen
      height: screenHeight * 0.6,
      child: Card(
        color: Colors.white,
        elevation: 4,
        margin: const EdgeInsets.all(4),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.medical_services,
                        size: 24,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Medical History',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _addMedicalHistory,
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Scrollable list within fixed-height card
              Expanded(
                child: medicalHistory.isEmpty
                    ? const Center(child: Text('No medical history recorded'))
                    : ListView.separated(
                        itemCount: medicalHistory.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final history = medicalHistory[index];
                          return _buildMedicalHistoryItem(history);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildMedicalHistoryItem(MedicalHistory history) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade200, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Condition + Description Column
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  const SizedBox(height: 4),
                  Text(
                    "Record ${history.id!.toString()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            // Severity Tag Column
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'SEVERITY',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getSeverityColor(
                        history.severity,
                      ).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      history.severity,
                      style: TextStyle(
                        fontSize: 12,
                        color: _getSeverityColor(history.severity),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Date Column
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'UPDATED',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatDate(history.updatedAt),
                    style: const TextStyle(fontSize: 13, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Actions
            SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => _editMedicalHistory(history),
                    icon: const Icon(Icons.edit),
                    iconSize: 24,
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints(
                      minWidth: 40,
                      minHeight: 40,
                    ),
                    color: Colors.blue.shade600,
                    tooltip: 'Edit',
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    onPressed: () => _deleteMedicalHistory(history),
                    icon: const Icon(Icons.delete),
                    iconSize: 24,
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints(
                      minWidth: 40,
                      minHeight: 40,
                    ),
                    color: Colors.red.shade400,
                    tooltip: 'Delete',
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }



  Widget _buildRecentReportsSection() {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.analytics, size: 24, color: Colors.green),
                    const SizedBox(width: 8),
                    Text(
                      'Recent AI Reports',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => _addAIReport(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (recentReports.isEmpty)
              const Text('No reports generated')
            else
              ...recentReports.map((report) => _buildReportItem(report)),
          ],
        ),
      ),
    );
  }

  Widget _buildReportItem(AIReport report) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getReportTypeColor('diagnosis'),
          child: Icon(
            _getReportTypeIcon('diagnosis'),
            color: Colors.white,
          ),
        ),
        title: Text(
          report.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              report.content.length > 100
                  ? '${report.content.substring(0, 100)}...'
                  : report.content,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            // Text(
            //   'Generated: ${_formatDate(report.generatedAt)}',
            //   style: const TextStyle(fontSize: 12),
            // ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () => _showReportOptions(report),
        ),
        onTap: () => _viewReport(report),
      ),
    );
  }

  Color _getSeverityColor(String severity) {
    switch (severity.toLowerCase()) {
      case 'mild':
        return Colors.yellow[700]!;
      case 'moderate':
        return Colors.orange[700]!;
      case 'severe':
        return Colors.red[700]!;
      default:
        return Colors.grey[700]!;
    }
  }

  Color _getReportTypeColor(String reportType) {
    switch (reportType.toLowerCase()) {
      case 'diagnosis':
        return Colors.blue[700]!;
      case 'treatment':
        return Colors.green[700]!;
      case 'summary':
        return Colors.purple[700]!;
      default:
        return Colors.grey[700]!;
    }
  }

  IconData _getReportTypeIcon(String reportType) {
    switch (reportType.toLowerCase()) {
      case 'diagnosis':
        return Icons.medical_services;
      case 'treatment':
        return Icons.healing;
      case 'summary':
        return Icons.summarize;
      default:
        return Icons.description;
    }
  }

  String _formatDate(DateTime? date) {
    if (date != null) {
      return '${date.day}/${date.month}/${date.year}';
    }
    return "N/A";
  }

  void _editPatient() {
    // Navigate to edit patient screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPatientScreen(patient: patient!),
      ),
    ).then((_) => _loadPatientData());
  }

  void _showAddOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.medical_services),
            title: const Text('Add Medical History'),
            onTap: () {
              Navigator.pop(context);
              _addMedicalHistory();
            },
          ),
          ListTile(
            leading: const Icon(Icons.analytics),
            title: const Text('Generate AI Report'),
            onTap: () {
              Navigator.pop(context);
              _addAIReport();
            },
          ),
        ],
      ),
    );
  }

  void _addMedicalHistory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AddMedicalHistoryScreen(patientId: widget.patientId, history: null),
      ),
    ).then((_) => _loadPatientData());
  }

  void _addAIReport() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => AddAIReportScreen(patientId: widget.patientId),
    //   ),
    // ).then((_) => _loadPatientData());
  }

  void _showMedicalHistoryOptions(MedicalHistory history) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit'),
            onTap: () {
              Navigator.pop(context);
              _editMedicalHistory(history);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete'),
            onTap: () {
              Navigator.pop(context);
              _deleteMedicalHistory(history);
            },
          ),
        ],
      ),
    );
  }

  void _showReportOptions(AIReport report) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.visibility),
            title: const Text('View Full Report'),
            onTap: () {
              Navigator.pop(context);
              _viewReport(report);
            },
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            onTap: () {
              Navigator.pop(context);
              _shareReport(report);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete'),
            onTap: () {
              Navigator.pop(context);
              _deleteReport(report);
            },
          ),
        ],
      ),
    );
  }

  void _editMedicalHistory(MedicalHistory history) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddMedicalHistoryScreen(
          patientId: widget.patientId,
          history: history, // pass the existing record
        ),
      ),
    ).then((_) => _loadPatientData());
  }

  void _deleteMedicalHistory(MedicalHistory history) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Medical History'),
        content: Text(
          'Are you sure you want to delete "${history.condition}"?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (result == true) {
      try {
        await _repository.deleteMedicalHistory(history.id!);
        _loadPatientData();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Medical history deleted')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error deleting medical history: $e')),
        );
      }
    }
  }

  void _viewReport(AIReport report) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => ViewReportScreen(report: report)),
    // );
  }

  void _shareReport(AIReport report) {
    // Implement sharing functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Share functionality not implemented')),
    );
  }

  void _deleteReport(AIReport report) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Report'),
        content: Text('Are you sure you want to delete "${report.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (result == true) {
      try {
        await _repository.deleteAIReport(report.id!);
        _loadPatientData();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Report deleted')));
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error deleting report: $e')));
      }
    }
  }
}

// Additional screens that would be needed:

// Edit Patient Screen
class EditPatientScreen extends StatefulWidget {
  final Patient patient;

  const EditPatientScreen({Key? key, required this.patient}) : super(key: key);

  @override
  _EditPatientScreenState createState() => _EditPatientScreenState();
}

class _EditPatientScreenState extends State<EditPatientScreen> {
  final _formKey = GlobalKey<FormState>();
  final _repository = PatientRepository();

  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.patient.name);
    _phoneController = TextEditingController(text: widget.patient.phone);
    _addressController = TextEditingController(
      text: widget.patient.homeAddress,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Patient'),
        actions: [
          IconButton(icon: const Icon(Icons.save), onPressed: _savePatient),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Home Address',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an address';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _savePatient() async {
    if (_formKey.currentState!.validate()) {
      try {
        final updatedPatient = widget.patient.copyWith(
          name: _nameController.text,
          phone: _phoneController.text,
          homeAddress: _addressController.text,
          updatedAt: DateTime.now(),
        );

        await _repository.updatePatient(updatedPatient);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Patient updated successfully')),
        );
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error updating patient: $e')));
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}

// // Placeholder screens (you would implement these similarly)
// class AddMedicalHistoryScreen extends StatelessWidget {
//   final int patientId;

//   const AddMedicalHistoryScreen({Key? key, required this.patientId})
//     : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Add Medical History')),
//       body: const Center(child: Text('Add Medical History Form')),
//     );
//   }
// }

// class AddAIReportScreen extends StatelessWidget {
//   final int patientId;

//   const AddAIReportScreen({Key? key, required this.patientId})
//     : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Generate AI Report')),
//       body: const Center(child: Text('AI Report Generation Form')),
//     );
//   }
// }

// class EditMedicalHistoryScreen extends StatelessWidget {
//   final MedicalHistory history;

//   const EditMedicalHistoryScreen({Key? key, required this.history})
//     : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Edit Medical History')),
//       body: const Center(child: Text('Edit Medical History Form')),
//     );
//   }
// }

// class ViewReportScreen extends StatelessWidget {
//   final AIReport report;

//   const ViewReportScreen({Key? key, required this.report}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(report.title)),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Text(
//             //   'Report Type: ${report.reportType}',
//             //   style: const TextStyle(fontWeight: FontWeight.bold),
//             // ),
//             // const SizedBox(height: 8),
//             // Text(
//             //   'Generated: ${report.generatedAt}',
//             //   style: const TextStyle(color: Colors.grey),
//             // ),
//             const SizedBox(height: 16),
//             Expanded(child: SingleChildScrollView(child: Text(report.content))),
//           ],
//         ),
//       ),
//     );
//   }
// }
