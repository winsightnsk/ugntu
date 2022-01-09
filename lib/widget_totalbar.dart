import 'package:flutter/material.dart';
import 'enterpage.dart';
import 'regpage.dart';
import 'class_theme.dart';
import 'forgetpage.dart';
import 'showlist.dart';
import 'datamanage.dart';
import 'main.dart';

PreferredSizeWidget? totalBar(BuildContext context) {
  return AppBar(
    title: Row(
      children: [
        Column(
          children: [
            Text('Ощепков Владимир Михайлович', style: Theme
                .of(context)
                .textTheme
                .bodyText2),
            Text('ЦП_РКПд-21-01', style: Theme
                .of(context)
                .textTheme
                .bodyText2),
          ],
        ),
        Expanded(child: Container(),),
        const Image(
          alignment: Alignment.center,
          image: AssetImage('assets/wolf.png'),
          height: 50,
        ),
      ],
    ),
  );
}

Widget? totalDrawer(BuildContext context) {
  return SizedBox(width: 300,
    child:
    ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
           decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Image.asset('assets/fluter.jpg'),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Авторизация'),
              onTap: () => toEnterPage(context),
            ),
          ),
        ),
      ],
    ),
  );
}
/*

RegPage.rote    : (context) => const RegPage(),
ForgetPage.rote : (context) => const ForgetPage(),
ShowList.rote   : (context) => const ShowList(),
DataManage.rote : (context) => DataManage(storage: CounterStorage()),
NetPage.rote    : (context) => const NetPage(),
*/
