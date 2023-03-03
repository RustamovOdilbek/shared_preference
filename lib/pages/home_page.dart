import 'package:flutter/material.dart';
import 'package:shared_preference/model/user_model.dart';
import 'package:shared_preference/service/PrefService.dart';
import 'package:shared_preference/service/log_service.dart';
import 'package:shared_preference/service/secure_service.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState(){
    super.initState();
    // PrefService.storeName("Odilbek Rustamov");
    // PrefService.loadName().then((value) => {
    //   LogService.d(value.toString())
    // });
    //
    // User user = User("1779","odilbekrustamov1215@gmail.com", "12344567789");
    // PrefService.storeUser(user);
    // PrefService.loadUser().then((value) => {
    //   LogService.e(value!.toJson().toString())
    // });

    SecureService.storeApiKey("lwsdfhkelwnfhcklenkewrntr");
    SecureService.loadApiKey().then((value) =>{
      LogService.e(value!.toString())
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
