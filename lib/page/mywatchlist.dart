import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/watchlist.dart';
import 'package:counter_7/page/databudget.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/page/tambahbudget.dart';
import 'package:counter_7/page/main.dart';
import 'package:counter_7/page/watchlistdetail.dart';

class MyWatchList extends StatefulWidget {
  const MyWatchList({Key? key}) : super(key: key);

  @override
  _MyWatchListState createState() => _MyWatchListState();
}

class _MyWatchListState extends State<MyWatchList> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
            appBar: AppBar(
              title: const Text('My Watch List'),
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

        body: FutureBuilder(
                future: MyWatchListModel.fetchWatchList(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (!snapshot.hasData) {
                      return Column(
                        children: const [
                          Text(
                            "Tidak ada to watch list :(",
                            style: TextStyle(
                                color: Color(0xff59A5D8),
                                fontSize: 20),
                          ),
                          SizedBox(height: 8),
                        ],
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index)=> InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WatchListDetail(
                                        modelWatchList: snapshot.data![index])),
                              ),

                            child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 2.0
                                  )
                                ]
                            ),
                            child: Row(
                              children: [
                                Text("${snapshot.data![index].fields.title}",
                                style: const TextStyle(
                                fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  )
                                ),
                                const Flexible(
                                    fit: FlexFit.tight, child: SizedBox()),
                                Checkbox(
                                    value: snapshot
                                        .data![index].fields.watched,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        snapshot.data![index].fields
                                            .watched = value!;
                                      });
                                    }),
                              ],
                            )
                          )
                      )
                      );
                    }
                  }
                }
            )
        );
  }
}




