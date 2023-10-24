import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import 'package:form_app/pages/register_form_page.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('kk'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: Locale('kk'),
      child: MyApp()
    ),
  );

    final registerFormBloc = RegisterFormPage();

  runApp(
    MaterialApp(
      home: BlocProvider(
        create: (context) => registerFormBloc,
        child: RegisterFormPage(bloc: registerFormBloc),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegisterFormPage(),
    );
  }
}