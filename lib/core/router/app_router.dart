import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/signup_screen.dart';
// Fixed: Removed the double slash //
import '../../features/home/screens/home_screen.dart';

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
    notifyListeners(); 
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(), 
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

final _auth = FirebaseAuth.instance;

final appRouter = GoRouter(
  initialLocation: '/login',
  refreshListenable: GoRouterRefreshStream(_auth.authStateChanges()),
  redirect: (context, state) {
    final user = _auth.currentUser;
    final path = state.uri.path;
    final isAuthRoute = path == '/login' || path == '/signup';

    if (user == null) {
      if (isAuthRoute) return null;
      return '/login';
    } else {
      if (!isAuthRoute) return null;
      return '/dashboard';
    }
  },
  routes: [
    GoRoute(
      path: '/login',
      // Fixed: Use single underscores for all unused parameters
      builder: (_, _) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (_, _) => const SignupScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (_, _) => const HomeScreen(),
    ),
  ],
);