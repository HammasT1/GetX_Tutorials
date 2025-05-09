
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_getx/login_controller.dart';
import 'package:get/get.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  LoginController controller = Get.put(LoginController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Tutorials'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller.emailController.value,
              decoration: InputDecoration(
                hintText: 'Email'
              ),
            ),
            TextFormField(
              controller: controller.passwordController.value,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),
            SizedBox(height: 50,),
            Obx((){
              return InkWell(
                onTap: (){
                  controller.loginApi();
                },
                child: controller.loading.value ? CircularProgressIndicator() : Container(
                  height: 45,
                  color: Colors.blueGrey,
                  child: Center(
                    child: Text('Login'),
                  ),
                ),
              );
            })
          ],
        ),
      )
    );
  }
}