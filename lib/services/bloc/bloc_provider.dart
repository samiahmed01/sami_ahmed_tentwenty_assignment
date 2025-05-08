import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/language/bloc/language_bloc.dart';
import '../../features/watch/bloc/watch_bloc.dart';

List<BlocProvider> getBlocProviders() {
  return [
    BlocProvider<LanguageBloc>(create: (context) => LanguageBloc()),
    BlocProvider<WatchBloc>(create: (context) => WatchBloc()),
  ];
}
