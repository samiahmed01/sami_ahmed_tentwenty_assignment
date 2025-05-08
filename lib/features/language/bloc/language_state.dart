part of 'language_bloc.dart';

//ignore: must_be_immutable
class LanguageState extends Equatable {
  LanguageState({
    Language? selectedLanguage,
  });

  Language selectedLanguage = Language.english;

  @override
  List<Object> get props => [selectedLanguage];

  LanguageState copyWith({Language? selectedLanguage}) {
    return LanguageState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}