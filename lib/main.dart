// lib/main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kandaq/core/theme/app_colors.dart'; // Ensure these paths are correct
import 'package:kandaq/core/theme/app_typography.dart';
import 'package:kandaq/core/router/app_router.dart'; // 🆕 Import your new router
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // ✅ Firebase MUST initialize BEFORE router is used
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const KandaqApp());
}

class KandaqApp extends StatelessWidget {
  const KandaqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router( // ✅ Must be .router, not just MaterialApp
      title: 'kandaq',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE65100)),
        useMaterial3: true,
      ),
      routerConfig: appRouter, // ✅ Pass the router here
      // ❌ REMOVE any `home:` or `onGenerateRoute:` — they conflict
    );
  }
}