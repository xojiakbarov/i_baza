import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_baza/features/presentation/login_screen/login_screen.dart';
import 'package:i_baza/features/presentation/reg2_screen/reg2_screen.dart';

class RagScreen extends StatefulWidget {
  const RagScreen({super.key});

  @override
  State<RagScreen> createState() => _RagScreenState();
}

class _RagScreenState extends State<RagScreen> {
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
            Center(child: SvgPicture.asset('assets/icons/svg/login_screen_icon.svg')),
            const SizedBox(height: 48),
            Text('Ro‘yxatdan o‘tish',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Text('Ma’lumotlarni kiriting',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.grey.shade500,fontFamily: 'Rubik')),
            const SizedBox(height: 22),
            Text('F.I.Sh',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                hintText: 'To‘liq ismingizni kiriting',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              keyboardType: TextInputType.text,
            ),

            SizedBox(height: 16),
            Text('Telefon raqam',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: "+998 ",
                hintText: '99 123 45 67',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RagScreen2()),
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
            SizedBox(height: 40),
            Center(child: Text('Ro‘yxatdan o‘tganmisiz?',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey.shade500))),
            SizedBox(height: 14),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child:const Text('Kirish',style: TextStyle(color: Colors.black)),
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