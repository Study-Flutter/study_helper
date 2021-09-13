import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              ListTile(
                title: Text('Name: Richard'),
                trailing: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.edit),
                ),
              ),
              ListTile(
                title: Text('Email: richard0311312@gmail.com'),
                trailing: Icon(Icons.edit),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
