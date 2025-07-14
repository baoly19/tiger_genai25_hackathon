import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../../shared/repositories/patient_repository.dart';
import '../../../shared/models/ai_report.dart';
import 'package:intl/intl.dart'; // Optional, for better date formatting

class AiDiagnosisReportScreen extends StatefulWidget {
  final int reportId;
  const AiDiagnosisReportScreen({Key? key, required this.reportId})
    : super(key: key);

  @override
  State<AiDiagnosisReportScreen> createState() =>
      _AiDiagnosisReportScreenState();
}

class _AiDiagnosisReportScreenState extends State<AiDiagnosisReportScreen> {
  AIReport? _report;
  bool _isLoading = true;
  String? _errorMessage;

  final _repository = PatientRepository();

  @override
  void initState() {
    super.initState();
    _loadReport();
  }

  Future<void> _loadReport() async {
    try {
      final report = await _repository.getAIReport(widget.reportId);
      setState(() {
        _report = report;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error loading report: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('AI Report #${widget.reportId}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _errorMessage != null
            ? Center(
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              )
            : _report == null
            ? const Center(child: Text('Report not found.'))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Text(
                    _report!.title,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  /// Created Date
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 18,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Created on ${DateFormat.yMMMd().format(_report!.createdAt!)}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),

                  const Divider(height: 32),

                  /// Markdown Content
                  const Text(
                    'Report Details',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16),

                  Expanded(
                    child: Markdown(
                      data: _report!.content,
                      styleSheet: MarkdownStyleSheet.fromTheme(theme).copyWith(
                        p: const TextStyle(fontSize: 16),
                        h2: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
