import 'package:crypto_app/data/models/coin.dart';
import 'package:crypto_app/data/repository/repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Repository repository;
  List<Coin> coins = [];

  HomeController({required this.repository});

  List<Coin> getAllCoin() {
    repository.getAllCoins().then((models) {
      this.coins = models;

      update();
    });
    return coins;
  }
}
