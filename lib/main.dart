import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ostad_assignment03/data_fetch/provider.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'myapp.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black));
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider<PhotoProvider>(create: (context) => PhotoProvider()),
      ],
      child: const MyApp()
  ));
}
