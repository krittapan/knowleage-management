import 'package:flutter/material.dart';
import 'package:kmrs/resources/auth_methods.dart';
import 'package:kmrs/responsive/mobile_screen_layout.dart';
import 'package:kmrs/responsive/responsive_layout.dart';
import 'package:kmrs/responsive/web_screen_layout.dart';
import 'package:kmrs/screen/edit_dashboard/edit_dashboard_screen.dart';
import 'package:kmrs/utils/colors.dart';
import 'package:kmrs/utils/utils.dart';
import 'package:kmrs/widget/bottom_bar/buttom_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'สำเร็จ') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const ResponsiveLayout(
              mobileScreenLayout: MobileScreenLayout(),
              webScreenLayout: WebScreenLayout(),
            ),
          ),
          (route) => false);

      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.height);
    print(size.width);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: double.infinity,
                  width: size.width * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "ระบบรายงานการจัดการความรู้ภายในส่วนงาน",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "ส่วนงานการจัดการความรู้ภายใน",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "มหาวิทยาลัยเกษตรศาสตร",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: size.width < 790
                    ? EdgeInsets.all(size.height < 770
                        ? 64
                        : size.height > 670
                            ? 32
                            : 16)
                    : EdgeInsets.fromLTRB(size.width * 0.65, size.height * 0.15,
                        size.width * 0.05, size.height * 0.15),
                child: Center(
                  child: Card(
                    elevation: 4,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: Container(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "ลงชื่อเข้าใช้งาน",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: 80,
                                child: const Divider(
                                  color: primaryColor,
                                  thickness: 2,
                                ),
                              ),
                              const SizedBox(height: 32),
                              TextField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  hintText: 'ชื่อผู้ใช้',
                                  labelText: 'ชื่อผู้ใช้',
                                  suffixIcon: Icon(
                                    Icons.person_outlined,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32),
                              TextField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: 'รหัสผ่าน',
                                  labelText: 'รหัสผ่าน',
                                  suffixIcon: Icon(
                                    Icons.lock_outline,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 64),
                              ElevatedButton(
                                  onPressed: () {
                                    loginUser();
                                  },
                                  child: const Text('เข้าสู่ระบบ'),
                                  style: ButtonStyle(
                                      backgroundColor:MaterialStateProperty.all<Color>(primaryColor),
                                  ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const ButtomAppBar(),
    );
  }
}
