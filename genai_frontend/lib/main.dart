import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/core/app.dart';
import 'src/core/services/supabase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive for local storage
  await Hive.initFlutter();
  
  try {
    // Initialize Supabase
    await SupabaseService.initialize();
    
    // Run the app
    runApp(
      const ProviderScope(
        child: GenAIHackathonApp(),
      ),
    );
  } catch (e) {
    // Handle initialization errors
    print('Failed to initialize Supabase: $e');
    
    // Run app anyway with error handling
    runApp(
      const ProviderScope(
        child: GenAIHackathonApp(),
      ),
    );
  }
} 