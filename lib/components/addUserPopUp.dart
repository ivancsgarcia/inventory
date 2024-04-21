import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/function_button.dart';
import 'package:flutter_application_1/components/textformfield.dart';
import 'package:flutter_application_1/services/firestore.dart';

class AddUserPopUp extends StatefulWidget {
  const AddUserPopUp({super.key});

  @override
  State<AddUserPopUp> createState() => _AddUserPopUpState();
}

class _AddUserPopUpState extends State<AddUserPopUp> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void createAccount() async {
    try {
      if (_passwordController.text == _confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        final newUserID = FirebaseAuth.instance.currentUser!.uid;

        addEmployeeDetails(
          _firstNameController.text,
          _lastNameController.text,
          _emailController.text,
          _phoneNumberController.text,
          newUserID,
        );
      } else {
        showErrorMessage('Passwords do not match');
      }

      // Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      // Navigator.of(context).pop();
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(message),
          ),
        );
      },
    );
  }

  void addUserPopUp() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Add User",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: SizedBox(
              child: Column(
                children: [
                  Form(
                    child: Column(
                      children: [
                        MyTextFormField(
                          controller: _firstNameController,
                          labelText: 'First Name',
                          icondata: Icons.account_circle,
                        ),
                        const SizedBox(height: 10.0),
                        MyTextFormField(
                          controller: _lastNameController,
                          labelText: 'Last Name',
                          icondata: Icons.account_circle,
                        ),
                        const SizedBox(height: 10.0),
                        MyTextFormField(
                            controller: _phoneNumberController,
                            labelText: 'Phone Number',
                            icondata: Icons.email),
                        const SizedBox(height: 10.0),
                        MyTextFormField(
                            controller: _emailController,
                            labelText: 'Email',
                            icondata: Icons.email),
                        const SizedBox(height: 10.0),
                        MyTextFormField(
                            controller: _passwordController,
                            labelText: 'Password',
                            obscureText: true,
                            icondata: Icons.password),
                        const SizedBox(height: 10.0),
                        MyTextFormField(
                            controller: _confirmPasswordController,
                            labelText: 'Confirm Password',
                            obscureText: true,
                            icondata: Icons.password),
                        const SizedBox(height: 30.0),
                        MyButton(
                          onPressed: () {
                            createAccount();

                            // _firstNameController.clear();
                            // _lastNameController.clear();
                            // _phoneNumberController.clear();
                            // _emailController.clear();
                            // _passwordController.clear();
                            // _confirmPasswordController.clear();
                          },
                          text: 'Add User',
                          bgcolor: const Color(0xFF363030),
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: 15.0),
                        MyButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: 'Cancel',
                          bgcolor: Colors.red,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FunctionButton(
      onTap: addUserPopUp,
      text: 'Add User',
      icondata: Icons.add_box,
    );
  }
}
