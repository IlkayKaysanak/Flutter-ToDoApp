import 'package:flutter/material.dart';
import 'package:todoapp/GorevEkleme.dart';
import 'package:todoapp/Yapilacaklardao.dart';
import 'package:todoapp/Yapilicaklar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Yapilacaklar>> tumGorev() async {
    var listeler = await Yapilacaklardao().tumGorev();
    return listeler;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(115, 43, 41, 41),
      appBar: AppBar(
        title: Text(
          "Yapilacaklar Listesi",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: FutureBuilder<List<Yapilacaklar>>(
          future: tumGorev(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var liste = snapshot.data;
              return ListView.builder(
                  itemCount: liste!.length,
                  itemBuilder: (context, index) {
                    var gorev = liste[index];
                    return SizedBox(
                      child: Card(
                          color: Colors.red,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${gorev.gorev}",
                                        style: TextStyle(fontSize: 22),
                                      ),
                                      Text(
                                        "${gorev.tarih}",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {
                                      print("sildi");
                                    },
                                    icon: Icon(Icons.delete)),
                              ],
                            ),
                          )),
                    );
                  });
            } else {
              return Center();
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => GorevEkleme()));
        }),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
