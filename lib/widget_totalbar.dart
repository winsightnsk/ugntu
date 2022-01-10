import 'package:flutter/material.dart';
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
                .bodyText2?.copyWith(color: Colors.teal)),
            Text('ЦП_РКПд-21-01', style: Theme
                .of(context)
                .textTheme
                .bodyText2?.copyWith(color: Colors.teal)),
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
  double cirk=8.0;
  return SizedBox(width: 300,
    child:
    ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
           decoration: BoxDecoration(
             borderRadius: BorderRadius.all(Radius.circular(cirk)),
            color: Colors.white,
          ),
          child: Image.asset('assets/fluter.jpg'),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(cirk))
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.login),
                  title: const Text('Авторизация'),
                  onTap: () => toEnterPage(context),
                ),
                ListTile(
                  leading: const Icon(Icons.login),
                  title: const Text('Регистрация'),
                  onTap: () => toRegPage(context),
                ),
                ListTile(
                  leading: const Icon(Icons.login),
                  title: const Text('Загрузка'),
                  onTap: () => toLoadJSON(context),
                ),
                ListTile(
                  leading: const Icon(Icons.login),
                  title: const Text('Список (кейс)'),
                  onTap: () => toShowList(context),
                ),
                ListTile(
                  leading: const Icon(Icons.login),
                  title: const Text('Данные (кейс)'),
                  onTap: () => toDataManage(context),
                ),
                ListTile(
                  leading: const Icon(Icons.login),
                  title: const Text('Сеть (кейс)'),
                  onTap: () => toNetPage(context),
                ),
              ],
            )

          ),
        ),
      ],
    ),
  );
}
