import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/signup_screen.dart';
  
// Temporary dashboard
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('kandaq')),
      body: const Center(child: Text('Dashboard')),
    );
  }
}

// 🔑 Helper: Converts Stream to Listenable for go_router
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners(); // Trigger initial check
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(), // Trigger on auth change
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

// Global auth instance
final _auth = FirebaseAuth.instance;

final appRouter = GoRouter(
  initialLocation: '/login',
  
  // ✅ This is the critical fix: wrap stream in ChangeNotifier
  refreshListenable: GoRouterRefreshStream(_auth.authStateChanges()),
  
  redirect: (context, state) {
  final user = _auth.currentUser;
  final path = state.uri.path;
  final isAuthRoute = path == '/login' || path == '/signup';

  if (user == null) {
    // Not logged in → only allow auth routes
    if (isAuthRoute) return null; // Already on auth page → stay
    return '/login'; // Not on auth page → redirect to login
  } else {
    // Logged in → block auth routes
    if (!isAuthRoute) return null; // Already on protected page → stay
    return '/dashboard'; // On auth page → redirect to dashboard
  }
},

  routes: [
    GoRoute(
      path: '/login',
      builder: (_, __) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (_, __) => const SignupScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (_, __) => const DashboardScreen(),
    ),
  ],
);