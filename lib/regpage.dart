import 'package:berkana/widget_totalbar.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class RegPage extends StatelessWidget {
  static String rote = 'RegPage';
  const RegPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: totalBar(context),
      drawer: totalDrawer(context),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/epfon.jpg'),
              fit: BoxFit.cover,
            )
        ),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(child: Container()),
                  const Icon(
                    Icons.app_registration,
                    color: Colors.black12,
                    size: 30.0,
                  ),
                  Text('Регистрация', style: Theme.of(context).textTheme.headline1),
                  Expanded(child: Container()),
                ],
              ),
              const Divider(color: Colors.black),
              Text('Чтобы зарегистрироваться введите свой номер телефона и почту',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(flex:1, child: Container()),
                  const Expanded(flex:4,
                    child: SizedBox(//width: 224,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontFamily: 'DroidSerif', fontSize: 20,),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFeceff1),
                          enabledBorder: borderStyle,
                          focusedBorder: borderStyle,
                          labelText: '+7',
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex:1, child: Container()),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(flex:1, child: Container()),
                  const Expanded(flex:4,
                    child: SizedBox(width: 224,
                      child: TextField(
                        style: TextStyle(fontFamily: 'DroidSerif', fontSize: 20,),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFeceff1),
                          enabledBorder: borderStyle,
                          focusedBorder: borderStyle,
                          labelText: 'E-mail',
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex:1, child: Container()),
                ],
              ),
              Text('Вам придет четырёхзначный код, который будет вашим паролем',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1
              ),
              Text('Изменить пароль можно будет в личном кабинете после регистрации',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1
              ),
              const SizedBox(height: 28,),
              SizedBox(
                  width: 200,
                  height: 42,
                  child:
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF0079D0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36)
                          )
                      ),
                      onPressed: () {},
                      child: const Text('Отправить код', style: TextStyle(fontFamily: 'gabriola', fontSize: 26))
                  )
              ),
            ],
          ),
        ),
      )
    );
  }
}