import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kmrs/utils/utils.dart';
import 'package:kmrs/widget/bottom_bar/buttom_bar.dart';

class EditDashboardScreen extends StatefulWidget {
  final String uid;
  const EditDashboardScreen({ Key? key ,required this.uid}) : super(key: key);

  @override
  State<EditDashboardScreen> createState() => _EditDashboardScreenState();
}

class _EditDashboardScreenState extends State<EditDashboardScreen> {
  var userData = {};
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();
      userData = userSnap.data()!;
      setState(() {});
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        :Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height*0.385,
            color: Colors.grey[100],
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      userData['organization'],
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Center(
                      child: Text("GoogleData")
                      ),
                  ],
                ),
              ],
            ),
          ),
          Row(children: [
            Container(
              width: size.width*0.5,
              height: size.height*0.4,
              color: Colors.grey[200],
              child: const Padding(
                padding: EdgeInsets.fromLTRB(30, 10,20,10),
                child: Text("รายงานระดับมหาวิทยาลัย"),
              ),
            ),
            Container(
              width: size.width*0.5,
              height: size.height*0.4,
              color: Colors.grey[300],
              child: const Padding(
                padding: EdgeInsets.fromLTRB(30,10,20,10),
                child: Text("รายงานประจำปีของหน่วยงาน"),
              ),
            ),
          ]
          ),
        ],
      ),
      bottomNavigationBar: const ButtomAppBar(),
    );
  }
}