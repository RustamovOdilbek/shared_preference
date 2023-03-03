import 'package:flutter/material.dart';
import 'package:shared_preference/service/utils_service.dart';

import '../model/info_model.dart';
import '../service/PrefService.dart';
import '../service/log_service.dart';

class LogIn extends StatefulWidget {
  static final String id = "user_page";

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 40),
        color: Colors.grey.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Expanded(
              child: Image.asset("assets/images/image.jpg",),
            ),

            Text("Welcome back!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                shadows: [
                  Shadow(
                    blurRadius:10.0,  // shadow blur
                    color: Colors.grey.shade200, // shadow color
                    offset: Offset(1.0,1.0), // how much shadow will be shown
                  ),
                ],
              ),
            ),

            SizedBox(height: 10,),

            Text("Log in to your existant account of Q Allure",
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 17,
                shadows: [
                  Shadow(
                    blurRadius:10.0,  // shadow blur
                    color: Colors.grey.shade200, // shadow color
                    offset: Offset(1.0,1.0), // how much shadow will be shown
                  ),
                ],
              ),
            ),

            SizedBox(height: 30,),

            // #email
            Container(
              width: double.infinity,
              height: 60,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 1,
                    spreadRadius: 1,
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_2_outlined, color: Colors.grey,),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                   focusedBorder: InputBorder.none,
                   enabledBorder: InputBorder.none,
                ),
              ),
            ),

            SizedBox(height: 20,),

            // #password
            Container(
              width: double.infinity,
              height: 60,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 1,
                    spreadRadius: 1,
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
              child: TextField(
                controller: _password,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline_sharp, color: Colors.grey,),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: (){

                    },
                    child: Text("Forget Password?", style: TextStyle(color: Colors.blueGrey, fontSize: 16),)
                )
              ],
            ),

            SizedBox(height: 20,),

            //  #log in
           Container(
             width: 200,
             height: 50,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(25),
               color: Colors.indigo.shade700,
               boxShadow: [
                 BoxShadow(
                   offset: Offset(0, 0),
                   blurRadius: 10,
                   spreadRadius: 2,
                   color: Colors.indigo.shade300,
                 ),
               ],
             ),
             child:  TextButton(
                 onPressed: (){
                   if(_email.text.toString().isNotEmpty && _password.text.toString().isNotEmpty){
                     LogService.e(_email.text.toString());
                     LogService.e(_password.text.toString());
                     Info info = Info(_email.text.toString(), _password.text.toString());
                     PrefService.storeInfo(info);
                     PrefService.loadInfo().then((value) => {
                        //LogService.e(value!.toJson().toString())

                       Utils.showToast(value!.toJson().toString())
                      });
                   }else{
                     LogService.e("error");
                   }
                 },
                 child: Text("LOG IN", style: TextStyle(color: Colors.white, fontSize: 20,),)
             ),
           ),

            SizedBox(height: 30,),

            // or connect using
            Text("Or connect using",
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 18,
                shadows: [
                  Shadow(
                    blurRadius:10.0,  // shadow blur
                    color: Colors.grey.shade300, // shadow color
                    offset: Offset(1.0,1.0), // how much shadow will be shown
                  ),
                ],
              ),
            ),

            SizedBox(height: 20,),

            // #facebook and #google log in
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 45,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.indigo,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 1,
                        spreadRadius: 1,
                        color: Colors.indigo.shade100,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/facebook.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Text("Facebook", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 1),)
                    ],
                  ),
                ),
                SizedBox(width: 20,),
                Container(
                  height: 45,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 1,
                        spreadRadius: 1,
                        color: Colors.red.shade300,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/google.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Text("Google", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 1),)
                    ],
                  ),
                )
              ],
            ),

            SizedBox(height: 20,),

            // #sign up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ", style: TextStyle(color: Colors.black87, fontSize: 16),),
                Text("Sign Up", style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),),
              ],
            ),

            SizedBox(height: 20,),
          ],
        ),
      )
    );
  }
}
