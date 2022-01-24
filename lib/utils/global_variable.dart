import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kmrs/screen/edit_dashboard/edit_dashboard_screen.dart';


const webScreenSize = 600;

List<Widget> homeScreenItems = [
  
  EditDashboardScreen(uid: FirebaseAuth.instance.currentUser!.uid,),

];
