import 'package:convertio/app/data/model/money_model.dart';
import 'package:flutter/foundation.dart';

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
    this.dolar = Money(name: "Dolar", price: json["USD"] ?? 0.0);
    this.euro = Money(price: json['EUR'] ?? 0.0, name: "Euro");
    this.real = Money(price: json['BRL'] ?? 0.0, name: "Real");
    this.yen = Money(price: json['JPY'] ?? 0.0, name: "Japanese Yen");
    this.lev = Money(price: json['BGN'] ?? 0.0, name: "Lev");
    this.libra = Money(name: "Libra Esterlina", price: json['GBP'] ?? 0.0);
    this.forint = Money(name: "Forint", price: json['HUF'] ?? 0.0);
    this.zloty = Money(name: "Zloty", price: json['PLN'] ?? 0.0);
    this.rublo = Money(name: "Rublo", price: json['RUB'] ?? 0.0);
    this.kuna = Money(name: "Kuna", price: json['HRK'] ?? 0.0);
    debugPrint("Crypto from json done");
  }
}
