import 'package:equatable/equatable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'initialization_state.g.dart';

enum AuthenticationState {
  initial,
  loading,
  authenicated,
  unauthenicated,
  error
}

// enum ConfigurationState { initial, loading, done, error }

@CopyWith()
class InitializationState extends Equatable {
  const InitializationState({
    this.authenticationState = AuthenticationState.initial,
  });

  final AuthenticationState authenticationState;

  @override
  List<Object?> get props => [
        authenticationState,
      ];
}
