import 'package:app_ehibah/pages/football_player_page.dart';
import 'package:app_ehibah/widgets/login_screen_widget.dart';
import 'package:flutter/material.dart';

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({super.key});

  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  // Form controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // State variables
  bool _isLoading = false;
  bool _obscurePassword = true;
  String? _errorMessage;

  // Dispose controllers
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Login method
  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 2));

    try {
      // Simulate login logic
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      // Mock validation
      if (email == 'user@example.com' && password == 'password123') {
        // Success - Navigate to home page
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login berhasil!'),
            backgroundColor: Colors.green,
          ),
        );

        // Clear form
        _emailController.clear();
        _passwordController.clear();

        // Navigate to home (example)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FootballPlayerPage()),
        );
      } else {
        setState(() {
          _errorMessage = 'Email atau password salah';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Terjadi kesalahan: $e';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // Toggle password visibility
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginScreenWidgets(
        formKey: _formKey,
        emailController: _emailController,
        passwordController: _passwordController,
        obscurePassword: _obscurePassword,
        isLoading: _isLoading,
        errorMessage: _errorMessage,
        onLoginPressed: _login,
        onTogglePasswordVisibility: _togglePasswordVisibility,
      ),
    );
  }
}
