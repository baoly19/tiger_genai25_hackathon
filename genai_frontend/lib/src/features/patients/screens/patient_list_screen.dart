import 'package:flutter/material.dart';
import '../../../shared/models/patient.dart';
import '../../../shared/repositories/patient_repository.dart';
import 'patient_screen.dart';

class PatientListScreen extends StatefulWidget {
  const PatientListScreen({Key? key}) : super(key: key);

  @override
  _PatientListScreenState createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  final PatientRepository _repository = PatientRepository();
  List<Patient> patients = [];
  List<Patient> filteredPatients = [];
  bool isLoading = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadPatients();
    _searchController.addListener(_filterPatients);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadPatients() async {
    setState(() => isLoading = true);

    try {
      final patientList = await _repository.getAllPatients();
      setState(() {
        patients = patientList;
        filteredPatients = patientList;
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error loading patients: $e')));
    } finally {
      setState(() => isLoading = false);
    }
  }

  void _filterPatients() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredPatients = patients.where((patient) {
        return patient.name.toLowerCase().contains(query) ||
            patient.phone.toLowerCase().contains(query) ||
            patient.homeAddress.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Patients'),
      //   backgroundColor: Colors.blue[700],
      //   foregroundColor: Colors.white,
      //   elevation: 0,
      //   actions: [
      //     IconButton(icon: const Icon(Icons.refresh), onPressed: _loadPatients),
      //   ],
      // ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5), // Light gray background
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search Patient ..',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
                onChanged: (value) => _filterPatients(),
              ),
            ),
          ),

          // Patient List
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : filteredPatients.isEmpty
                ? _buildEmptyState()
                : RefreshIndicator(
                    onRefresh: _loadPatients,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: filteredPatients.length,
                      itemBuilder: (context, index) {
                        final patient = filteredPatients[index];
                        return _buildPatientCard(patient);
                      },
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addNewPatient,
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Add Patient'),
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientCard(Patient patient) {
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
          children: [
            // Profile Picture Column
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey.shade300,
                    child: Text(
                      patient.name.isNotEmpty
                          ? patient.name[0].toUpperCase()
                          : '?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          patient.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          patient.phone,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Address Column
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    patient.homeAddress,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),

            // Status Column
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'STATUS',
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
                      color: _getStatusColor(patient).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _getPatientStatus(patient),
                      style: TextStyle(
                        fontSize: 12,
                        color: _getStatusColor(patient),
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
                    'CREATED',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatDate(patient.createdAt),
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
            ),

            // Actions Column
            SizedBox(
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => _editPatient(patient),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      minimumSize: Size.zero,
                    ),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    onPressed: () => _viewPatientDetails(patient),
                    icon: const Icon(Icons.arrow_forward_ios),
                    iconSize: 16,
                    padding: const EdgeInsets.all(4),
                    constraints: const BoxConstraints(
                      minWidth: 24,
                      minHeight: 24,
                    ),
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to get patient status (you can customize this logic)
  String _getPatientStatus(Patient patient) {
    // Example logic - you can modify based on your requirements
    final daysSinceUpdate = DateTime.now().difference(patient.updatedAt).inDays;
    if (daysSinceUpdate <= 7) {
      return 'ACTIVE';
    } else {
      return 'INACTIVE';
    }
  }

  // Helper method to get status color
  Color _getStatusColor(Patient patient) {
    final status = _getPatientStatus(patient);
    switch (status) {
      case 'ACTIVE':
        return Colors.green;
      case 'INACTIVE':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  // Update the _formatDate method to match the format in the image
  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString().substring(2)}';
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people_outline, size: 80, color: Colors.white),
          const SizedBox(height: 16),
          Text(
            _searchController.text.isEmpty
                ? 'No patients found'
                : 'No patients match your search',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _searchController.text.isEmpty
                ? 'Add your first patient to get started'
                : 'Try a different search term',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
          const SizedBox(height: 24),
          if (_searchController.text.isEmpty)
            ElevatedButton.icon(
              onPressed: _addNewPatient,
              icon: const Icon(Icons.add),
              label: const Text('Add Patient'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }

  int _getActiveTodayCount() {
    final today = DateTime.now();
    return patients.where((patient) {
      return patient.updatedAt.day == today.day &&
          patient.updatedAt.month == today.month &&
          patient.updatedAt.year == today.year;
    }).length;
  }

  // String _formatDate(DateTime date) {
  //   return '${date.day}/${date.month}/${date.year}';
  // }

  void _viewPatientDetails(Patient patient) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PatientScreen(patientId: patient.id),
      ),
    ).then((_) => _loadPatients());
  }

  void _editPatient(Patient patient) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditPatientScreen(patient: patient),
      ),
    ).then((_) => _loadPatients());
  }

  void _addNewPatient() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddEditPatientScreen()),
    ).then((_) => _loadPatients());
  }
}

// Add/Edit Patient Screen
class AddEditPatientScreen extends StatefulWidget {
  final Patient? patient;

  const AddEditPatientScreen({Key? key, this.patient}) : super(key: key);

  @override
  _AddEditPatientScreenState createState() => _AddEditPatientScreenState();
}

class _AddEditPatientScreenState extends State<AddEditPatientScreen> {
  final _formKey = GlobalKey<FormState>();
  final _repository = PatientRepository();

  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _emailController;
  late TextEditingController _emergencyContactController;

  bool _isLoading = false;
  bool get _isEditing => widget.patient != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.patient?.name ?? '');
    _phoneController = TextEditingController(text: widget.patient?.phone ?? '');
    _addressController = TextEditingController(
      text: widget.patient?.homeAddress ?? '',
    );
    _emailController = TextEditingController();
    _emergencyContactController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _emergencyContactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Patient' : 'Add New Patient'),
        // backgroundColor: Colors.blue[700],
        // foregroundColor: Colors.white,
        actions: [
          if (_isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ),
            )
          // else
          //   IconButton(icon: const Icon(Icons.save), onPressed: _savePatient),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Card(
            color: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Personal Information Section
                  _buildSectionHeader('Personal Information', Icons.person),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Full Name *',
                      labelStyle: TextStyle(color: Colors.grey.shade700),
                      prefixIcon: Icon(Icons.person, color: Colors.grey.shade700),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade600,
                          width: 2.0,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter the patient\'s name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number *',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade600,
                          width: 2.0,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: TextStyle(color: Colors.grey.shade700),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.grey.shade700,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade600,
                          width: 2.0,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        if (!value.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  // Address Information Section
                  _buildSectionHeader('Address Information', Icons.location_on),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      labelText: 'Home Address *',
                      labelStyle: TextStyle(color: Colors.grey.shade700),
                      prefixIcon: Icon(Icons.home, color: Colors.grey.shade700),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade600,
                          width: 2.0,
                        ),
                      ),
                    ),
                    maxLines: 3,
                    style: const TextStyle(
                      color: Colors.black,
                    ), // keep text color default
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter the patient\'s address';
                      }
                      return null;
                    },
                  ),


                  const SizedBox(height: 24),

                  // Emergency Contact Section
                  _buildSectionHeader('Emergency Contact', Icons.emergency),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _emergencyContactController,
                    decoration: InputDecoration(
                      labelText: 'Emergency Contact Number',
                      labelStyle: TextStyle(color: Colors.grey.shade700),
                      prefixIcon: Icon(Icons.emergency, color: Colors.grey.shade700),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade600,
                          width: 2.0,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 32),

                  // Save Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _savePatient,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: _isLoading
                          ? const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text('Saving...'),
                              ],
                            )
                          : Text(
                              _isEditing ? 'Update Patient' : 'Add Patient',
                              style: const TextStyle(fontSize: 16),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon,  size: 24),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue[700],
          ),
        ),
      ],
    );
  }

  Future<void> _savePatient() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      if (_isEditing) {
        // Update existing patient
        final updatedPatient = widget.patient!.copyWith(
          name: _nameController.text.trim(),
          phone: _phoneController.text.trim(),
          homeAddress: _addressController.text.trim(),
          updatedAt: DateTime.now(),
        );
        await _repository.updatePatient(updatedPatient);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Patient updated successfully')),
        );
      } else {
        // Add new patient
        final newPatient = Patient(
          id: -1,
          name: _nameController.text.trim(),
          phone: _phoneController.text.trim(),
          homeAddress: _addressController.text.trim(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await _repository.createPatient(newPatient);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Patient added successfully')),
        );
      }

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error saving patient: $e')));
    } finally {
      setState(() => _isLoading = false);
    }
  }
}
