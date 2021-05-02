import 'package:flutter/foundation.dart';
import 'package:convertio/app/data/model/money_model.dart';

class Crypto {
  String? name;
  Money? dolar;
  Money? euro;
  Money? real;
  Money? yen;
  Money? lev;
  Money? libra;
  Money? forint;
  Money? zloty;
  Money? rublo;
  Money? kuna;

  Crypto.fromJson(Map<String, dynamic> json, String name) {
    this.name = name;
    this.dolar = new Money(name: "Dolar", price: json["USD"]);
    debugPrint("Dolar done");
    this.euro = new Money(price: json['EUR'], name: "Euro");
    debugPrint("Euro done");

    this.real = new Money(price: json['BRL'], name: "Real");
    debugPrint("Real done");

    this.yen = new Money(price: json['JPY'], name: "Japanese Yen");
    debugPrint("Yen done");

    this.lev = new Money(price: json['BGN'], name: "Lev");
    debugPrint("Lev done");

    this.libra = new Money(name: "Libra Esterlina", price: json['GBP']);
    debugPrint("Libra done");

    this.forint = new Money(name: "Forint", price: json['HUF']);
    debugPrint("Forint done");

    this.zloty = new Money(name: "Zloty", price: json['PLN']);
    debugPrint("Zloty done");

    this.rublo = new Money(name: "Rublo", price: json['RUB']);
    debugPrint("Rublo done");

    this.kuna = new Money(name: "Kuna", price: json['HRK']);
    debugPrint("Crypto from json done");
  }
}
