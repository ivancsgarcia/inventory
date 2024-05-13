import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import 'package:flutter_application_1/services/firestore.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({
    super.key,
  });

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _businessTypeController = TextEditingController();
  final _shelfLifeController = TextEditingController();
  final _segregationController = TextEditingController();

  @override
  void dispose() {
    _businessTypeController.dispose();
    _shelfLifeController.dispose();
    _segregationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('lib/assets/images/itrack_logo.png'),
                const SizedBox(height: 20.0),
                Container(
                  // height: 600,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                      color: Color(0x9FA16B19)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120, bottom: 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Type of Business
                        DropdownMenu(
                          controller: _businessTypeController,
                          inputDecorationTheme: const InputDecorationTheme(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                          enableSearch: false,
                          enableFilter: false,
                          width: 300.0,
                          label: const Text(
                            'Type of Business:',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                          dropdownMenuEntries: const [
                            DropdownMenuEntry(
                                value: 'Manufacturing', label: 'Manufacturing'),
                            DropdownMenuEntry(
                                value: 'Wholesaling', label: 'Wholesaling'),
                            DropdownMenuEntry(
                                value: 'Retailing', label: 'Retailing'),
                            DropdownMenuEntry(
                                value: 'Service', label: 'Service'),
                            DropdownMenuEntry(value: 'Others', label: 'Others'),
                          ],
                        ),
                        const SizedBox(height: 30),

                        // Shelf Life
                        DropdownMenu(
                          controller: _shelfLifeController,
                          inputDecorationTheme: const InputDecorationTheme(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                          enableSearch: false,
                          enableFilter: false,
                          width: 300.0,
                          label: const Text('Shelf Life:'),
                          dropdownMenuEntries: const [
                            DropdownMenuEntry(
                                value: 'Perishable', label: 'Perishable'),
                            DropdownMenuEntry(
                                value: 'Non-Perishable',
                                label: 'Non-Perishable'),
                          ],
                        ),
                        const SizedBox(height: 30),

                        // Segregated By
                        DropdownMenu(
                          controller: _segregationController,
                          inputDecorationTheme: const InputDecorationTheme(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                          enableSearch: false,
                          enableFilter: false,
                          width: 300.0,
                          label: const Text('Segregated By:'),
                          dropdownMenuEntries: const [
                            DropdownMenuEntry(
                                value: 'FIFO',
                                label: 'First In, First Out (FIFO)'),
                            DropdownMenuEntry(
                                value: 'LIFO',
                                label: 'Last In, First Out (LIFO)'),
                          ],
                        ),
                        const SizedBox(height: 30),
                        MyButton(
                            onPressed: () {
                              addBusinessDetails(
                                _businessTypeController.text,
                                _shelfLifeController.text,
                                _segregationController.text,
                              );

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            },
                            text: 'Save',
                            bgcolor: const Color(0xFF363030),
                            textColor: Colors.white),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
