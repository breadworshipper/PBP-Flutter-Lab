import 'package:counter_7/page/databudget.dart';
import 'package:counter_7/page/mywatchlist.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/page/tambahbudget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Program Counter'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _genapganjil = 'Genap';

  void _genapganjilset(){
    setState(() {
      if (_counter % 2 == 0){
        _genapganjil = 'Genap';
      }
      else {
        _genapganjil = 'Ganjil';
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _genapganjilset();
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter == 0){

      }
      else{
        _counter--;
        _genapganjilset();
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
            ListTile(
              title: const Text('MyWatchList'),
              onTap: () {
                // Route menu ke halaman mywatchlist
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyWatchList()),
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
            if (_genapganjil == 'Genap')
            Text(
              '$_genapganjil',
              style : TextStyle(color: Colors.red, fontSize: 40)
            )
            else
              Text(
                  '$_genapganjil',
                  style : TextStyle(color: Colors.blue, fontSize: 40)
              ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ]
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          if (_counter != 0)
          Positioned(
              left: 30,
              bottom: 20,
              child: FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove)
              )
          ),
          Positioned(
              bottom: 20,
              right: 30,
              child: FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add)
              )
          )
        ],
      ),
    );
  }
}
