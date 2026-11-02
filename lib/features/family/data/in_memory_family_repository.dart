import 'dart:async';

import 'package:uuid/uuid.dart';

import '../domain/family.dart';
import '../domain/family_plan.dart';
import '../domain/family_repository.dart';

/// [FamilyRepository] that keeps the families in memory, for
/// `USE_FIREBASE=false`.
final class InMemoryFamilyRepository implements FamilyRepository {
  /// Creates an empty repository drawing analytics pseudonyms from [uuid].
  InMemoryFamilyRepository({Uuid? uuid}) : _uuid = uuid ?? const Uuid();

  final Uuid _uuid;
  final List<Family> _families = <Family>[];

  /// Open watchers with the uid each one asked for, so a new family is only
  /// re-emitted to the people who belong to it.
  final Map<StreamController<List<Family>>, String> _watchers =
      <StreamController<List<Family>>, String>{};

  int _nextId = 1;

  @override
  Stream<List<Family>> watchFamilies(String uid) {
    late final StreamController<List<Family>> controller;
    controller = StreamController<List<Family>>(
      onListen: () {
        controller.add(_of(uid));
        _watchers[controller] = uid;
      },
      onCancel: () {
        _watchers.remove(controller);
      },
    );
    return controller.stream;
  }

  @override
  Future<Family> createFamily({
    required String name,
    required String ownerUid,
    required String ownerDisplayName,
  }) async {
    // El doble no guarda `members/{uid}`: ninguna pantalla los lee todavía y
    // un almacén que nadie consulta se desincroniza sin que nada avise.
    final Family family = Family(
      id: 'family-${_nextId++}',
      name: name,
      ownerUid: ownerUid,
      memberUids: List<String>.unmodifiable(<String>[ownerUid]),
      plan: FamilyPlan.beta,
      analyticsRef: _uuid.v4(),
      createdAt: DateTime.now(),
    );
    _families.add(family);
    _watchers.forEach((StreamController<List<Family>> watcher, String uid) {
      watcher.add(_of(uid));
    });
    return family;
  }

  List<Family> _of(String uid) => <Family>[
    for (final Family family in _families)
      if (family.memberUids.contains(uid)) family,
  ];
}
