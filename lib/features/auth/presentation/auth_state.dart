import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../data/auth_repository.dart';

class AuthState {
  final bool isLoading;
  final String? error;
  final User? user;

  const AuthState({this.isLoading = false, this.error, this.user});

  AuthState copyWith({bool? isLoading, String? error, User? user}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }
}

class AuthProvider extends ValueNotifier<AuthState> {
  final AuthRepository _repository;
  StreamSubscription<User?>? _authSubscription;

  AuthProvider({required AuthRepository repository})
      : _repository = repository,
        super(const AuthState()) {
    // Listen to Firebase auth state changes
    _authSubscription = _repository.authStateChanges.listen((user) {
      // When Firebase says user changed, update our state
      value = value.copyWith(isLoading: false, error: null, user: user);
    });
  }

  Future<void> signIn({required String email, required String password}) async {
    value = const AuthState(isLoading: true, error: null);
    try {
      await _repository.signInWithEmailAndPassword(email: email, password: password);
      // Success: authStateChanges stream will update user automatically
    } on FirebaseAuthException catch (e) {
      print('🔥 Auth Error Code: ${e.code}'); // DEBUG: Check Chrome Console
      value = AuthState(isLoading: false, error: _mapFirebaseError(e.code));
    } catch (e) {
      print('🔥 Unexpected Error: $e'); // DEBUG
      value = const AuthState(isLoading: false, error: 'Something went wrong. Please try again.');
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    value = const AuthState(isLoading: true, error: null);
    try {
      await _repository.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print('🔥 Sign Up Error Code: ${e.code}'); // DEBUG
      value = AuthState(isLoading: false, error: _mapFirebaseError(e.code));
    } catch (e) {
      print('🔥 Unexpected Error: $e'); // DEBUG
      value = const AuthState(isLoading: false, error: 'Registration failed. Please try again.');
    }
  }

  Future<void> signOut() async {
    value = value.copyWith(isLoading: true, error: null);
    await _repository.signOut();
    // authStateChanges will set user to null automatically
  }

  @override
  void dispose() {
    _authSubscription?.cancel(); // Prevent memory leaks
    super.dispose();
  }

  // User-friendly error messages
  String _mapFirebaseError(String code) {
    return switch (code) {
      'user-not-found' => 'No account found with this email.',
      'wrong-password' => 'Incorrect password.',
      'email-already-in-use' => 'This email is already registered.',
      'weak-password' => 'Password must be at least 6 characters.',
      'invalid-email' => 'Please enter a valid email address.',
      'network-request-failed' => 'Check your internet connection.',
      _ => 'Authentication failed. Please try again.',
    };
  }
}