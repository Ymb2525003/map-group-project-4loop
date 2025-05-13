import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MaterialApp(home: LoginPage()));
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  String _email = '';
  String _password = '';
  bool _rememberMe = false;
  bool _isLoading = false;

  void _submit(ctx) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        // if (_rememberMe) {
        //   await _auth.setPersistence(Persistence.LOCAL);
        // }
        // else {
        //   await auth.setPersistence(Persistence.NONE);
        // }

        // final userCredential = await _auth.signInWithEmailAndPassword(
        //   email: _email,
        //   password: _password,
        // );

        // print(UserCredential);

        ScaffoldMessenger.of(
          ctx,
        ).showSnackBar(SnackBar(content: Text('Logged in as $_email')));
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(
          ctx,
        ).showSnackBar(SnackBar(content: Text('Login failed: ${e.message}')));
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.lock_outline, size: 80, color: Colors.blue),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator:
                      (value) => value!.isEmpty ? 'Enter your email' : null,
                  onSaved: (value) => _email = value!,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator:
                      (value) => value!.isEmpty ? 'Enter your password' : null,
                  onSaved: (value) => _password = value!,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                    ),
                    const Text('Remember Me'),
                  ],
                ),
                const SizedBox(height: 20),
                _isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                      onPressed: () => _submit(context),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text('Login'),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}