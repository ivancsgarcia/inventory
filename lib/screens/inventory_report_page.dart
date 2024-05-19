import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class InventoryReportPage extends StatefulWidget {
  const InventoryReportPage({super.key});

  @override
  State<InventoryReportPage> createState() => _InventoryReportPageState();
}

class _InventoryReportPageState extends State<InventoryReportPage> {
  final user = FirebaseAuth.instance.currentUser!;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xF17C5C2D), // 0xF17C5C2D 0x70A16B19
        centerTitle: true,
        title: const Text('INVENTORY REPORT REQUEST'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xF17C5C2D),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.receipt,
                              size: 45.0,
                              color: Colors.white,
                            ),
                            Text(
                              'Transaction Request',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Divider(color: Colors.white),
                        Text(
                          'Your Request will be sent to: ${user.email}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          'Your transaction request will be sent to the email address above. Not your email address? Update your profile.',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Select a Date Range',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                              'Tell us the dates to be included in your transaction history.'),
                          const Text(
                              'All transactions are in PH time (GMT+8).'),
                          const SizedBox(height: 20.0),
                          const Text(
                            'Select A Date Range',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          const DropdownMenu(
                            width: 380.0,
                            hintText: 'Select Option',
                            dropdownMenuEntries: [
                              DropdownMenuEntry(
                                  value: 'Option 1', label: 'Option 1'),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          const Text(
                            'From',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              suffixIcon: IconButton(
                                  onPressed: () async {
                                    final DateTime? dateTime =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(3000),
                                    );
                                    if (dateTime != null) {
                                      setState(() {
                                        selectedDate = dateTime;
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.date_range)),
                              hintText: 'Select a Start Date',
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          const Text(
                            'To',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              suffixIcon: IconButton(
                                  onPressed: () async {
                                    final DateTime? dateTime =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(3000),
                                    );
                                    if (dateTime != null) {
                                      setState(() {
                                        selectedDate = dateTime;
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.date_range)),
                              hintText: 'Select an End Date',
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          Center(
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                minimumSize:
                                    MaterialStatePropertyAll(Size(300.0, 60.0)),
                                backgroundColor:
                                    MaterialStatePropertyAll(Color(0xF17C5C2D)),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Submit Request',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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
