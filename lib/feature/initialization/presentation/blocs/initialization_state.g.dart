// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initialization_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InitializationStateCWProxy {
  InitializationState authenticationState(
      AuthenticationState authenticationState);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InitializationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InitializationState(...).copyWith(id: 12, name: "My name")
  /// ````
  InitializationState call({
    AuthenticationState? authenticationState,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInitializationState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInitializationState.copyWith.fieldName(...)`
class _$InitializationStateCWProxyImpl implements _$InitializationStateCWProxy {
  final InitializationState _value;

  const _$InitializationStateCWProxyImpl(this._value);

  @override
  InitializationState authenticationState(
          AuthenticationState authenticationState) =>
      this(authenticationState: authenticationState);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InitializationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InitializationState(...).copyWith(id: 12, name: "My name")
  /// ````
  InitializationState call({
    Object? authenticationState = const $CopyWithPlaceholder(),
  }) {
    return InitializationState(
      authenticationState:
          authenticationState == const $CopyWithPlaceholder() ||
                  authenticationState == null
              ? _value.authenticationState
              // ignore: cast_nullable_to_non_nullable
              : authenticationState as AuthenticationState,
    );
  }
}

extension $InitializationStateCopyWith on InitializationState {
  /// Returns a callable class that can be used as follows: `instanceOfInitializationState.copyWith(...)` or like so:`instanceOfInitializationState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InitializationStateCWProxy get copyWith =>
      _$InitializationStateCWProxyImpl(this);
}
