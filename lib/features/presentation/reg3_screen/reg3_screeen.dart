import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_baza/features/presentation/reg2_screen/reg2_screen.dart';// Ensure you have flutter_svg package in your pubspec.yaml

class RagScreen3 extends StatefulWidget {
  const RagScreen3({super.key});

  @override
  State<RagScreen3> createState() => _RagScreen3State();
}

class _RagScreen3State extends State<RagScreen3> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isPasswordVisible2 = false;

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
            Text('Yangi parol o‘rnating',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.grey.shade500,fontFamily: 'Rubik')),
            const SizedBox(height: 22),
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
                suffixIcon: IconButton(
                  icon: Icon(
                    // Toggles the icon
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
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

            SizedBox(height: 16),
            Text('Parolni tasdiqlash',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            TextField(
              controller: _phoneController,
              obscureText: !_isPasswordVisible2,
              decoration: InputDecoration(
                hintText: 'Parolni qaytadan kiriting',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible2 ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible2 = !_isPasswordVisible2;
                    });
                  },
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 20),
            Center(child: Text('Ro‘yxatdan o‘tish bilan siz Foydalanish qoidalari va maxfiylik siyosatiga roziligingizni bildirasiz',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500))),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RagScreen2()),
                );

              },
              child:const Text('Ro‘yxatdan o‘tish',style: TextStyle(color: Colors.black)),
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