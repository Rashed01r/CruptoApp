import 'dart:async';

import 'package:crypto_app/component/buildNoInternet.dart';
import 'package:crypto_app/component/componentCoin.dart';
import 'package:crypto_app/component/imageHome.dart';
import 'package:crypto_app/component/nameCoins.dart';
import 'package:crypto_app/controller/homeController.dart';
import 'package:crypto_app/data/repository/repository.dart';
import 'package:crypto_app/data/webService/webServic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController homeController =
      Get.put(HomeController(repository: Repository(webService: WebService())));
  @override
  void initState() {
    super.initState();
    homeController.getAllCoin();
    Timer.periodic(
      Duration(seconds: 5),
      (timer) => homeController.getAllCoin(),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double top = MediaQuery.of(context).viewInsets.top;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    double right = MediaQuery.of(context).viewInsets.right;
    double left = MediaQuery.of(context).viewInsets.left;
    double font = MediaQuery.textScaleFactorOf(context);
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text("Crypto Base"),
          centerTitle: true,
          backgroundColor: Colors.grey[600],
        ),
        body: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            final bool connected = connectivity != ConnectivityResult.none;
            if (connected) {
              return GetBuilder<HomeController>(builder: (_) {
                return ListView.builder(
                  itemCount: homeController.coins.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: EdgeInsets.all(width / 35),
                      width: width,
                      height: height / 9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(height / 30),
                        color: Colors.grey[600],
                      ),
                      child: Row(
                        children: [
                          ImageHome(image: "${homeController.coins[i].symbol}"),
                          Column(
                            children: [
                              NameCoins(
                                symbol: "${homeController.coins[i].symbol}",
                              )
                            ],
                          ),
                          ComponentCoin(
                              valumeCoin:
                                  "${homeController.coins[i].quoteVolume}",
                              bidPrice: "${homeController.coins[i].bidPrice}",
                              priceChange:
                                  "${homeController.coins[i].priceChange}"),
                        ],
                      ),
                    );
                  },
                );
              });
            } else {
              return BuildNoInternet();
            }
          },
          child: CircularProgressIndicator(),
        ));
  }
}
