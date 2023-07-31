import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/firebase_service.dart';
import '../../viewmodels/auth_viewmodel.dart';
import '../../viewmodels/global_ui_viewmodel.dart';

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({Key? key}) : super(key: key);

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  late GlobalUIViewModel _ui;
  late AuthViewModel _authViewModel;
  String? userId;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
      _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    });
    super.initState();
  }
  void editEmail() async {
    _ui.loadState(true);
    try {
      _authViewModel.user?.updateEmail(new_emailController.text);
      FirebaseService.db
          .collection("users")
          .where("user_id", isEqualTo: _authViewModel.user?.uid)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.set({
            "email": new_emailController.text,
          }, SetOptions(merge: true));
        });
      }).catchError((error) {
        print("Error updating email : $error");
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Email updated")));
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error")));
    }
    _ui.loadState(false);
  }