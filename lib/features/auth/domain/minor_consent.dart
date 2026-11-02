import 'package:freezed_annotation/freezed_annotation.dart';

import '../../family/domain/consent_status.dart';
import '../../family/domain/parental_verification_method.dart';

part 'minor_consent.freezed.dart';

/// Parental consent recorded on a minor's `users/{uid}` document.
///
/// Solo la escribe una Function; el cliente no la crea nunca (data_model §2).
@freezed
abstract class MinorConsent with _$MinorConsent {
  /// Creates a consent record.
  const factory MinorConsent({
    /// Whether consent was required and granted.
    required ConsentStatus status,

    /// Uid of the guardian who gave the consent.
    required String guardianUid,

    /// How the guardian was verified.
    required ParentalVerificationMethod method,

    /// Version of the privacy notice the guardian saw.
    required String noticeVersion,

    /// Instant the consent was recorded.
    required DateTime at,
  }) = _MinorConsent;
}
