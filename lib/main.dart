import 'package:berkana/netpage.dart';
import 'package:flutter/material.dart';
import 'enterpage.dart';
import 'loadjson.dart';
import 'loadjsondop.dart';
import 'regpage.dart';
import 'class_theme.dart';
import 'forgetpage.dart';
import 'showlist.dart';
import 'datamanage.dart';
import 'netpage.dart';

const borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(36)),
    borderSide: BorderSide(color: Color(0xFFbbbbbb), width: 2));

bool authorized =false;

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
        LoadJSON.rote   : (context) => const LoadJSON(),
        //LoadJsonDop.rote: (context) => const LoadJsonDop(),
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
void toLoadJSON(BuildContext context) {
  if (authorized){
    Navigator.pushNamed(context, LoadJSON.rote);
  }
  else {
    showFiga(
        context,
        c: 'Нет доступа',
        t: 'Авторизация не выполнена',
        b: 'Иду вводить номер и пароль',
        r: EnterPage.rote,
    );
  }
}
//void toLoadJsonDop(BuildContext context) => Navigator.pushNamed(context, LoadJsonDop.rote);


Future showFiga(BuildContext context, {String t='', String c='ерунда какая-то...', String b='Согласен!', String r=''}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(t, style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.right,),
        content: Text(c, style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,),
        actions: <Widget>[
          InkWell(
            child: Text(b, style: Theme.of(context).textTheme.headline1),
            onTap: (r=='')
              ? () => Navigator.of(context).pop()
              : () => Navigator.pushNamed(context, r),
          ),
        ],
      );
    },
  );
}