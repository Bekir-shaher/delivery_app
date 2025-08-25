import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'lang_state.dart';

class LangCubit extends Cubit<LangState> {
  LangCubit() : super(const LangState(Locale('en'), 2));
  static const _keyLocale = 'app_locale';

  Future<void> load() async {
    final sp = await SharedPreferences.getInstance();
    final code = sp.getString(_keyLocale) ?? 'en';
    emit(LangState(Locale(code), code == 'ar' ? 1 : 2));
  }

  Future<void> setLang(String code) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_keyLocale, code);
    emit(LangState(Locale(code), code == 'ar' ? 1 : 2));
  }
}
