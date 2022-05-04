import 'package:flutter_localization_app/home_page.dart';
import 'international/gen.dart';
import 'international/local_provider.dart';
import 'international/local_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleService().init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LocaleProvider>(
        create: (context) => LocaleProvider(),
        lazy: false,
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: context.watch<LocaleProvider>().locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
// it checks whether the user existing or not. If it exist then it will directly get you to the home screen
      home: HomePage(),
      );
  }
}
