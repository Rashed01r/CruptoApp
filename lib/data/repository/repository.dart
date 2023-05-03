import 'package:crypto_app/data/models/coin.dart';
import 'package:crypto_app/data/webService/webServic.dart';

class Repository {
  final WebService webService;

  Repository({required this.webService});

  Future<List<Coin>> getAllCoins() async {
    final models = await webService.getAllCoins();
    return models!.map((coins) => Coin.fromJson(coins)).toList();
  }
}
