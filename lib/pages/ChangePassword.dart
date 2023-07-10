import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final form = GlobalKey<FormState>();
  var _isVisible = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _currentPasswordController = TextEditingController();

  void _submit() async {
    final currentPassword = _currentPasswordController.text;
    final newPassword = _newPasswordController.text;
    final email = emailController.text;

    try {
      final user = await _auth.currentUser!;
      // final credential =
      //     EmailAuthProvider.credential(email: email, password: currentPassword);
      // await user.reauthenticateWithCredential(credential);

      await user.updatePassword(newPassword);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Success")));
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Error")));
    }
  }

              ],
            ),
          ),
        ),
      ),
    );
  }
}
