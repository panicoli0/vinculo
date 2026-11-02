/// Role a person holds inside a family (data_model §3).
enum MemberRole {
  /// Created the family; the only role the client writes by itself.
  owner,

  /// Adult who joined through an invite.
  adult,

  /// Minor profile created by a guardian.
  minor,
}
