/// How a member entered the family.
enum JoinedVia {
  /// Created the family.
  owner,

  /// Accepted an adult invite.
  invite,

  /// Redeemed a minor code.
  minorCode,
}
