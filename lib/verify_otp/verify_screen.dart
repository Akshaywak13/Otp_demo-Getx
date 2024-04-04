import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         backgroundColor: CupertinoColors.opaqueSeparator,
         appBar: AppBar(
          backgroundColor: CupertinoColors.opaqueSeparator,
          title: Text('Verify OTP'),
          centerTitle: true,
         ),
         body: Padding(padding: EdgeInsets.all(20),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Enter OTP',
                labelText: 'Enter otp'
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){},
             child: Text("Verify")),
            //  Obx(() {
            //   if(phoneController.isLoading){
            //     return CircularProgressIndicator();
            //   }else{
            //     return Container();
            //   }
            //  }),
          ],
         ),
         ),
      ),
    );
  }
}