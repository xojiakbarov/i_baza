import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../reg3_screen/reg3_screeen.dart';


class RagScreen2 extends StatefulWidget {
  const RagScreen2({super.key});

  @override
  State<RagScreen2> createState() => _RagScreen2State();
}

class _RagScreen2State extends State<RagScreen2> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  String _pinCode = "";

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {}); // Call setState to rebuild the widget with the new icon
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 96),
            Center(child: SvgPicture.asset('assets/icons/login/logo_login.svg')),
            const SizedBox(height: 48),
            Text('Ro‘yxatdan o‘tish',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Text('Ma’lumotlarni kiriting',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.grey.shade500,fontFamily: 'Rubik')),
            SizedBox(height: 22),
            Center(child: Text('Ro‘yxatdan o‘tish uchun kod telefon  raqamingizga yuborildi',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey.shade500))),
            SizedBox(height: 8),
            Center(child: Text('+998 99 144 34 29',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500))),
            const SizedBox(height: 8),
            PinCodeTextField(
              appContext: context,
              length: 6,
              onChanged: (value) {
                setState(() {
                  _pinCode = value;
                });
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 43,
                fieldWidth: 43,
                activeFillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Kod kelmadimi?',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey.shade500)),
                SizedBox(width: 4,),
                Text('Qaytadan yuborish',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
              ],
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RagScreen3()),
                );

              },
              child:const Text('Davom etish',style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity,48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}