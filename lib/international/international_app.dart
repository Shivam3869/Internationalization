import 'local_provider.dart';
import 'package:flutter/material.dart';
import 'gen.dart';
import 'package:provider/provider.dart';

class InternationalizationHome extends StatelessWidget {
  const InternationalizationHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            showSupportedLocales(context),
          ],
        ),
        body: Scaffold(body: body(context)));
  }

  Widget body(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        width: 100,
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 5.0,
          children: [
            Text(AppLocalizations.of(context)!.hello),
            Text(AppLocalizations.of(context)!.world + " !"),
          ],
        ),
      ),
    );
  }

  /// Show supported locales
  Widget showSupportedLocales(BuildContext context) {
    var supportedLocales = AppLocalizations.supportedLocales
    // ignore: deprecated_member_use
        .map((e) => FlatButton(
      child: (Text(LocaleProvider.codeToName[e.languageCode] ?? "")),
      onPressed: () {
        context.read<LocaleProvider>().changeLanguage(e.languageCode);
      },
    ))
        .toList();
    return PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Wrap(
              direction: Axis.vertical,
              spacing: 5.0,
              children: supportedLocales,
            ),
          )
        ]);
  }
}
