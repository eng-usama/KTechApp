import 'dart:async';

import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class TranslationBase {
  TranslationBase(this.locale);

  final Locale locale;

  static TranslationBase of(BuildContext context) {
    return Localizations.of<TranslationBase>(context, TranslationBase);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appLang' : 'en',
      'lang': 'ع',
      'title': 'Design your\nidentity with a\nprofessional team',
      'subTitle': 'Sub Title',
    },
    'ar': {
      'appLang' : 'ar',
      'lang': 'en',
      'title': 'صمم هويتك\n مع فريقنا\nبشكل احترافي.',
      'subTitle': 'لعنوان الفرعي',
    },
  };

  String get appLang {
    return _localizedValues[locale.languageCode]['appLang'];
  }

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }

  String get lang {
    return _localizedValues[locale.languageCode]['lang'];
  }

  String get subTitle {
    return _localizedValues[locale.languageCode]['subTitle'];
  }
}

class TranslationBaseDelegate extends LocalizationsDelegate<TranslationBase> {
  const TranslationBaseDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<TranslationBase> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<TranslationBase>(TranslationBase(locale));
  }

  @override
  bool shouldReload(TranslationBaseDelegate old) => false;
}
