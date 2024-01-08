import 'package:flutter/material.dart';
import 'package:yuzbir_yazboz/login_register_folder/auth_main_page.dart';
import 'package:yuzbir_yazboz/main_folder/main_page.dart';
import 'package:yuzbir_yazboz/service/auth.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().authChangeState,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const AnaSayfa();
          } else {
            return const AuthMainPage();
          }
        });
  }
}
