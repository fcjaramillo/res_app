// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class I18n {
  I18n();

  static I18n? _current;

  static I18n get current {
    assert(_current != null,
        'No instance of I18n was loaded. Try to initialize the I18n delegate before accessing I18n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<I18n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = I18n();
      I18n._current = instance;

      return instance;
    });
  }

  static I18n of(BuildContext context) {
    final instance = I18n.maybeOf(context);
    assert(instance != null,
        'No instance of I18n present in the widget tree. Did you add I18n.delegate in localizationsDelegates?');
    return instance!;
  }

  static I18n? maybeOf(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  /// `Loading`
  String get sSplashLoading {
    return Intl.message(
      'Loading',
      name: 'sSplashLoading',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get sLoginEmail {
    return Intl.message(
      'Email',
      name: 'sLoginEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get sLoginPass {
    return Intl.message(
      'Password',
      name: 'sLoginPass',
      desc: '',
      args: [],
    );
  }

  /// `Sing in`
  String get sLoginSingIn {
    return Intl.message(
      'Sing in',
      name: 'sLoginSingIn',
      desc: '',
      args: [],
    );
  }

  /// `Do you have not an account?`
  String get sLoginNoAccount {
    return Intl.message(
      'Do you have not an account?',
      name: 'sLoginNoAccount',
      desc: '',
      args: [],
    );
  }

  /// `CREATE A NEW ONE HERE`
  String get sLoginSingUp {
    return Intl.message(
      'CREATE A NEW ONE HERE',
      name: 'sLoginSingUp',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get sNewUserCreate {
    return Intl.message(
      'Create account',
      name: 'sNewUserCreate',
      desc: '',
      args: [],
    );
  }

  /// `In which city do you want to eat?`
  String get sHomeAskCity {
    return Intl.message(
      'In which city do you want to eat?',
      name: 'sHomeAskCity',
      desc: '',
      args: [],
    );
  }

  /// `Near restaurants`
  String get sHomeNearRestaurant {
    return Intl.message(
      'Near restaurants',
      name: 'sHomeNearRestaurant',
      desc: '',
      args: [],
    );
  }

  /// `POPULAR DESTINATIONS`
  String get sHomePopularDestines {
    return Intl.message(
      'POPULAR DESTINATIONS',
      name: 'sHomePopularDestines',
      desc: '',
      args: [],
    );
  }

  /// `Restaurants`
  String get sRestaurants {
    return Intl.message(
      'Restaurants',
      name: 'sRestaurants',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<I18n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<I18n> load(Locale locale) => I18n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
