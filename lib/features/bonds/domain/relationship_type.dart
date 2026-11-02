/// Relationship between the two people of a bond.
enum RelationshipType {
  /// Grandparent and grandchild.
  grandparentGrandchild,

  /// Parent and child.
  parentChild,

  /// Siblings.
  siblings,

  /// Aunt or uncle and niece or nephew.
  auntUncleNieceNephew,
}
