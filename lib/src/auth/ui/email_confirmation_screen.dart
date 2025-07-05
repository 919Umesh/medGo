import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/src/auth/bloc/auth_bloc.dart';

class EmailConfirmationScreen extends StatelessWidget {
  final String email;

  const EmailConfirmationScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirm Your Email')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.email_outlined, size: 100, color: Colors.blue),
            const SizedBox(height: 24),
            Text(
              'Check your email',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text(
              'We sent a confirmation link to:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              email,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Click the link in the email to confirm your account.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read<AuthBloc>()
                      .add(ResendConfirmation(email: email));
                },
                child: const Text('Resend Confirmation Email'),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back to Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
