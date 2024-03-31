import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/function_button.dart';
import 'package:flutter_application_1/components/textformfield.dart';

class AddUserPopUp extends StatefulWidget {
  const AddUserPopUp({super.key});

  @override
  State<AddUserPopUp> createState() => _AddUserPopUpState();
}

class _AddUserPopUpState extends State<AddUserPopUp> {
  void addUserPopUp() {
    final _firstNameController = TextEditingController();
    final _lastNameController = TextEditingController();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Add User",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.start,
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
                          obscureText: false,
                          icondata: Icons.account_circle,
                        ),
                        SizedBox(height: 10.0),
                        MyTextFormField(
                          controller: _lastNameController,
                          labelText: 'Last Name',
                          obscureText: false,
                          icondata: Icons.account_circle,
                        ),
                        SizedBox(height: 10.0),
                        MyTextFormField(
                            controller: _emailController,
                            labelText: 'Email',
                            obscureText: false,
                            icondata: Icons.email),
                        SizedBox(height: 10.0),
                        MyTextFormField(
                            controller: _passwordController,
                            labelText: 'Password',
                            obscureText: true,
                            icondata: Icons.password),
                        SizedBox(height: 30.0),
                        MyButton(
                          onPressed: () {},
                          text: 'Add User',
                          bgcolor: const Color(0xFF363030),
                          textColor: Colors.white,
                        ),
                        SizedBox(height: 15.0),
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
