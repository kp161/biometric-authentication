import 'package:biometric_login/core/utils/show_snackbar.dart';
import 'package:biometric_login/features/welcome/welcome_page.dart';
import 'package:local_auth/local_auth.dart';
import 'package:biometric_login/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BiometricPage extends StatefulWidget {
  const BiometricPage({super.key});

  @override
  State<BiometricPage> createState() => _BiometricPageState();
}

enum BiometricStatus { idle, success, failed, cancelled }

class _BiometricPageState extends State<BiometricPage> {
  final LocalAuthentication _auth = LocalAuthentication();
  bool _isAuthenticating = false;
  BiometricStatus _biometricStatus = BiometricStatus.idle;

  Future<void> _authenticate() async {
    try {
      setState(() {
        _isAuthenticating = true;
      });

      final bool authenticated = await _auth.authenticate(
        localizedReason: 'Scan your fingerprint to login',
      );

      setState(() {
        _isAuthenticating = false;
        _biometricStatus = authenticated
            ? BiometricStatus.success
            : BiometricStatus.cancelled;
      });

      if (authenticated && mounted) {
        showFlushBar(
          context: context,
          message: 'Login Successful!',
          isError: false,
        );
        await Future.delayed(const Duration(seconds: 2));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomePage()),
        );
      }
    } catch (e) {
      setState(() {
        _isAuthenticating = false;
        _biometricStatus = BiometricStatus.failed;
      });

      if (mounted) {
        showFlushBar(
          context: context,
          message: 'Authentication failed',
          isError: true,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_outline, size: 85, color: AppColors.primaryColor),
              const SizedBox(height: 30),
              Text(
                'Biometric Login',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Login using your fingerprint or face ID',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textColor, fontSize: 14),
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: _isAuthenticating ? null : _authenticate,
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue[200]!, width: 1.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: _isAuthenticating
                      ? const Padding(
                          padding: EdgeInsets.all(28),
                          child: CircularProgressIndicator(strokeWidth: 3),
                        )
                      : Icon(
                          Icons.fingerprint,
                          color: Colors.blue[600],
                          size: 50,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
