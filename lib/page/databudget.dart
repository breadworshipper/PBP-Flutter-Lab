import 'package:flutter/material.dart';
import 'package:counter_7/page/main.dart';
import 'package:counter_7/page/tambahbudget.dart';


class DataBudgetPage extends StatefulWidget {
  const DataBudgetPage({super.key});

  @override
  State<DataBudgetPage> createState() => _DataBudgetPageState();
}

class _DataBudgetPageState extends State<DataBudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: 'counter_7')),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const TambahBudgetPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const DataBudgetPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: Budget.listBudget.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        Budget.listBudget[index].judulBudget,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            Budget.listBudget[index].nominalBudget.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const Flexible(fit: FlexFit.tight, child: SizedBox()), // Space
                        Container(
                          child: Text(
                            Budget.listBudget[index].jenisBudget,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );

  }
}