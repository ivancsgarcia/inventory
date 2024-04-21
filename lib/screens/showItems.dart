import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/addItemPopUp.dart';
import 'package:flutter_application_1/services/firestore.dart';

class ShowItems extends StatefulWidget {
  const ShowItems({super.key});

  @override
  State<ShowItems> createState() => _ShowItemsState();
}

class _ShowItemsState extends State<ShowItems> {
  final CrudMethods crudMethods = CrudMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_circle),
      ),
      body: StreamBuilder(
        stream: crudMethods.getItems(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List itemList = snapshot.data!.docs;

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Category')),
                  DataColumn(label: Text('Product Name')),
                  DataColumn(label: Text('Cost')),
                  DataColumn(label: Text('Selling Price')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: itemList.map((document) {
                  final data = document.data() as Map<String, dynamic>;
                  return DataRow(cells: [
                    DataCell(Text(data['category'])),
                    DataCell(Text(data['productName'])),
                    DataCell(Text(data['cost'])),
                    DataCell(Text(data['sellingPrice'])),
                    const DataCell(Row(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(width: 10.0),
                        Icon(Icons.delete),
                      ],
                    )),
                  ]);
                }).toList(),
              ),
            );
          } else {
            return const Text('No Items...');
          }
        },
      ),
    );
  }
}
