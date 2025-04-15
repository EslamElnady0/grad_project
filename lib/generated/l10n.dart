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
  String get app_title {
    return Intl.message('E-Learning', name: 'app_title', desc: '', args: []);
  }

  /// `Welcome back!\nPlease log in to access your dashboard and stay productive.`
  String get welcome_message {
    return Intl.message(
      'Welcome back!\nPlease log in to access your dashboard and stay productive.',
      name: 'welcome_message',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Log In`
  String get login {
    return Intl.message('Log In', name: 'login', desc: '', args: []);
  }

  /// `Everything will return to its place!`
  String get success_message {
    return Intl.message(
      'Everything will return to its place!',
      name: 'success_message',
      desc: '',
      args: [],
    );
  }

  /// `🔑 It's okay! Just enter your email so we can recover your account and password!`
  String get forgot_password_message {
    return Intl.message(
      '🔑 It\'s okay! Just enter your email so we can recover your account and password!',
      name: 'forgot_password_message',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Confirmation for security!`
  String get security_confirmation {
    return Intl.message(
      'Confirmation for security!',
      name: 'security_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Verify your account!`
  String get verify_account {
    return Intl.message(
      'Verify your account!',
      name: 'verify_account',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 6-digit code that was sent to you.`
  String get enter_code {
    return Intl.message(
      'Enter the 6-digit code that was sent to you.',
      name: 'enter_code',
      desc: '',
      args: [],
    );
  }

  /// `Resend?`
  String get resend {
    return Intl.message('Resend?', name: 'resend', desc: '', args: []);
  }

  /// `This field is required`
  String get field_is_required {
    return Intl.message(
      'This field is required',
      name: 'field_is_required',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgot_password {
    return Intl.message(
      'Forgot your password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `E-Learning`
  String get eLearning {
    return Intl.message('E-Learning', name: 'eLearning', desc: '', args: []);
  }

  /// `📚 Please select the subjects you want to check for posts and updates!`
  String get select_subjects {
    return Intl.message(
      '📚 Please select the subjects you want to check for posts and updates!',
      name: 'select_subjects',
      desc: '',
      args: [],
    );
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

  /// `students online now`
  String get studentsOnlineNow {
    return Intl.message(
      'students online now',
      name: 'studentsOnlineNow',
      desc: '',
      args: [],
    );
  }

  /// `Status:`
  String get status {
    return Intl.message('Status:', name: 'status', desc: '', args: []);
  }

  /// `Classes:`
  String get classes {
    return Intl.message('Classes:', name: 'classes', desc: '', args: []);
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `Second Semester`
  String get semester_2 {
    return Intl.message(
      'Second Semester',
      name: 'semester_2',
      desc: '',
      args: [],
    );
  }

  /// `First Semester`
  String get semester_1 {
    return Intl.message(
      'First Semester',
      name: 'semester_1',
      desc: '',
      args: [],
    );
  }

  /// `In Progress`
  String get in_progress {
    return Intl.message('In Progress', name: 'in_progress', desc: '', args: []);
  }

  /// `Pending`
  String get pending {
    return Intl.message('Pending', name: 'pending', desc: '', args: []);
  }

  /// `Not Started`
  String get not_started {
    return Intl.message('Not Started', name: 'not_started', desc: '', args: []);
  }

  /// `Study`
  String get study {
    return Intl.message('Study', name: 'study', desc: '', args: []);
  }

  /// `💬 Welcome to the Q&A forum! Ask your questions, share your knowledge by answering others' questions, and benefit from your peers' experiences here!`
  String get forum_welcome_message {
    return Intl.message(
      '💬 Welcome to the Q&A forum! Ask your questions, share your knowledge by answering others\' questions, and benefit from your peers\' experiences here!',
      name: 'forum_welcome_message',
      desc: '',
      args: [],
    );
  }

  /// `Add your question!`
  String get add_your_question {
    return Intl.message(
      'Add your question!',
      name: 'add_your_question',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message('Filter', name: 'filter', desc: '', args: []);
  }

  /// `View answers`
  String get view_answers {
    return Intl.message(
      'View answers',
      name: 'view_answers',
      desc: '',
      args: [],
    );
  }

  /// `like`
  String get interested {
    return Intl.message('like', name: 'interested', desc: '', args: []);
  }

  /// `Question statistics`
  String get question_statistics {
    return Intl.message(
      'Question statistics',
      name: 'question_statistics',
      desc: '',
      args: [],
    );
  }

  /// `Answer`
  String get answer {
    return Intl.message('Answer', name: 'answer', desc: '', args: []);
  }

  /// `View`
  String get view {
    return Intl.message('View', name: 'view', desc: '', args: []);
  }

  /// `Start`
  String get start {
    return Intl.message('Start', name: 'start', desc: '', args: []);
  }

  /// `🗺️ Where am I now?`
  String get whereAmINow {
    return Intl.message(
      '🗺️ Where am I now?',
      name: 'whereAmINow',
      desc: '',
      args: [],
    );
  }

  /// `Where are you going boss?`
  String get whereAreYouGoingBoss {
    return Intl.message(
      'Where are you going boss?',
      name: 'whereAreYouGoingBoss',
      desc: '',
      args: [],
    );
  }

  /// `📋 Test your knowledge and prepare for the exam by answering the customized questions!`
  String get testYourKnowledge {
    return Intl.message(
      '📋 Test your knowledge and prepare for the exam by answering the customized questions!',
      name: 'testYourKnowledge',
      desc: '',
      args: [],
    );
  }

  /// `Quiz`
  String get quiz {
    return Intl.message('Quiz', name: 'quiz', desc: '', args: []);
  }

  /// `Quiz Description`
  String get quizDesc {
    return Intl.message(
      'Quiz Description',
      name: 'quizDesc',
      desc: '',
      args: [],
    );
  }

  /// `Start Now!`
  String get startNow {
    return Intl.message('Start Now!', name: 'startNow', desc: '', args: []);
  }

  /// `Quiz Details`
  String get quizDetails {
    return Intl.message(
      'Quiz Details',
      name: 'quizDetails',
      desc: '',
      args: [],
    );
  }

  /// `Quiz Status`
  String get quizState {
    return Intl.message('Quiz Status', name: 'quizState', desc: '', args: []);
  }

  /// `Category`
  String get classification {
    return Intl.message('Category', name: 'classification', desc: '', args: []);
  }

  /// `Quiz Duration`
  String get quizDuration {
    return Intl.message(
      'Quiz Duration',
      name: 'quizDuration',
      desc: '',
      args: [],
    );
  }

  /// `Not Started Yet`
  String get didntStartYet {
    return Intl.message(
      'Not Started Yet',
      name: 'didntStartYet',
      desc: '',
      args: [],
    );
  }

  /// `Classwork`
  String get classWork {
    return Intl.message('Classwork', name: 'classWork', desc: '', args: []);
  }

  /// `Minute`
  String get minute {
    return Intl.message('Minute', name: 'minute', desc: '', args: []);
  }

  /// `Once`
  String get once {
    return Intl.message('Once', name: 'once', desc: '', args: []);
  }

  /// `Allowed Attempts`
  String get numOfTimesAllowed {
    return Intl.message(
      'Allowed Attempts',
      name: 'numOfTimesAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Quiz Tips`
  String get quizAdvices {
    return Intl.message('Quiz Tips', name: 'quizAdvices', desc: '', args: []);
  }

  /// `📚 Prepare in Advance`
  String get prepareWell {
    return Intl.message(
      '📚 Prepare in Advance',
      name: 'prepareWell',
      desc: '',
      args: [],
    );
  }

  /// `Set aside time to review and understand key topics.`
  String get reviewTopics {
    return Intl.message(
      'Set aside time to review and understand key topics.',
      name: 'reviewTopics',
      desc: '',
      args: [],
    );
  }

  /// `⏰ Manage Your Time`
  String get manageTime {
    return Intl.message(
      '⏰ Manage Your Time',
      name: 'manageTime',
      desc: '',
      args: [],
    );
  }

  /// `Divide your time wisely between questions, and don’t spend too long on one.`
  String get timeManagement {
    return Intl.message(
      'Divide your time wisely between questions, and don’t spend too long on one.',
      name: 'timeManagement',
      desc: '',
      args: [],
    );
  }

  /// `🔍 Read Questions Carefully`
  String get readCarefully {
    return Intl.message(
      '🔍 Read Questions Carefully',
      name: 'readCarefully',
      desc: '',
      args: [],
    );
  }

  /// `Make sure you fully understand the question before answering.`
  String get understandBeforeAnswering {
    return Intl.message(
      'Make sure you fully understand the question before answering.',
      name: 'understandBeforeAnswering',
      desc: '',
      args: [],
    );
  }

  /// `😌 Stay Calm and Focused`
  String get stayCalm {
    return Intl.message(
      '😌 Stay Calm and Focused',
      name: 'stayCalm',
      desc: '',
      args: [],
    );
  }

  /// `Take deep breaths and trust your abilities!`
  String get stayConfident {
    return Intl.message(
      'Take deep breaths and trust your abilities!',
      name: 'stayConfident',
      desc: '',
      args: [],
    );
  }

  /// `Good Luck! 🍀`
  String get goodLuck {
    return Intl.message('Good Luck! 🍀', name: 'goodLuck', desc: '', args: []);
  }

  /// `Time Remaining`
  String get timeRemaining {
    return Intl.message(
      'Time Remaining',
      name: 'timeRemaining',
      desc: '',
      args: [],
    );
  }

  /// `Clear Answer Selection`
  String get clearAnswerSelection {
    return Intl.message(
      'Clear Answer Selection',
      name: 'clearAnswerSelection',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Previous`
  String get previous {
    return Intl.message('Previous', name: 'previous', desc: '', args: []);
  }

  /// `Submit & Finish`
  String get submitAndFinish {
    return Intl.message(
      'Submit & Finish',
      name: 'submitAndFinish',
      desc: '',
      args: [],
    );
  }

  /// `Quiz Navigation`
  String get quizNavigation {
    return Intl.message(
      'Quiz Navigation',
      name: 'quizNavigation',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: '', args: []);
  }

  /// `All Days`
  String get all_days {
    return Intl.message('All Days', name: 'all_days', desc: '', args: []);
  }

  /// `Saturday`
  String get saturday {
    return Intl.message('Saturday', name: 'saturday', desc: '', args: []);
  }

  /// `Sunday`
  String get sunday {
    return Intl.message('Sunday', name: 'sunday', desc: '', args: []);
  }

  /// `Monday`
  String get monday {
    return Intl.message('Monday', name: 'monday', desc: '', args: []);
  }

  /// `Tuesday`
  String get tuesday {
    return Intl.message('Tuesday', name: 'tuesday', desc: '', args: []);
  }

  /// `Wednesday`
  String get wednesday {
    return Intl.message('Wednesday', name: 'wednesday', desc: '', args: []);
  }

  /// `Thursday`
  String get thursday {
    return Intl.message('Thursday', name: 'thursday', desc: '', args: []);
  }

  /// `Days`
  String get days {
    return Intl.message('Days', name: 'days', desc: '', args: []);
  }

  /// `Subject Name`
  String get subject_name {
    return Intl.message(
      'Subject Name',
      name: 'subject_name',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message('Time', name: 'time', desc: '', args: []);
  }

  /// `Type`
  String get type {
    return Intl.message('Type', name: 'type', desc: '', args: []);
  }

  /// `Teacher`
  String get teacher {
    return Intl.message('Teacher', name: 'teacher', desc: '', args: []);
  }

  /// `Place`
  String get place {
    return Intl.message('Place', name: 'place', desc: '', args: []);
  }

  /// `status`
  String get condition {
    return Intl.message('status', name: 'condition', desc: '', args: []);
  }

  /// `Weekly Schedule`
  String get weekly_schedule {
    return Intl.message(
      'Weekly Schedule',
      name: 'weekly_schedule',
      desc: '',
      args: [],
    );
  }

  /// `📅 Welcome to the Weekly Schedule page! Select the days you want to view to easily track your lecture and practical session timings.`
  String get schedule_welcome_message {
    return Intl.message(
      '📅 Welcome to the Weekly Schedule page! Select the days you want to view to easily track your lecture and practical session timings.',
      name: 'schedule_welcome_message',
      desc: '',
      args: [],
    );
  }

  /// `👤Welcome to the profile page! 📝 Here you can review and update your personal information.`
  String get profile_welcome_message {
    return Intl.message(
      '👤Welcome to the profile page! 📝 Here you can review and update your personal information.',
      name: 'profile_welcome_message',
      desc: '',
      args: [],
    );
  }

  /// `Profile Picture`
  String get profile_picture {
    return Intl.message(
      'Profile Picture',
      name: 'profile_picture',
      desc: '',
      args: [],
    );
  }

  /// `Group`
  String get Group {
    return Intl.message('Group', name: 'Group', desc: '', args: []);
  }

  /// `Section`
  String get Section {
    return Intl.message('Section', name: 'Section', desc: '', args: []);
  }

  /// `Main information`
  String get main_info {
    return Intl.message(
      'Main information',
      name: 'main_info',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `College`
  String get college {
    return Intl.message('College', name: 'college', desc: '', args: []);
  }

  /// `Level`
  String get level {
    return Intl.message('Level', name: 'level', desc: '', args: []);
  }

  /// `Group`
  String get group {
    return Intl.message('Group', name: 'group', desc: '', args: []);
  }

  /// `Section`
  String get section {
    return Intl.message('Section', name: 'section', desc: '', args: []);
  }

  /// `Overall Grade`
  String get Overall_Grade {
    return Intl.message(
      'Overall Grade',
      name: 'Overall_Grade',
      desc: '',
      args: [],
    );
  }

  /// `Material`
  String get material {
    return Intl.message('Material', name: 'material', desc: '', args: []);
  }

  /// `🎓📚 Everything you need for your course in one place: lectures, sections, assignments, quizzes, videos, midterms, and final exams!`
  String get material_description {
    return Intl.message(
      '🎓📚 Everything you need for your course in one place: lectures, sections, assignments, quizzes, videos, midterms, and final exams!',
      name: 'material_description',
      desc: '',
      args: [],
    );
  }

  /// `complete`
  String get complete {
    return Intl.message('complete', name: 'complete', desc: '', args: []);
  }

  /// `open`
  String get open {
    return Intl.message('open', name: 'open', desc: '', args: []);
  }

  /// `download`
  String get download {
    return Intl.message('download', name: 'download', desc: '', args: []);
  }

  /// `Lectures`
  String get lectures {
    return Intl.message('Lectures', name: 'lectures', desc: '', args: []);
  }

  /// `Sections`
  String get sections {
    return Intl.message('Sections', name: 'sections', desc: '', args: []);
  }

  /// `Assignment`
  String get assignment {
    return Intl.message('Assignment', name: 'assignment', desc: '', args: []);
  }

  /// `all`
  String get all {
    return Intl.message('all', name: 'all', desc: '', args: []);
  }

  /// `هنا يمكنك استعراض جميع الإجابات المقدمة للسؤال. اقرأ آراء زملائك واقتراحاتهم!`
  String get Answers_welcome_message {
    return Intl.message(
      'هنا يمكنك استعراض جميع الإجابات المقدمة للسؤال. اقرأ آراء زملائك واقتراحاتهم!',
      name: 'Answers_welcome_message',
      desc: '',
      args: [],
    );
  }

  /// `الإجابات`
  String get Answers {
    return Intl.message('الإجابات', name: 'Answers', desc: '', args: []);
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message('Dashboard', name: 'dashboard', desc: '', args: []);
  }

  /// `News`
  String get news {
    return Intl.message('News', name: 'news', desc: '', args: []);
  }

  /// `Quizzes`
  String get quizzes {
    return Intl.message('Quizzes', name: 'quizzes', desc: '', args: []);
  }

  /// `Assignments`
  String get assignments {
    return Intl.message('Assignments', name: 'assignments', desc: '', args: []);
  }

  /// `Add News!`
  String get add_news {
    return Intl.message('Add News!', name: 'add_news', desc: '', args: []);
  }

  /// `📰 Create and manage important news and announcements for your courses easily, and keep your students updated!`
  String get create_and_manage_news {
    return Intl.message(
      '📰 Create and manage important news and announcements for your courses easily, and keep your students updated!',
      name: 'create_and_manage_news',
      desc: '',
      args: [],
    );
  }

  /// `👨‍🏫 Easily manage your courses, from students to lectures and quizzes!`
  String get course_management_center {
    return Intl.message(
      '👨‍🏫 Easily manage your courses, from students to lectures and quizzes!',
      name: 'course_management_center',
      desc: '',
      args: [],
    );
  }

  /// `Add New`
  String get add_new {
    return Intl.message('Add New', name: 'add_new', desc: '', args: []);
  }

  /// `🆕 Add a new news item to keep your students updated with all the latest news and updates`
  String get add_new_news {
    return Intl.message(
      '🆕 Add a new news item to keep your students updated with all the latest news and updates',
      name: 'add_new_news',
      desc: '',
      args: [],
    );
  }

  /// `News Title`
  String get news_title {
    return Intl.message('News Title', name: 'news_title', desc: '', args: []);
  }

  /// `Add a clear and direct title that summarizes the news accurately!`
  String get news_title_description {
    return Intl.message(
      'Add a clear and direct title that summarizes the news accurately!',
      name: 'news_title_description',
      desc: '',
      args: [],
    );
  }

  /// `News Content`
  String get news_content {
    return Intl.message(
      'News Content',
      name: 'news_content',
      desc: '',
      args: [],
    );
  }

  /// `Add the news details to clarify the information for students!`
  String get news_content_description {
    return Intl.message(
      'Add the news details to clarify the information for students!',
      name: 'news_content_description',
      desc: '',
      args: [],
    );
  }

  /// `Study Level`
  String get study_level {
    return Intl.message('Study Level', name: 'study_level', desc: '', args: []);
  }

  /// `Subject`
  String get subject {
    return Intl.message('Subject', name: 'subject', desc: '', args: []);
  }

  /// `Set Publish Time`
  String get schedule_publish_time {
    return Intl.message(
      'Set Publish Time',
      name: 'schedule_publish_time',
      desc: '',
      args: [],
    );
  }

  /// `Set a time to publish the news as a public announcement!`
  String get publish_time_description {
    return Intl.message(
      'Set a time to publish the news as a public announcement!',
      name: 'publish_time_description',
      desc: '',
      args: [],
    );
  }

  /// `Publish!`
  String get publish {
    return Intl.message('Publish!', name: 'publish', desc: '', args: []);
  }

  /// `View Registered Students`
  String get view_registered_students {
    return Intl.message(
      'View Registered Students',
      name: 'view_registered_students',
      desc: '',
      args: [],
    );
  }

  /// `View Curriculum`
  String get view_curriculum {
    return Intl.message(
      'View Curriculum',
      name: 'view_curriculum',
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
