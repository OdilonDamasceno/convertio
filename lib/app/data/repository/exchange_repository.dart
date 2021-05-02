import 'package:flutter/foundation.dart';
import 'package:convertio/app/data/model/exchange_model.dart';

import '../provider/exchange_provider.dart';

class ExchangeRepository {
  final ExchangeProvider apiClient = ExchangeProvider();
  Future<Exchange?> getSource() async {
    Map<String, dynamic>? res = await apiClient.getResouces();
    debugPrint("Exchange done");
    return res != null ? Exchange.fromJson(res) : null;
  }
}
