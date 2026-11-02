/// Plan a family is on (data_model §3).
///
/// Un solo valor en la beta; existe como enum, y no como la constante
/// `'beta'`, para que agregar un plan rompa los `switch` en vez de pasar
/// desapercibido.
enum FamilyPlan {
  /// The only plan of the beta: no seat limit and no billing.
  beta,
}
