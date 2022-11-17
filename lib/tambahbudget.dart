import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/databudget.dart';

class Budget {
  String judulBudget;
  int nominalBudget;
  String jenisBudget;
  static List<Budget> listBudget = [];

  Budget(String this.judulBudget, int this.nominalBudget, String this.jenisBudget);
}

class TambahBudgetPage extends StatefulWidget {
  const TambahBudgetPage({super.key});

  @override
  State<TambahBudgetPage> createState() => _TambahBudgetPageState();
}


class _TambahBudgetPageState extends State<TambahBudgetPage> {
  final _formKey = GlobalKey<FormState>();
  String _judulBudget = "";
  int _nominalBudget = 0;
  String _jenisBudget = 'Pemasukan';
  List<String> _listJenisBudget = ['Pemasukan', 'Pengeluaran'];

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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),

              child: Column(
              children: [
                Padding(padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Judul',
                  icon: const Icon(Icons.title),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),

                ),
                onChanged: (String? value) {
                  setState(() {
                    _judulBudget = value!;
                  });

                },
                  onSaved: (String? value) {
                    setState(() {
                      _judulBudget = value!;
                    });

                  },
                validator: (String? value){
                  if (_judulBudget == null || _judulBudget.isEmpty){
                      return 'Judul tidak boleh kosong!';
                  }
                  return null;
                },
              ),
              ),
                Padding(padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Nominal',
                      icon: const Icon(Icons.money),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),

                    ),
                    onChanged: (String? value) {
                      setState(() {

                        _nominalBudget = int.parse(value!);
                      });

                    },
                    onSaved: (String? value) {
                      setState(() {
                        _nominalBudget = int.parse(value!);
                      });

                    },
                    validator: (String? value){
                      if (_nominalBudget == null){
                        return 'Nominal tidak boleh kosong!';
                      }
                      return null;
                    },
                  )
                ),
                // Dropdown menu

                Container(
                  margin: const EdgeInsets.all(8),
                  child: DropdownButtonFormField(
                    hint: const Text("Pilih jenis"),
                    value: _jenisBudget.isNotEmpty ? _jenisBudget : null,
                    items: _listJenisBudget.map( (String items){
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _jenisBudget = value!;
                      });
                    },
                  )
              ),
                TextButton(child: const Text(
                    "Simpan"),
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    Budget newBudget = Budget(_judulBudget, _nominalBudget, _jenisBudget);
                    Budget.listBudget.add(newBudget);
                    _formKey.currentState?.reset();
                  }
                },
                )
              ]
          )
            ),
        ),
      ),
    );
  }
}