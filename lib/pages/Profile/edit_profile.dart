import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../viewmodels/auth_viewmodel.dart';

class ProfileInfo extends StatefulWidget {
  ProfileInfo({Key? key}) : super(key: key);

  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  late AuthViewModel _authViewModel;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    });
    super.initState();
  }

  File? _image;
  Future<void> getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return;
    }
    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }

  Widget UserName(AuthViewModel authVM) {
    return Text(
      authVM.loggedInUser != null
          ? authVM.loggedInUser!.fullName.toString()
          : "Guest",
      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
    );
  }

  Widget userEmail(AuthViewModel authVM) {
    return Text(
      authVM.loggedInUser != null
          ? authVM.loggedInUser!.email.toString()
          : "Guest",
      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
    );
  }

  