import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kmrs/providers/user_provider.dart';
import 'package:kmrs/screen/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kmrs/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:kmrs/responsive/responsive_layout.dart';
import 'package:kmrs/responsive/web_screen_layout.dart';
import 'package:kmrs/responsive/mobile_screen_layout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // initialise app based on platform- web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD145tc1lK8ve_fDRgY9GHLfc5DRp_GiOk",
          appId: "1:678552025358:web:f55485255cccff9b677f5f",
          messagingSenderId: "G-XJGWMKJ71G",
          projectId: "knowleage-management",
          storageBucket: 'knowleage-management.appspot.com'),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'KMRS',
        theme: ThemeData(),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              // Checking if the snapshot has any data or not
              if (snapshot.hasData) {
                // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
                return const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            // means connection to future hasnt been made yet
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: primaryColor,),
              );
            }
            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
