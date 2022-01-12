import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.height);
    print(size.width);
    return Scaffold(
      body: Container(
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
                  child: Center(
                    child: SingleChildScrollView(
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
                              width: 30,
                              child: const Divider(
                                color: Colors.green,
                                thickness: 2,
                              ),
                            ),
                            const SizedBox(height: 32),
                            const TextField(
                              decoration: InputDecoration(
                                hintText: 'ชื่อผู้ใช้',
                                labelText: 'ชื่อผู้ใช้',
                                suffixIcon: Icon(
                                  Icons.mail_outline,
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            const TextField(
                              decoration: InputDecoration(
                                hintText: 'รหัสผ่าน',
                                labelText: 'รหัสผ่าน',
                                suffixIcon: Icon(
                                  Icons.lock_outline,
                                ),
                              ),
                            ),
                            const SizedBox(height: 64),
                            ElevatedButton(
                                onPressed: () {},
                                child: const Text('เข้าสู่ระบบ'),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.green))),
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
      bottomNavigationBar: Container(
        height: size.height * 0.15,
        color: Colors.grey[400],
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "มีปัญหาการใช้งานระบบติดต่อ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "โทร 02-942-8445-9",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "E-mail: fgra@ku.ac.th",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
