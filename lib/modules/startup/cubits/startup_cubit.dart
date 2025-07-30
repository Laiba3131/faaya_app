import 'package:oxyn_dev/modules/startup/cubits/startup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartupCubit extends Cubit<StartupState> {
  StartupCubit() : super(StartupState.initial());

  void init() async {
    emit(state.copyWith(status: Status.none));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(status: Status.success, showButton: true));
  }
}
