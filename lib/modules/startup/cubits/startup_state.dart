import 'package:equatable/equatable.dart';

enum Status { none, loading, success }

class StartupState extends Equatable {
  final Status status;
  final bool showButton;

  const StartupState({required this.status, required this.showButton});

  factory StartupState.initial() {
    return const StartupState(status: Status.none, showButton: false);
  }

  StartupState copyWith({Status? status, bool? showButton}) {
    return StartupState(
      status: status ?? this.status,
      showButton: showButton ?? this.showButton,
    );
  }

  @override
  List<Object> get props => [status, showButton];
}
