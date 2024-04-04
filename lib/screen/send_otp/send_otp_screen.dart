import 'package:demo_first/controller/send_otp_controller/send_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SendOtpScreen extends StatefulWidget {
  const SendOtpScreen({super.key});

  @override
  State<SendOtpScreen> createState() => _SendOtpScreenState();
}

class _SendOtpScreenState extends State<SendOtpScreen> {

  final SendOtpController _controller =Get.put(SendOtpController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Send Otp "),
        ),
        body: Padding(padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              validator: (value){
                String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                RegExp regExp = RegExp(pattern);
                if(value!.isEmpty){
                  return 'Add your phone No';
                }else if(value.length != 10 || !regExp.hasMatch(value)){
                  return 'Please enter valid mobile number';
                }
                return null;
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: _controller.phoneController,
              decoration: InputDecoration(
                hintText: "Enter PhoneNumber",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Center(
              child: ElevatedButton(onPressed: (){
                String phoneNumber = _controller.phoneController.text;

                if(phoneNumber.length == 10){
                  _controller.sendOtp(context: context, number: phoneNumber);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter a vaild 10-digit phone number.'),
                  ),
                  );
                }
                
              },
               child: Text("Send Otp")),
            )
          ],
        ),
        ),
      ),
    );
  }
}