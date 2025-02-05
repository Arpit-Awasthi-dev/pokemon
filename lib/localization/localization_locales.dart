import 'package:get/get.dart';

import 'locale_en.dart';

class LocalizationLocales extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        LocaleEN().locale: LocaleEN().mapEN,
      };
}
