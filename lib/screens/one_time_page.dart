import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({
    super.key,
  });

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _firstController = TextEditingController();
  final _secondController = TextEditingController();
  final _thirdController = TextEditingController();

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset('lib/assets/images/itrack_logo.png'),
              const SizedBox(height: 20.0),
              Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                    color: Color(0xFFEAAC4F)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Type of Business
                    DropdownMenu(
                      controller: _firstController,
                      inputDecorationTheme: const InputDecorationTheme(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                      enableSearch: false,
                      enableFilter: false,
                      width: 300.0,
                      label: const Text(
                        'Type of Business:',
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(value: 'Option 1', label: 'Option 1'),
                        DropdownMenuEntry(value: 'Option 2', label: 'Option 2'),
                        DropdownMenuEntry(value: 'Option 3', label: 'Option 3'),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Shelf Life
                    DropdownMenu(
                      controller: _secondController,
                      inputDecorationTheme: const InputDecorationTheme(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                      enableSearch: false,
                      enableFilter: false,
                      width: 300.0,
                      label: const Text('Shelf Life:'),
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(value: 'Option 1', label: 'Option 1'),
                        DropdownMenuEntry(value: 'Option 2', label: 'Option 2'),
                        DropdownMenuEntry(value: 'Option 3', label: 'Option 3'),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Segregated By
                    DropdownMenu(
                      controller: _thirdController,
                      inputDecorationTheme: const InputDecorationTheme(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                      enableSearch: false,
                      enableFilter: false,
                      width: 300.0,
                      label: const Text('Segregated By:'),
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(value: 'Option 1', label: 'Option 1'),
                        DropdownMenuEntry(value: 'Option 2', label: 'Option 2'),
                        DropdownMenuEntry(value: 'Option 3', label: 'Option 3'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    MyButton(
                        onPressed: () {},
                        text: 'Save',
                        bgcolor: const Color(0xFF363030),
                        textColor: Colors.white),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
