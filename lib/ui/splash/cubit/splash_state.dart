import 'package:equatable/equatable.dart';

enum SplashStatus {
  initial,
  loading,
  failure,
  success,
}

class SplashState extends Equatable {
  const SplashState({
    required this.status,
    this.stateMessage,
  });

  final SplashStatus status;
  final String? stateMessage;

  @override
  List<Object?> get props => [stateMessage];

  SplashState copyWith({SplashStatus? status, String? stateMessage}) {
    return SplashState(
      status: status ?? this.status,
      stateMessage: stateMessage ?? this.stateMessage,
    );
  }
}
