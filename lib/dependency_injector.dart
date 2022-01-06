import 'package:foody_yo/presentation/blocs/signupbloc/sign_up_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  //sl.registerLazySingleton<SignUpBloc>(() => SignUpBloc());
  sl.registerSingleton<SignUpBloc>(SignUpBloc());
}
