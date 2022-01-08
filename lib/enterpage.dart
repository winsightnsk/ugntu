//import 'package:flutter/cupertino.dart';
import 'package:berkana/forgetpage.dart';
import 'package:berkana/regpage.dart';
import 'package:berkana/showlist.dart';
import 'package:flutter/material.dart';
import 'main.dart';
//Ощепков В.М.
class EnterPage extends StatelessWidget {
  static String rote = 'EnterPage';
  const EnterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const SizedBox(height: 100,),
                SizedBox(
                  width: 110,
                  height: 84,
                  child: Image.asset('assets/bodyloop.png'),
                ),
                const SizedBox(height: 20,),
                Text('Введите логин в виде 10 цифр номера телефона',
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
                          obscureText: true,
                          style: TextStyle(fontFamily: 'DroidSerif', fontSize: 20,),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFeceff1),
                            enabledBorder: borderStyle,
                            focusedBorder: borderStyle,
                            labelText: 'Пароль',
                          ),
                        ),
                      ),
                    ),
                    Expanded(flex:1, child: Container()),
                  ],
                ),
                const SizedBox(height: 28,),
                SizedBox(
                  width: 154,
                  height: 42,
                  child:
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF0079D0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36)
                        )
                      ),
                      onPressed: () => Navigator.pushNamed(context, ShowList.rote),
                      child: const Text('Войти', style: TextStyle(fontFamily: 'gabriola', fontSize: 26))
                    )
                ),
                const SizedBox(height: 30,),
                InkWell(
                  child: Text('Регистрация', style: Theme.of(context).textTheme.headline1),
                  onTap:  () => Navigator.pushNamed(context, RegPage.rote),
                ),
                const SizedBox(height: 20,),
                InkWell(
                  child: Text('Забыли пароль', style: Theme.of(context).textTheme.headline1),
                  onTap: () => Navigator.pushNamed(context, ForgetPage.rote),
                ),
              ],
            ),
          ),
        )
    );
  }
}
