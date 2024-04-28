import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/addUserPopUp.dart';
import 'package:flutter_application_1/services/firestore.dart';

import '../components/button.dart';
import '../components/textformfield.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
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
        addEmployeeDetails(
          _firstNameController.text,
          _lastNameController.text,
          _emailController.text,
          _phoneNumberController.text,
        );

        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
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

                            _firstNameController.clear();
                            _lastNameController.clear();
                            _phoneNumberController.clear();
                            _emailController.clear();
                            _passwordController.clear();
                            _confirmPasswordController.clear();
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF7A5B2D),
        onPressed: addUserPopUp,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('USER LIST'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/show-bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SearchBar(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFFE6CCA5)),
                    side: MaterialStatePropertyAll(
                        BorderSide(color: Color(0x9F7C5C2D))),
                    leading: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: StreamBuilder(
                    stream: getEmployeeDetails(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        List employeeList = snapshot.data!.docs;

                        return ListView.builder(
                            itemCount: employeeList.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot document = employeeList[index];
                              String docID = document.id;

                              Map<String, dynamic> data =
                                  document.data() as Map<String, dynamic>;
                              String firstName = data['firstName'];
                              String lastName = data['lastName'];
                              // String email = data['email'];
                              // String phoneNumber = data['phoneNumber'];

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: const Color(0xF17C5C2D),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 18),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "$firstName $lastName",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                            // Text(
                                            //   "Email: $email",
                                            //   style: TextStyle(
                                            //     color: Colors.white,
                                            //     fontSize: 16.0,
                                            //   ),
                                            // ),
                                            // Text(
                                            //   "Phone Number: $phoneNumber",
                                            //   style: TextStyle(
                                            //     color: Colors.white,
                                            //     fontSize: 16.0,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                        const Icon(Icons.manage_accounts),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return const Text("No data...");
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
