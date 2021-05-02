import 'package:flutter/material.dart';

import 'crypto_model.dart';

class Exchange {
  Crypto? bTC;
  Crypto? eTH;
  Crypto? xRP;

  Exchange({this.bTC, this.eTH, this.xRP});

  Exchange.fromJson(Map<String, dynamic> json) {
    bTC = json['BTC'] != null
        ? new Crypto.fromJson(
            json['BTC'],
            "Bitcoin",
          )
        : null;
    eTH = json['ETH'] != null
        ? new Crypto.fromJson(
            json['ETH'],
            "Ethereum",
          )
        : null;
    xRP = json['XRP'] != null
        ? new Crypto.fromJson(
            json['XRP'],
            "Ripple",
          )
        : null;
    debugPrint("Exchange from json done");
  }
}
