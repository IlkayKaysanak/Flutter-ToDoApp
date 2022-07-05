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
      theme: ThemeData(),
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
      backgroundColor: Color.fromRGBO(234, 246, 246, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(102, 191, 191, 1.0),
        title: Text(
          "ToDoApp",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: FutureBuilder<List<Yapilacaklar>>(
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
                            elevation: 5,
                            shadowColor: Color.fromRGBO(102, 191, 191, 1.0),
                            color: Color.fromRGBO(255, 0, 99, 1.0),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${gorev.gorev}",
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "${gorev.tarih}",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          Yapilacaklardao()
                                              .gorevSil(gorev.yapilacaklar_id);
                                        });

                                        print("sildi");
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                            )),
                      );
                    });
              } else {
                return Center();
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => GorevEkleme()));
        }),
        tooltip: 'Increment',
        backgroundColor: Color.fromRGBO(102, 191, 191, 1.0),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
