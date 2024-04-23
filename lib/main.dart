import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget/stfulproductcard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'service/database.dart';
import 'widget/cartbutton.dart';
import 'widget/bottomnavbar.dart';
import 'page/cartpage.dart';
import 'page/mainpage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Mainpage());
}



