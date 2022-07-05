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
        backgroundColor: Color.fromARGB(115, 43, 41, 41),
        appBar: AppBar(
          title: Text(
            "Görev Ekle",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
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
                          filled: true,
                          fillColor: Colors.red,
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
                    decoration: InputDecoration(
                        hintText: "Tarihi Giriniz",
                        filled: true,
                        fillColor: Colors.red,
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

          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
