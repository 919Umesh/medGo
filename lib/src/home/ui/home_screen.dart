import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/injection/injection_helper.dart';
import '../../../core/services/sharepref/share_pref.dart';

class HomeScreen extends StatefulWidget {
  final String userId;
  const HomeScreen({super.key, required this.userId});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Fluttertoast.showToast(
      msg: locator<PrefHelper>().getIsLogin().toString(),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
    );
  }
}
