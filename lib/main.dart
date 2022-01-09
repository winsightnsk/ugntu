import 'package:berkana/netpage.dart';
import 'package:flutter/material.dart';
import 'enterpage.dart';
import 'regpage.dart';
import 'class_theme.dart';
import 'forgetpage.dart';
import 'showlist.dart';
import 'datamanage.dart';
import 'netpage.dart';

const borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(36)),
    borderSide: BorderSide(color: Color(0xFFbbbbbb), width: 2));



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme(),
      initialRoute: EnterPage.rote,
      routes: {
        EnterPage.rote  : (context) => const EnterPage(),
        RegPage.rote    : (context) => const RegPage(),
        ForgetPage.rote : (context) => const ForgetPage(),
        ShowList.rote   : (context) => const ShowList(),
        DataManage.rote : (context) => DataManage(storage: CounterStorage()),
        NetPage.rote    : (context) => const NetPage(),
      }
    );
  }
}

void toEnterPage(BuildContext context) => Navigator.pushNamed(context, EnterPage.rote);
void toRegPage(BuildContext context) => Navigator.pushNamed(context, RegPage.rote);
void toForgetPage(BuildContext context) => Navigator.pushNamed(context, ForgetPage.rote);
void toShowList(BuildContext context) => Navigator.pushNamed(context, ShowList.rote);
void toDataManage(BuildContext context) => Navigator.pushNamed(context, DataManage.rote);
void toNetPage(BuildContext context) => Navigator.pushNamed(context, NetPage.rote);