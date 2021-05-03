import 'package:flutter/material.dart';
import 'package:convertio/app/data/model/exchange_model.dart';
import 'package:convertio/app/data/repository/exchange_repository.dart';

import 'widgets/rotate_logo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ExchangeRepository? repository;
  Future<Exchange?>? future;

  List<Map<String, dynamic>>? cryptos;
  String? nameCrypto;
  String? nameCoin;
  List<Map<String, dynamic>>? coins;
  int? coinValue = 0;
  int? cryptoValue = 0;
  bool hasCrypto = false;
  bool hasCoin = false;

  @override
  void initState() {
    repository = ExchangeRepository();
    future = repository!.getSource();
    if (future == null) {
      debugPrint("Future has no data");
      setState(() {
        future = repository!.getSource();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return SafeArea(
      child: Scaffold(
        floatingActionButton: hasCoin && hasCrypto
            ? FloatingActionButton(
                backgroundColor: Colors.grey[800],
                onPressed: () {
                  setState(() {
                    future = repository!.getSource();
                  });
                },
                child: Icon(Icons.refresh),
              )
            : null,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: FutureBuilder<Exchange?>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.stackTrace != StackTrace.empty &&
                  snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                cryptos = [
                  {"index": 0, "value": snapshot.data!.bTC},
                  {"index": 1, "value": snapshot.data!.eTH},
                  {"index": 2, "value": snapshot.data!.xRP},
                ];

                var criptoValues = cryptos![cryptoValue!]["value"];
                coins = [
                  {"index": 0, "value": criptoValues.dolar},
                  {"index": 1, "value": criptoValues.euro},
                  {"index": 2, "value": criptoValues.forint},
                  {"index": 3, "value": criptoValues.kuna},
                  {"index": 4, "value": criptoValues.lev},
                  {"index": 5, "value": criptoValues.libra},
                  {"index": 6, "value": criptoValues.real},
                  {"index": 7, "value": criptoValues.rublo},
                  {"index": 8, "value": criptoValues.yen},
                  {"index": 9, "value": criptoValues.zloty},
                ];

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(child: Image.asset("assets/convertio.png")),
                    Spacer(),
                    hasCoin && hasCrypto
                        ? Text.rich(
                            TextSpan(
                              text: "1 $nameCrypto é igual a\n",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[600],
                              ),
                              children: [
                                TextSpan(
                                  text: coins![coinValue!]["value"]
                                          .price
                                          .toString()
                                          .replaceAll(".", ",") +
                                      " $nameCoin\n",
                                  style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.grey[800],
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}. ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}",
                                  style: TextStyle(fontSize: 11),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                    SizedBox(height: 50),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            hint: Center(child: Text("Criptomoeda")),
                            value: nameCrypto,
                            onChanged: (cryp) {
                              setState(() {
                                hasCrypto = true;
                                this.nameCrypto = cryp;
                              });
                            },
                            items: cryptos?.map((cryp) {
                              return DropdownMenuItem<String>(
                                value: cryp["value"].name,
                                child: Center(
                                    child: Text("${cryp["value"].name}")),
                                onTap: () {
                                  cryptoValue = cryp["index"];
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text("para"),
                        ),
                        Expanded(
                          child: DropdownButton<String>(
                            hint: Center(child: Text("Moeda")),
                            isExpanded: true,
                            value: nameCoin,
                            items: coins!.map((coin) {
                              return DropdownMenuItem<String>(
                                value: coin["value"].name,
                                child: Center(
                                    child: Text(
                                  "${coin["value"].name}",
                                  overflow: TextOverflow.ellipsis,
                                )),
                                onTap: () {
                                  coinValue = coin["index"];
                                },
                              );
                            }).toList(),
                            onChanged: (coin) {
                              setState(() {
                                hasCoin = true;
                                nameCoin = coin;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Criado com ❤️ por:\n\nOdilon Damasceno\nMatheus Henrique\nMatheus Fernandes\nLucas Vieira",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: RotateLogo());
              }
            },
          ),
        ),
      ),
    );
  }
}
