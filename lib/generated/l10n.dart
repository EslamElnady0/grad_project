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

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `E-Learning`
  String get eLearning {
    return Intl.message('E-Learning', name: 'eLearning', desc: '', args: []);
  }

  /// `Weekly Schedule`
  String get weeklySchedule {
    return Intl.message(
      'Weekly Schedule',
      name: 'weeklySchedule',
      desc: '',
      args: [],
    );
  }

  /// `Time Schedule`
  String get timeSchedule {
    return Intl.message(
      'Time Schedule',
      name: 'timeSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Internal Map`
  String get internalMap {
    return Intl.message(
      'Internal Map',
      name: 'internalMap',
      desc: '',
      args: [],
    );
  }

  /// `Academic Progress`
  String get academicProgress {
    return Intl.message(
      'Academic Progress',
      name: 'academicProgress',
      desc: '',
      args: [],
    );
  }

  /// `Final Results`
  String get finalResults {
    return Intl.message(
      'Final Results',
      name: 'finalResults',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `📚 Please select the courses you want to follow for updates and announcements!`
  String get selectCources {
    return Intl.message(
      '📚 Please select the courses you want to follow for updates and announcements!',
      name: 'selectCources',
      desc: '',
      args: [],
    );
  }

  /// `Announcements`
  String get announcements {
    return Intl.message(
      'Announcements',
      name: 'announcements',
      desc: '',
      args: [],
    );
  }

  /// `Courses`
  String get courses {
    return Intl.message('Courses', name: 'courses', desc: '', args: []);
  }

  /// `Chat`
  String get chat {
    return Intl.message('Chat', name: 'chat', desc: '', args: []);
  }

  /// `Community`
  String get community {
    return Intl.message('Community', name: 'community', desc: '', args: []);
  }

  /// `👥 You can join your academic year's private group to connect with your classmates!`
  String get youCanJoinToChat {
    return Intl.message(
      '👥 You can join your academic year\'s private group to connect with your classmates!',
      name: 'youCanJoinToChat',
      desc: '',
      args: [],
    );
  }

  /// `Connect. Learn. Go!`
  String get goLearnCommunicate {
    return Intl.message(
      'Connect. Learn. Go!',
      name: 'goLearnCommunicate',
      desc: '',
      args: [],
    );
  }

  /// `Collaborate, share your ideas, and learn from your peers easily 📚`
  String get cooperateShareThoughts {
    return Intl.message(
      'Collaborate, share your ideas, and learn from your peers easily 📚',
      name: 'cooperateShareThoughts',
      desc: '',
      args: [],
    );
  }

  /// `Start writing now..`
  String get startWriting {
    return Intl.message(
      'Start writing now..',
      name: 'startWriting',
      desc: '',
      args: [],
    );
  }

  /// `🔍 Easily discover your way around the university.`
  String get discoverYourWay {
    return Intl.message(
      '🔍 Easily discover your way around the university.',
      name: 'discoverYourWay',
      desc: '',
      args: [],
    );
  }

  /// `🤔 You haven't searched for anything yet!`
  String get didntSreachYet {
    return Intl.message(
      '🤔 You haven\'t searched for anything yet!',
      name: 'didntSreachYet',
      desc: '',
      args: [],
    );
  }

  /// `Write the name of the place you want to reach.`
  String get writeYourPlace {
    return Intl.message(
      'Write the name of the place you want to reach.',
      name: 'writeYourPlace',
      desc: '',
      args: [],
    );
  }

  /// `Search for a building, lecture hall, room, etc..!`
  String get searchForBuilding {
    return Intl.message(
      'Search for a building, lecture hall, room, etc..!',
      name: 'searchForBuilding',
      desc: '',
      args: [],
    );
  }

  /// `Most searched places!`
  String get mostSreached {
    return Intl.message(
      'Most searched places!',
      name: 'mostSreached',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
