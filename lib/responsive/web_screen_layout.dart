import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kmrs/resources/auth_methods.dart';
import 'package:kmrs/screen/login/login_screen.dart';
import 'package:kmrs/utils/colors.dart';
import 'package:kmrs/utils/global_variable.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  int _page = 0;
  late PageController pageController; // for tabs animation

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          children: <Widget>[
            SvgPicture.asset(
              'assets/ku_km_logo.svg',
              color: primaryColor,
              height: 62,
            ),
          ],
        ),
        actions: [
          // IconButton(
          //   icon: Icon(
          //     Icons.home,
          //     color: _page == 0 ? primaryColor : secondaryColor,
          //   ),
          //   onPressed: () => navigationTapped(0),
          // ),
          ElevatedButton.icon(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
            onPressed: ()async {
              await AuthMethods().signOut();
              Navigator.of(context)
              .pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen(),),);},
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.red,
            ),
            label: const Text('ออกจากระบบ',style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: homeScreenItems,
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
    );
  }
}
