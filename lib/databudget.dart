import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/tambahbudget.dart';

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
        title: Text('Form'),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hello World!'),
          ],
        ),
      ),
    );
  }
}