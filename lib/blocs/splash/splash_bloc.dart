import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zervician/constants/app_strings.dart';
import 'package:zervician/models/user_model.dart';
import 'package:zervician/services/auth_service/auth_service.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<NavigateToHomeScreenEvent>((event, emit) async {
      emit(LoadingState());

      await Future.delayed(const Duration(seconds: 3));

      Future<String?> futureString =
          AuthService.loadValueFromPrefs(AppStrings.loggedinKey);
      String? loginId = await futureString ?? "";
      if (loginId == "user") {
        emit(AuthenticateState(
            user: UserModel(
                email: 'user@gmail.com', name: 'user', type: 'User')));
                
      } else if (loginId == "admin") {
        emit(AuthenticateState(
            user: UserModel(
                email: 'admin@gmail.com', name: 'admin', type: 'Admin')));
      } else {
        emit(UnAuthenticateState());
      }
    });
  }
}
