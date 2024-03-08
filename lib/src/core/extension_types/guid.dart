import 'package:uuid/uuid.dart';

const _emptyGuid = '00000000-0000-0000-0000-000000000000';

extension type Guid._(String id) implements String {
  //No assert eu quero que ele valide se o Id é válido, caso não for válido tem que retornar a mensagem: Guid inválido.
  Guid([String? id])
      : id = id ?? Guid.random(),
        assert(
          id == null || Uuid.isValidUUID(fromString: id),
          'Invalid Guid',
        );

  Guid.empty() : this(_emptyGuid);
  Guid.random() : this(const Uuid().v4());

  bool get isEmpty => id == _emptyGuid;
  bool get isNotEmpty => id != _emptyGuid;
}
