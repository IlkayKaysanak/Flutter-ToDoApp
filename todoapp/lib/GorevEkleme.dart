import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todoapp/Yapilacaklardao.dart';
import 'package:todoapp/main.dart';

class GorevEkleme extends StatefulWidget {
  @override
  State<GorevEkleme> createState() => _GorevEklemeState();
}

class _GorevEklemeState extends State<GorevEkleme> {
  var tfController1 = TextEditingController();
  var tfController2 = TextEditingController();
  String alinanVeri1 = "";
  String alinanVeri2 = "";

  Future<void> ekle(String gorev, String tarih) async {
    await Yapilacaklardao().gorevEkle(gorev, tarih);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(234, 246, 246, 1.0),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(102, 191, 191, 1.0),
          title: Text(
            "Görev Ekle",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: EdgeInsets.all(14.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 00),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: tfController1,
                      decoration: InputDecoration(
                          hintText: "Görevi Giriniz",
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Color.fromRGBO(255, 0, 99, 1.0),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)))),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: tfController2,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Bitiş Tarihini Giriniz",
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Color.fromRGBO(255, 0, 99, 1.0),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)))),
                  ),
                ),
              ],
            ),
          )),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (() {
            alinanVeri1 = tfController1.text;
            alinanVeri2 = tfController2.text;
            print(alinanVeri1);
            ekle(tfController1.text, tfController2.text);
          }),
          tooltip: 'Kaydet',
          label: Text("Kaydet"),
          icon: Icon(Icons.save),
          backgroundColor: Color.fromRGBO(102, 191, 191, 1.0),

          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
