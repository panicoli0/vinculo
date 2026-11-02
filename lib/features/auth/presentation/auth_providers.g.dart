// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The [AuthRepository]; must be overridden in bootstrap.

@ProviderFor(authRepository)
final authRepositoryProvider = AuthRepositoryProvider._();

/// The [AuthRepository]; must be overridden in bootstrap.

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  /// The [AuthRepository]; must be overridden in bootstrap.
  AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'7e6a80c7593d737e9cba46157a8155874773d926';

/// The [UserRepository]; must be overridden in bootstrap.

@ProviderFor(userRepository)
final userRepositoryProvider = UserRepositoryProvider._();

/// The [UserRepository]; must be overridden in bootstrap.

final class UserRepositoryProvider
    extends $FunctionalProvider<UserRepository, UserRepository, UserRepository>
    with $Provider<UserRepository> {
  /// The [UserRepository]; must be overridden in bootstrap.
  UserRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserRepository create(Ref ref) {
    return userRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRepository>(value),
    );
  }
}

String _$userRepositoryHash() => r'a10995d6bc58c9d210e5a2984535ddb8bd2bc462';

/// The [AccountDeletionRepository]; must be overridden in bootstrap.

@ProviderFor(accountDeletionRepository)
final accountDeletionRepositoryProvider = AccountDeletionRepositoryProvider._();

/// The [AccountDeletionRepository]; must be overridden in bootstrap.

final class AccountDeletionRepositoryProvider
    extends
        $FunctionalProvider<
          AccountDeletionRepository,
          AccountDeletionRepository,
          AccountDeletionRepository
        >
    with $Provider<AccountDeletionRepository> {
  /// The [AccountDeletionRepository]; must be overridden in bootstrap.
  AccountDeletionRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accountDeletionRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accountDeletionRepositoryHash();

  @$internal
  @override
  $ProviderElement<AccountDeletionRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AccountDeletionRepository create(Ref ref) {
    return accountDeletionRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AccountDeletionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AccountDeletionRepository>(value),
    );
  }
}

String _$accountDeletionRepositoryHash() =>
    r'58dffe01c25bebe717b25bf56fbc04a3e6454be0';

/// Whether somebody is signed in; loading until Auth reports its first state.

@ProviderFor(authSession)
final authSessionProvider = AuthSessionProvider._();

/// Whether somebody is signed in; loading until Auth reports its first state.

final class AuthSessionProvider
    extends
        $FunctionalProvider<
          AsyncValue<AuthSession>,
          AuthSession,
          Stream<AuthSession>
        >
    with $FutureModifier<AuthSession>, $StreamProvider<AuthSession> {
  /// Whether somebody is signed in; loading until Auth reports its first state.
  AuthSessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authSessionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authSessionHash();

  @$internal
  @override
  $StreamProviderElement<AuthSession> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<AuthSession> create(Ref ref) {
    return authSession(ref);
  }
}

String _$authSessionHash() => r'f96bf54429b058c7e1d0ebf0ab587907b7ac5457';

/// Uid of the signed-in account, or null when nobody is signed in (or Auth has
/// not answered yet).

@ProviderFor(currentUid)
final currentUidProvider = CurrentUidProvider._();

/// Uid of the signed-in account, or null when nobody is signed in (or Auth has
/// not answered yet).

final class CurrentUidProvider
    extends $FunctionalProvider<String?, String?, String?>
    with $Provider<String?> {
  /// Uid of the signed-in account, or null when nobody is signed in (or Auth has
  /// not answered yet).
  CurrentUidProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUidProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUidHash();

  @$internal
  @override
  $ProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String? create(Ref ref) {
    return currentUid(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$currentUidHash() => r'6e8d778ada3bff7bf82bac79d245f3fdefb3f69b';

/// The `users/{uid}` document of the signed-in account; null data means there
/// is no document yet, or nobody is signed in.
///
/// Emite un error (sin cerrar el stream) cuando no se puede saber si el
/// documento existe, p. ej. sin red y sin caché; un snapshot posterior lo
/// reemplaza.

@ProviderFor(currentUser)
final currentUserProvider = CurrentUserProvider._();

/// The `users/{uid}` document of the signed-in account; null data means there
/// is no document yet, or nobody is signed in.
///
/// Emite un error (sin cerrar el stream) cuando no se puede saber si el
/// documento existe, p. ej. sin red y sin caché; un snapshot posterior lo
/// reemplaza.

final class CurrentUserProvider
    extends
        $FunctionalProvider<AsyncValue<AppUser?>, AppUser?, Stream<AppUser?>>
    with $FutureModifier<AppUser?>, $StreamProvider<AppUser?> {
  /// The `users/{uid}` document of the signed-in account; null data means there
  /// is no document yet, or nobody is signed in.
  ///
  /// Emite un error (sin cerrar el stream) cuando no se puede saber si el
  /// documento existe, p. ej. sin red y sin caché; un snapshot posterior lo
  /// reemplaza.
  CurrentUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: _neverRetry,
        name: r'currentUserProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserHash();

  @$internal
  @override
  $StreamProviderElement<AppUser?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<AppUser?> create(Ref ref) {
    return currentUser(ref);
  }
}

String _$currentUserHash() => r'de195a598a12955d7a75421e2fbcb9ee55bdaaf8';

/// Whether the signed-in account is a minor profile.

@ProviderFor(isMinor)
final isMinorProvider = IsMinorProvider._();

/// Whether the signed-in account is a minor profile.

final class IsMinorProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Whether the signed-in account is a minor profile.
  IsMinorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isMinorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isMinorHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isMinor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isMinorHash() => r'f056db95f21057566d2d0359b7f452d000f9d51b';
