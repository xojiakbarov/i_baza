import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../reg_screen/reg_screen.dart';
 // Ensure you have flutter_svg package in your pubspec.yaml

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

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
            Text('Xush kelibsiz!',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Text('Ma’lumotlarni kiriting',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.grey.shade500,fontFamily: 'Rubik')),
            const SizedBox(height: 22),
            Text('Telefon raqam',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: "+998 ",
                hintText: '99 123 45 67',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),

            SizedBox(height: 16),
            Text('Parol',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                hintText: 'Parolni kiriting',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIcon: _passwordController.text.isEmpty
                    ? TextButton(
                  onPressed: () {

                  },
                  child: Text(
                      'Unutdingizmi?',
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey.shade500)
                  ),
                )
                    : IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {

              },
              child:const Text('Kirish',style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity,48),
              ),
            ),
            SizedBox(height: 40),
            Center(child: Text('Ilovada yangimisiz?',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey.shade500))),
            SizedBox(height: 14),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RagScreen()),
                );
              },
              child:const Text('Ro‘yxatdan o‘tish',style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow.shade100,
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