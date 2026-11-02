import 'package:freezed_annotation/freezed_annotation.dart';

import '../../family/domain/joined_via.dart';

part 'joined_via_info.freezed.dart';

/// How a person entered the family, kept to measure H1.
///
/// Ausente en `users/{uid}` significa que la persona creó su propia familia.
@freezed
abstract class JoinedViaInfo with _$JoinedViaInfo {
  /// Creates the record.
  const factory JoinedViaInfo({
    /// Whether an adult invite or a minor code was used.
    required JoinedVia kind,

    /// Pseudonymous random id of the invite (`invites.analyticsRef`).
    required String inviteRef,

    /// Instant the invite was created.
    required DateTime inviteCreatedAt,

    /// Instant the invite was redeemed.
    required DateTime at,
  }) = _JoinedViaInfo;
}
