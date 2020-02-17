import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'Controllers/TabBarController/TabBar.dart';
import 'Localization/translations_delegate_base.dart';
import 'Models/LocalModels.dart' as Model1;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'main.dart';

class ScopeModelWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(model: AppModel(), child: appMain());
  }
}

class appMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => MaterialApp(
            locale: Locale(Model1.userLanguage),
            localizationsDelegates: [
              const TranslationBaseDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('ar', ''), // Arabic
              const Locale('en', ''), // English
            ],
            theme: ThemeData(
                fontFamily: "Lato",
                primaryColor: Model1.appColor,
                accentColor: Colors.white,
                // hintColor: Colors.green
                // primarySwatch: Colors.white,
                backgroundColor: Colors.white,
                primaryTextTheme: TextTheme(
                  title: TextStyle(color: Model1.appColor),
                )),
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => StartingPage(),
              '/Main': (context) => MainPage(),
            }
            //theme: hrTheme,
//          title: "Arabic Flutter",
//          home: new Home(),
            ));
  }
}

class AppModel extends Model {
  Locale _appLocale = Locale(Model1.userLanguage);

  Locale get appLocal => _appLocale ?? Locale("en");

  void changeDirection() {
    print(appLocal);
    if (_appLocale == Locale("ar")) {
      Model1.userLanguage = "en";
      _appLocale = Locale("en");
    } else {
      Model1.userLanguage = "ar";
      _appLocale = Locale("ar");
    }
    notifyListeners();
  }
}
