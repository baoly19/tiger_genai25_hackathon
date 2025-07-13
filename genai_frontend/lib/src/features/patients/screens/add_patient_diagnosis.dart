import 'dart:io';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:file_picker/file_picker.dart';
import '../../../shared/repositories/patient_repository.dart';
import '../../../shared/models/medical_history.dart';
import '../../../shared/models/ai_report.dart';
import '../screens/ai_report_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:typed_data';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';



import 'package:url_launcher/url_launcher.dart';



class AddMedicalHistoryScreen extends StatefulWidget {
  final int patientId;
  final MedicalHistory? history;

  const AddMedicalHistoryScreen({
    Key? key,
    required this.patientId,
    this.history,
  }) : super(key: key);

  @override
  State<AddMedicalHistoryScreen> createState() =>
      _AddMedicalHistoryScreenState();
}

class _AddMedicalHistoryScreenState extends State<AddMedicalHistoryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _repo = PatientRepository();

  final _diagnosisController = TextEditingController();
  final _dateController = TextEditingController();
  final _notesController = TextEditingController();
  final _conclusionController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _bloodPressureController = TextEditingController();
  final _heartRateController = TextEditingController();
  final _temperatureController = TextEditingController();

  File? _selectedFile;
  String? _uploadedFileUrl;
  bool _isLoading = false;
  int? _createdHistoryId;
  List<AIReport> _aiReports = [];

  Uint8List? _webFileBytes;
  String? fileName;

  @override
  void initState() {
    super.initState();
    if (widget.history != null) {
      final history = widget.history!;
      _diagnosisController.text = history.diagnosis ?? '';
      _notesController.text = history.notes ?? '';
      _conclusionController.text = history.conclusion ?? '';
      _heightController.text = history.height?.toString() ?? '';
      _weightController.text = history.weight?.toString() ?? '';
      _bloodPressureController.text = history.bloodPressure?.toString() ?? '';
      _temperatureController.text = history.temperature?.toString() ?? '';
      _heartRateController.text = history.heartRate?.toString() ?? '';
      _uploadedFileUrl = history.fileUrl;
      _createdHistoryId = history.id;
      // Extract file name from URL
      if (_uploadedFileUrl != null && _uploadedFileUrl!.isNotEmpty) {
        fileName = Uri.decodeFull(_uploadedFileUrl!.split('/').last);
      }
      _loadAIReports();
    }
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      final pickedFile = result.files.first;
      fileName = pickedFile.name;
      if (kIsWeb) {
        // Web: use bytes
        _webFileBytes = pickedFile.bytes;
      } else {
        // Mobile/Desktop: use path
        final path = pickedFile.path;
        if (path != null) {
          _selectedFile = File(path);
        }
      }

      setState(() {}); // Trigger UI update
    }
  }

  Future<void> _uploadFile() async {
    if (fileName == null) return;
    print("Running upload file");
    final supabase = Supabase.instance.client;

    try {
      if (kIsWeb) {
        if (_webFileBytes == null) {
          print("null file");
          return; 
        } 

        await supabase.storage
            .from('medical-history-files')
            .uploadBinary(fileName!, _webFileBytes!);
        print("Complete upload binary");
      } else {
        if (_selectedFile == null) return;

        await supabase.storage
            .from('medical-history-files')
            .upload(fileName!, _selectedFile!);
      }
      final url = supabase.storage
          .from('medical-history-files')
          .getPublicUrl(fileName!);
      _uploadedFileUrl = url;
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('File upload failed: $e')));
    }
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    try {
      print("Is web file bytes null?");
      print(_webFileBytes == null);
      if (_webFileBytes != null) {
        print("Run upload file");
        await _uploadFile();
      }

      final history = MedicalHistory(
        id: widget.history?.id,
        patientId: widget.patientId,
        diagnosis: _diagnosisController.text,
        notes: _notesController.text,
        conclusion: _conclusionController.text,
        height: double.tryParse(_heightController.text),
        weight: double.tryParse(_weightController.text),
        bloodPressure: double.tryParse(_bloodPressureController.text),
        temperature: double.tryParse(_temperatureController.text),
        heartRate: double.tryParse(_heartRateController.text),
        fileUrl: _uploadedFileUrl,
        severity: widget.history?.severity ?? "mild",
        // diagnosisDate:
        //     DateTime.tryParse(_dateController.text) ?? DateTime.now(),
        createdAt: widget.history?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
        condition: '',
        description: '',
        medications: [],
      );

      if (widget.history == null) {
        final createdId = await _repo.createMedicalHistory(history);
        setState(() => _createdHistoryId = int.tryParse(createdId));
        await _loadAIReports();
      } else {
        await _repo.updateMedicalHistory(history);
        await _loadAIReports();
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Saved successfully')));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _loadAIReports() async {
    if (_createdHistoryId == null) return;
    try {
      final reports = await _repo.getPatientAIReports(_createdHistoryId!);
      setState(() => _aiReports = reports);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to load AI reports: $e')));
    }
  }

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (picked != null) {
      _dateController.text = picked.toIso8601String().split('T').first;
    }
  }

  Widget _buildShortInputRow(List<Widget> children) {
    return Row(
      children: children
          .map(
            (child) => Expanded(
              child: Padding(padding: const EdgeInsets.all(8), child: child),
            ),
          )
          .toList(),
    );
  }

  Future<void> _diagnoseWithAI() async {
    setState(() => _isLoading = true);

    try {
      final medicalHistoryMap = {
        'diagnosis': _diagnosisController.text,
        'notes': _notesController.text,
        'height': double.tryParse(_heightController.text),
        'weight': double.tryParse(_weightController.text),
        'bloodPressure': double.tryParse(_bloodPressureController.text),
        'temperature': double.tryParse(_temperatureController.text),
        'heartRate': double.tryParse(_heartRateController.text),
        'fileUrl': _uploadedFileUrl,
        'severity': widget.history?.severity ?? "mild",
        'condition': '',
        'description': '',
        'medications': [],
      };
      final pData = jsonEncode(medicalHistoryMap);

      File? fileToSend;
      String? fileType;

      if (_selectedFile != null) {
        fileToSend = _selectedFile;
      } else if (_webFileBytes != null && fileName != null) {
        final tempDir = Directory.systemTemp;
        final tempFile = File(path.join(tempDir.path, fileName!));
        await tempFile.writeAsBytes(_webFileBytes!);
        fileToSend = tempFile;
      } else if (_uploadedFileUrl != null && fileName != null) {
        final tempDir = Directory.systemTemp;
        final tempFile = File(path.join(tempDir.path, fileName!));
        if (!await tempFile.exists()) {
          final supabase = Supabase.instance.client;
          final bytes = await supabase.storage
              .from('medical-history-files')
              .download(fileName!);
          if (bytes != null) {
            await tempFile.writeAsBytes(bytes);
          } else {
            throw Exception('Failed to download file from storage');
          }
        }
        fileToSend = tempFile;
      } else {
        // No file available
        fileToSend = null;
      }

      // Determine file type
      if (fileName != null && fileToSend != null) {
        final ext = path.extension(fileName!).toLowerCase();
        if (['.png', '.jpg', '.jpeg', '.gif', '.bmp'].contains(ext)) {
          fileType = 'image';
        } else if (ext == '.pdf') {
          fileType = 'pdf';
        } else {
          fileType = 'unknown';
        }
      } else {
        fileType = null; // No file type when no file
      }

      final uri = Uri.parse('http://localhost:8000/submit');
      final request = http.MultipartRequest('POST', uri);

      if (fileToSend != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'f_data',
            fileToSend.path,
            filename: path.basename(fileToSend.path),
            contentType: fileType == 'image'
                ? MediaType('image', 'jpeg')
                : fileType == 'pdf'
                ? MediaType('application', 'pdf')
                : null,
          ),
        );
      } else {
        // No file - send empty or null field? Usually omit or send empty string:
        request.fields['f_data'] = '';
      }

      // Always send medical history JSON string
      request.fields['p_data'] = pData;

      // Send file type if exists, else empty string
      request.fields['f_type'] = fileType ?? '';

      final response = await request.send();

      if (response.statusCode == 200) {
        final respStr = await response.stream.bytesToString();
        print('AI Diagnose Response: $respStr');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Diagnosis sent successfully')),
        );
      } else {
        final respStr = await response.stream.bytesToString();
        print('Error response: $respStr');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Diagnosis failed: ${response.statusCode}')),
        );
      }
    } catch (e) {
      print('Error during AI diagnosis: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      setState(() => _isLoading = false);
    }
  }



  @override
  void dispose() {
    _diagnosisController.dispose();
    _dateController.dispose();
    _notesController.dispose();
    _conclusionController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _bloodPressureController.dispose();
    _heartRateController.dispose();
    _temperatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.history == null
              ? 'Add Medical History'
              : 'Edit Medical History',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Form(
                key: _formKey,
                child: ListView(
                  children: [
                    const SizedBox(height: 16),
                    const Text(
                      'Symptoms',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(height: 24),
                    TextFormField(
                      controller: _diagnosisController,
                      decoration: const InputDecoration(
                        labelText: 'Diagnosis',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter a diagnosis'
                          : null,
                      maxLines: 5,
                    ),                    
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _notesController,
                      decoration: const InputDecoration(
                        labelText: 'Notes',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Vitals',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(height: 24),
                    _buildShortInputRow([
                      TextFormField(
                        controller: _heightController,
                        decoration: const InputDecoration(
                          labelText: 'Height (cm)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: _weightController,
                        decoration: const InputDecoration(
                          labelText: 'Weight (kg)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ]),
                    _buildShortInputRow([
                      TextFormField(
                        controller: _bloodPressureController,
                        decoration: const InputDecoration(
                          labelText: 'Blood Pressure',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        controller: _heartRateController,
                        decoration: const InputDecoration(
                          labelText: 'Heart Rate (bpm)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ]),
                    _buildShortInputRow([
                      TextFormField(
                        controller: _temperatureController,
                        decoration: const InputDecoration(
                          labelText: 'Temperature (°C)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ]),
                    const SizedBox(height: 32),
                    const Text(
                      'Conclusion / Summary',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(height: 24),
                    TextFormField(
                      controller: _conclusionController,
                      decoration: const InputDecoration(
                        labelText: 'Conclusion',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Lab Test',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: _pickFile,
                          icon: const Icon(Icons.attach_file),
                          label: const Text('Upload Lab Test Results'),
                        ),
                      ],
                    ),
                    const Divider(height: 24),

                    if (fileName != null)
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: const Icon(
                            Icons.insert_drive_file,
                            color: Colors.blue,
                          ),
                          title: Text(
                            fileName!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 14),
                          ),
                          trailing: Wrap(
                            spacing: 8,
                            children: [
                              if (_uploadedFileUrl != null)
                                IconButton(
                                  icon: const Icon(Icons.download),
                                  tooltip: 'Download file',
                                  onPressed: () async {
                                    final supabase = Supabase.instance.client;

                                    try {
                                      final signedUrl = await supabase.storage
                                          .from('medical-history-files')
                                          .createSignedUrl(
                                            fileName!,
                                            60,
                                          ); // 60 seconds expiry

                                      if (signedUrl != null) {
                                        final uri = Uri.parse(signedUrl);
                                        if (!await launchUrl(
                                          uri,
                                          mode: LaunchMode.externalApplication,
                                        )) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Could not launch download link',
                                              ),
                                            ),
                                          );
                                        }
                                      } else {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Failed to get signed URL',
                                            ),
                                          ),
                                        );
                                      }
                                    } catch (e) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Error generating signed URL: $e',
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                tooltip: 'Remove file',
                                onPressed: () async {
                                  if (fileName != null) {
                                    try {
                                      final supabase = Supabase.instance.client;
                                      await supabase.storage
                                          .from('medical-history-files')
                                          .remove([fileName!]);

                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'File deleted from storage',
                                          ),
                                        ),
                                      );
                                    } catch (e) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Error deleting file: $e',
                                          ),
                                        ),
                                      );
                                      return;
                                    }
                                  }

                                  setState(() {
                                    _selectedFile = null;
                                    _webFileBytes = null;
                                    _uploadedFileUrl = null;
                                    fileName = null;
                                  });
                                  print(
                                    'File removed locally and from storage',
                                  );
                                },
                              ),

                            ],
                          ),
                        ),
                      ),


                    const SizedBox(height: 32),
                    // AI Diagnosis header with Refresh button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'AI Diagnosis',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.refresh),
                          tooltip: 'Refresh AI Reports',
                          onPressed: _isLoading ? null : _loadAIReports,
                        ),
                      ],
                    ),

                    const Divider(height: 24),

                    // List of AI Reports
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _aiReports.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final report = _aiReports[index];
                        return ListTile(
                          title: Text(report.title),
                          subtitle: Text(
                            'Date: ${report.createdAt.toLocal().toString().split("T").first}',
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AiDiagnosisReportScreen(
                                  reportId: report.id,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),

                    const SizedBox(height: 32),

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Colors.blueAccent, Colors.lightBlue],
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ElevatedButton.icon(
                              onPressed: _isLoading ? null : _submitForm,
                              icon: const Icon(Icons.save),
                              label: const Text('Save'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Colors.pinkAccent, Colors.pink],
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ElevatedButton.icon(
                              onPressed: _isLoading
                                  ? null
                                  : () async {
                                      await _diagnoseWithAI();
                                      await _loadAIReports();
                                    },
                              icon: const Icon(Icons.auto_fix_high),
                              label: const Text('Diagnose with AI'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
      ),
    );
  }
}
