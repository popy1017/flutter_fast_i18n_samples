
/*
 * Generated file. Do not edit.
 *
 * Locales: 2
 * Strings: 6 (3.0 per locale)
 *
 * Built on 2021-12-28 at 23:29 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
	en, // 'en' (base locale, fallback)
	ja, // 'ja'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_I18nEn _t = _currLocale.translations;
_I18nEn get t => _t;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _I18nEn of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	/// Hint for pre 4.x.x developers: You can access the raw string via LocaleSettings.useDeviceLocale().languageTag
	static AppLocale useDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance?.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			return setLocaleRaw(deviceLocale);
		} else {
			return setLocale(_baseLocale);
		}
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		if (WidgetsBinding.instance != null) {
			// force rebuild if TranslationProvider is used
			_translationProviderKey.currentState?.setLocale(_currLocale);
		}

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String localeRaw) {
		final selected = _selectLocale(localeRaw);
		return setLocale(selected ?? _baseLocale);
	}

	/// Gets current locale.
	/// Hint for pre 4.x.x developers: You can access the raw string via LocaleSettings.currentLocale.languageTag
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	/// Hint for pre 4.x.x developers: You can access the raw string via LocaleSettings.baseLocale.languageTag
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}

}

// context enums

// interfaces generated as mixins

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {
	_I18nEn get translations {
		switch (this) {
			case AppLocale.en: return _I18nEn._instance;
			case AppLocale.ja: return _I18nJa._instance;
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.ja: return 'ja';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.ja: return const Locale.fromSubtags(languageCode: 'ja');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'ja': return AppLocale.ja;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _I18nEn translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

class _I18nEn {
	_I18nEn._(); // no constructor

	static final _I18nEn _instance = _I18nEn._();

	_I18nPage1En get page1 => _I18nPage1En._instance;
	_I18nPage2En get page2 => _I18nPage2En._instance;
	_I18nHomeEn get home => _I18nHomeEn._instance;

	/// A flat map containing all translations.
	dynamic operator[](String key) => _translationMapEn[key];
}

class _I18nPage1En {
	_I18nPage1En._(); // no constructor

	static final _I18nPage1En _instance = _I18nPage1En._();

	String get greeting => 'hello';
}

class _I18nPage2En {
	_I18nPage2En._(); // no constructor

	static final _I18nPage2En _instance = _I18nPage2En._();

	String get greeting => 'hello';
}

class _I18nHomeEn {
	_I18nHomeEn._(); // no constructor

	static final _I18nHomeEn _instance = _I18nHomeEn._();

	String get greeting => 'hello';
}

class _I18nJa implements _I18nEn {
	_I18nJa._(); // no constructor

	static final _I18nJa _instance = _I18nJa._();

	@override _I18nPage1Ja get page1 => _I18nPage1Ja._instance;
	@override _I18nPage2Ja get page2 => _I18nPage2Ja._instance;
	@override _I18nHomeJa get home => _I18nHomeJa._instance;

	/// A flat map containing all translations.
	@override dynamic operator[](String key) => _translationMapJa[key];
}

class _I18nPage1Ja implements _I18nPage1En {
	_I18nPage1Ja._(); // no constructor

	static final _I18nPage1Ja _instance = _I18nPage1Ja._();

	@override String get greeting => 'こんにちは';
}

class _I18nPage2Ja implements _I18nPage2En {
	_I18nPage2Ja._(); // no constructor

	static final _I18nPage2Ja _instance = _I18nPage2Ja._();

	@override String get greeting => 'こんにちは';
}

class _I18nHomeJa implements _I18nHomeEn {
	_I18nHomeJa._(); // no constructor

	static final _I18nHomeJa _instance = _I18nHomeJa._();

	@override String get greeting => 'こんにちは';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

late final Map<String, dynamic> _translationMapEn = {
	'page1.greeting': 'hello',
	'page2.greeting': 'hello',
	'home.greeting': 'hello',
};

late final Map<String, dynamic> _translationMapJa = {
	'page1.greeting': 'こんにちは',
	'page2.greeting': 'こんにちは',
	'home.greeting': 'こんにちは',
};
