// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_user_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocalUserDataCollection on Isar {
  IsarCollection<LocalUserData> get localUserDatas => this.collection();
}

const LocalUserDataSchema = CollectionSchema(
  name: r'LocalUserData',
  id: -8109251254074064583,
  properties: {
    r'email': PropertySchema(
      id: 0,
      name: r'email',
      type: IsarType.string,
    ),
    r'komunitas': PropertySchema(
      id: 1,
      name: r'komunitas',
      type: IsarType.object,
      target: r'LocalKomunitas',
    ),
    r'membership': PropertySchema(
      id: 2,
      name: r'membership',
      type: IsarType.object,
      target: r'LocalWaliMembership',
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'role': PropertySchema(
      id: 4,
      name: r'role',
      type: IsarType.string,
    ),
    r'selectedRider': PropertySchema(
      id: 5,
      name: r'selectedRider',
      type: IsarType.object,
      target: r'LocalRider',
    ),
    r'token': PropertySchema(
      id: 6,
      name: r'token',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 7,
      name: r'userId',
      type: IsarType.long,
    ),
    r'wali': PropertySchema(
      id: 8,
      name: r'wali',
      type: IsarType.object,
      target: r'LocalWali',
    )
  },
  estimateSize: _localUserDataEstimateSize,
  serialize: _localUserDataSerialize,
  deserialize: _localUserDataDeserialize,
  deserializeProp: _localUserDataDeserializeProp,
  idName: r'localId',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'LocalWali': LocalWaliSchema,
    r'LocalKomunitas': LocalKomunitasSchema,
    r'LocalRider': LocalRiderSchema,
    r'LocalRiderLevel': LocalRiderLevelSchema,
    r'LocalWaliMembership': LocalWaliMembershipSchema
  },
  getId: _localUserDataGetId,
  getLinks: _localUserDataGetLinks,
  attach: _localUserDataAttach,
  version: '3.1.0+1',
);

int _localUserDataEstimateSize(
  LocalUserData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.komunitas;
    if (value != null) {
      bytesCount += 3 +
          LocalKomunitasSchema.estimateSize(
              value, allOffsets[LocalKomunitas]!, allOffsets);
    }
  }
  {
    final value = object.membership;
    if (value != null) {
      bytesCount += 3 +
          LocalWaliMembershipSchema.estimateSize(
              value, allOffsets[LocalRiderMembership]!, allOffsets);
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.role;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.selectedRider;
    if (value != null) {
      bytesCount += 3 +
          LocalRiderSchema.estimateSize(
              value, allOffsets[LocalRider]!, allOffsets);
    }
  }
  {
    final value = object.token;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.wali;
    if (value != null) {
      bytesCount += 3 +
          LocalWaliSchema.estimateSize(
              value, allOffsets[LocalWali]!, allOffsets);
    }
  }
  return bytesCount;
}

void _localUserDataSerialize(
  LocalUserData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.email);
  writer.writeObject<LocalKomunitas>(
    offsets[1],
    allOffsets,
    LocalKomunitasSchema.serialize,
    object.komunitas,
  );
  writer.writeObject<LocalRiderMembership>(
    offsets[2],
    allOffsets,
    LocalWaliMembershipSchema.serialize,
    object.membership,
  );
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.role);
  writer.writeObject<LocalRider>(
    offsets[5],
    allOffsets,
    LocalRiderSchema.serialize,
    object.selectedRider,
  );
  writer.writeString(offsets[6], object.token);
  writer.writeLong(offsets[7], object.userId);
  writer.writeObject<LocalWali>(
    offsets[8],
    allOffsets,
    LocalWaliSchema.serialize,
    object.wali,
  );
}

LocalUserData _localUserDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalUserData(
    email: reader.readStringOrNull(offsets[0]),
    komunitas: reader.readObjectOrNull<LocalKomunitas>(
      offsets[1],
      LocalKomunitasSchema.deserialize,
      allOffsets,
    ),
    localId: id,
    membership: reader.readObjectOrNull<LocalRiderMembership>(
      offsets[2],
      LocalWaliMembershipSchema.deserialize,
      allOffsets,
    ),
    name: reader.readStringOrNull(offsets[3]),
    role: reader.readStringOrNull(offsets[4]),
    selectedRider: reader.readObjectOrNull<LocalRider>(
      offsets[5],
      LocalRiderSchema.deserialize,
      allOffsets,
    ),
    token: reader.readStringOrNull(offsets[6]),
    userId: reader.readLongOrNull(offsets[7]),
    wali: reader.readObjectOrNull<LocalWali>(
      offsets[8],
      LocalWaliSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _localUserDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<LocalKomunitas>(
        offset,
        LocalKomunitasSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readObjectOrNull<LocalRiderMembership>(
        offset,
        LocalWaliMembershipSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readObjectOrNull<LocalRider>(
        offset,
        LocalRiderSchema.deserialize,
        allOffsets,
      )) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readObjectOrNull<LocalWali>(
        offset,
        LocalWaliSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _localUserDataGetId(LocalUserData object) {
  return object.localId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _localUserDataGetLinks(LocalUserData object) {
  return [];
}

void _localUserDataAttach(
    IsarCollection<dynamic> col, Id id, LocalUserData object) {
  object.localId = id;
}

extension LocalUserDataQueryWhereSort
    on QueryBuilder<LocalUserData, LocalUserData, QWhere> {
  QueryBuilder<LocalUserData, LocalUserData, QAfterWhere> anyLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocalUserDataQueryWhere
    on QueryBuilder<LocalUserData, LocalUserData, QWhereClause> {
  QueryBuilder<LocalUserData, LocalUserData, QAfterWhereClause> localIdEqualTo(
      Id localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: localId,
        upper: localId,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterWhereClause>
      localIdNotEqualTo(Id localId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: localId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: localId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: localId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: localId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterWhereClause>
      localIdGreaterThan(Id localId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: localId, includeLower: include),
      );
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterWhereClause> localIdLessThan(
      Id localId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: localId, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterWhereClause> localIdBetween(
    Id lowerLocalId,
    Id upperLocalId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerLocalId,
        includeLower: includeLower,
        upper: upperLocalId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LocalUserDataQueryFilter
    on QueryBuilder<LocalUserData, LocalUserData, QFilterCondition> {
  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      emailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      emailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      komunitasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'komunitas',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      komunitasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'komunitas',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      localIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'localId',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      localIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'localId',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      localIdEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      localIdGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      localIdLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      localIdBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      membershipIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'membership',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      membershipIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'membership',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      roleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'role',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      roleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'role',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition> roleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      roleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      roleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition> roleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'role',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      roleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      roleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      roleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition> roleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'role',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      roleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'role',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      roleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'role',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      selectedRiderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'selectedRider',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      selectedRiderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'selectedRider',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      tokenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'token',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      tokenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'token',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      tokenEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      tokenGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      tokenLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      tokenBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'token',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      tokenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      tokenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      tokenContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'token',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      tokenMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'token',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      tokenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'token',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      tokenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'token',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      userIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      userIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      userIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      userIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      waliIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wali',
      ));
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      waliIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wali',
      ));
    });
  }
}

extension LocalUserDataQueryObject
    on QueryBuilder<LocalUserData, LocalUserData, QFilterCondition> {
  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition> komunitas(
      FilterQuery<LocalKomunitas> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'komunitas');
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition> membership(
      FilterQuery<LocalRiderMembership> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'membership');
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition>
      selectedRider(FilterQuery<LocalRider> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'selectedRider');
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterFilterCondition> wali(
      FilterQuery<LocalWali> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'wali');
    });
  }
}

extension LocalUserDataQueryLinks
    on QueryBuilder<LocalUserData, LocalUserData, QFilterCondition> {}

extension LocalUserDataQuerySortBy
    on QueryBuilder<LocalUserData, LocalUserData, QSortBy> {
  QueryBuilder<LocalUserData, LocalUserData, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterSortBy> sortByRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.asc);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterSortBy> sortByRoleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.desc);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterSortBy> sortByToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'token', Sort.asc);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterSortBy> sortByTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'token', Sort.desc);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension LocalUserDataQuerySortThenBy
    on QueryBuilder<LocalUserData, LocalUserData, QSortThenBy> {
  QueryBuilder<LocalUserData, LocalUserData, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterSortBy> thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterSortBy> thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterSortBy> thenByRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.asc);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterSortBy> thenByRoleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.desc);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterSortBy> thenByToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'token', Sort.asc);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterSortBy> thenByTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'token', Sort.desc);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension LocalUserDataQueryWhereDistinct
    on QueryBuilder<LocalUserData, LocalUserData, QDistinct> {
  QueryBuilder<LocalUserData, LocalUserData, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QDistinct> distinctByRole(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'role', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QDistinct> distinctByToken(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'token', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalUserData, LocalUserData, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension LocalUserDataQueryProperty
    on QueryBuilder<LocalUserData, LocalUserData, QQueryProperty> {
  QueryBuilder<LocalUserData, int, QQueryOperations> localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<LocalUserData, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<LocalUserData, LocalKomunitas?, QQueryOperations>
      komunitasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'komunitas');
    });
  }

  QueryBuilder<LocalUserData, LocalRiderMembership?, QQueryOperations>
      membershipProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'membership');
    });
  }

  QueryBuilder<LocalUserData, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<LocalUserData, String?, QQueryOperations> roleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'role');
    });
  }

  QueryBuilder<LocalUserData, LocalRider?, QQueryOperations>
      selectedRiderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selectedRider');
    });
  }

  QueryBuilder<LocalUserData, String?, QQueryOperations> tokenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'token');
    });
  }

  QueryBuilder<LocalUserData, int?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<LocalUserData, LocalWali?, QQueryOperations> waliProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wali');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LocalWaliSchema = Schema(
  name: r'LocalWali',
  id: 3605211460056694479,
  properties: {
    r'namaMama': PropertySchema(
      id: 0,
      name: r'namaMama',
      type: IsarType.string,
    ),
    r'namaPapa': PropertySchema(
      id: 1,
      name: r'namaPapa',
      type: IsarType.string,
    ),
    r'telpMama': PropertySchema(
      id: 2,
      name: r'telpMama',
      type: IsarType.string,
    ),
    r'telpPapa': PropertySchema(
      id: 3,
      name: r'telpPapa',
      type: IsarType.string,
    )
  },
  estimateSize: _localWaliEstimateSize,
  serialize: _localWaliSerialize,
  deserialize: _localWaliDeserialize,
  deserializeProp: _localWaliDeserializeProp,
);

int _localWaliEstimateSize(
  LocalWali object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.namaMama;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.namaPapa;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.telpMama;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.telpPapa;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _localWaliSerialize(
  LocalWali object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.namaMama);
  writer.writeString(offsets[1], object.namaPapa);
  writer.writeString(offsets[2], object.telpMama);
  writer.writeString(offsets[3], object.telpPapa);
}

LocalWali _localWaliDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalWali(
    namaMama: reader.readStringOrNull(offsets[0]),
    namaPapa: reader.readStringOrNull(offsets[1]),
    telpMama: reader.readStringOrNull(offsets[2]),
    telpPapa: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _localWaliDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension LocalWaliQueryFilter
    on QueryBuilder<LocalWali, LocalWali, QFilterCondition> {
  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> namaMamaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'namaMama',
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition>
      namaMamaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'namaMama',
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> namaMamaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namaMama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> namaMamaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'namaMama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> namaMamaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'namaMama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> namaMamaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'namaMama',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> namaMamaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'namaMama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> namaMamaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'namaMama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> namaMamaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'namaMama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> namaMamaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'namaMama',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> namaMamaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namaMama',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition>
      namaMamaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'namaMama',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> namaPapaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'namaPapa',
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition>
      namaPapaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'namaPapa',
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> namaPapaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namaPapa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> namaPapaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'namaPapa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> namaPapaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'namaPapa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> namaPapaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'namaPapa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> namaPapaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'namaPapa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> namaPapaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'namaPapa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> namaPapaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'namaPapa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> namaPapaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'namaPapa',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> namaPapaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namaPapa',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition>
      namaPapaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'namaPapa',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> telpMamaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'telpMama',
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition>
      telpMamaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'telpMama',
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> telpMamaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telpMama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> telpMamaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'telpMama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> telpMamaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'telpMama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> telpMamaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'telpMama',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> telpMamaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'telpMama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> telpMamaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'telpMama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> telpMamaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'telpMama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> telpMamaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'telpMama',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> telpMamaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telpMama',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition>
      telpMamaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'telpMama',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> telpPapaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'telpPapa',
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition>
      telpPapaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'telpPapa',
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> telpPapaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telpPapa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> telpPapaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'telpPapa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> telpPapaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'telpPapa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> telpPapaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'telpPapa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> telpPapaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'telpPapa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> telpPapaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'telpPapa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> telpPapaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'telpPapa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> telpPapaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'telpPapa',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition> telpPapaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telpPapa',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalWali, LocalWali, QAfterFilterCondition>
      telpPapaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'telpPapa',
        value: '',
      ));
    });
  }
}

extension LocalWaliQueryObject
    on QueryBuilder<LocalWali, LocalWali, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LocalKomunitasSchema = Schema(
  name: r'LocalKomunitas',
  id: -233060884948937125,
  properties: {
    r'komunitasId': PropertySchema(
      id: 0,
      name: r'komunitasId',
      type: IsarType.long,
    ),
    r'logo': PropertySchema(
      id: 1,
      name: r'logo',
      type: IsarType.string,
    ),
    r'namaKomunitas': PropertySchema(
      id: 2,
      name: r'namaKomunitas',
      type: IsarType.string,
    ),
    r'warnaBg': PropertySchema(
      id: 3,
      name: r'warnaBg',
      type: IsarType.string,
    )
  },
  estimateSize: _localKomunitasEstimateSize,
  serialize: _localKomunitasSerialize,
  deserialize: _localKomunitasDeserialize,
  deserializeProp: _localKomunitasDeserializeProp,
);

int _localKomunitasEstimateSize(
  LocalKomunitas object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.logo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.namaKomunitas;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.warnaBg;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _localKomunitasSerialize(
  LocalKomunitas object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.komunitasId);
  writer.writeString(offsets[1], object.logo);
  writer.writeString(offsets[2], object.namaKomunitas);
  writer.writeString(offsets[3], object.warnaBg);
}

LocalKomunitas _localKomunitasDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalKomunitas(
    komunitasId: reader.readLongOrNull(offsets[0]),
    logo: reader.readStringOrNull(offsets[1]),
    namaKomunitas: reader.readStringOrNull(offsets[2]),
    warnaBg: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _localKomunitasDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension LocalKomunitasQueryFilter
    on QueryBuilder<LocalKomunitas, LocalKomunitas, QFilterCondition> {
  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      komunitasIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'komunitasId',
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      komunitasIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'komunitasId',
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      komunitasIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'komunitasId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      komunitasIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'komunitasId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      komunitasIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'komunitasId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      komunitasIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'komunitasId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      logoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'logo',
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      logoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'logo',
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      logoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      logoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      logoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      logoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      logoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      logoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      logoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      logoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'logo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      logoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logo',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      logoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'logo',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      namaKomunitasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'namaKomunitas',
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      namaKomunitasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'namaKomunitas',
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      namaKomunitasEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namaKomunitas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      namaKomunitasGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'namaKomunitas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      namaKomunitasLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'namaKomunitas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      namaKomunitasBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'namaKomunitas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      namaKomunitasStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'namaKomunitas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      namaKomunitasEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'namaKomunitas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      namaKomunitasContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'namaKomunitas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      namaKomunitasMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'namaKomunitas',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      namaKomunitasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namaKomunitas',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      namaKomunitasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'namaKomunitas',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      warnaBgIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'warnaBg',
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      warnaBgIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'warnaBg',
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      warnaBgEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warnaBg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      warnaBgGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'warnaBg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      warnaBgLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'warnaBg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      warnaBgBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'warnaBg',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      warnaBgStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'warnaBg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      warnaBgEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'warnaBg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      warnaBgContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'warnaBg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      warnaBgMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'warnaBg',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      warnaBgIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warnaBg',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalKomunitas, LocalKomunitas, QAfterFilterCondition>
      warnaBgIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'warnaBg',
        value: '',
      ));
    });
  }
}

extension LocalKomunitasQueryObject
    on QueryBuilder<LocalKomunitas, LocalKomunitas, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LocalRiderSchema = Schema(
  name: r'LocalRider',
  id: -958817596285782824,
  properties: {
    r'gender': PropertySchema(
      id: 0,
      name: r'gender',
      type: IsarType.long,
    ),
    r'julukan': PropertySchema(
      id: 1,
      name: r'julukan',
      type: IsarType.string,
    ),
    r'level': PropertySchema(
      id: 2,
      name: r'level',
      type: IsarType.object,
      target: r'LocalRiderLevel',
    ),
    r'namaLengkap': PropertySchema(
      id: 3,
      name: r'namaLengkap',
      type: IsarType.string,
    ),
    r'panggilan': PropertySchema(
      id: 4,
      name: r'panggilan',
      type: IsarType.string,
    ),
    r'riderId': PropertySchema(
      id: 5,
      name: r'riderId',
      type: IsarType.long,
    ),
    r'tanggalLahir': PropertySchema(
      id: 6,
      name: r'tanggalLahir',
      type: IsarType.dateTime,
    ),
    r'totalPoints': PropertySchema(
      id: 7,
      name: r'totalPoints',
      type: IsarType.long,
    )
  },
  estimateSize: _localRiderEstimateSize,
  serialize: _localRiderSerialize,
  deserialize: _localRiderDeserialize,
  deserializeProp: _localRiderDeserializeProp,
);

int _localRiderEstimateSize(
  LocalRider object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.julukan;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.level;
    if (value != null) {
      bytesCount += 3 +
          LocalRiderLevelSchema.estimateSize(
              value, allOffsets[LocalRiderLevel]!, allOffsets);
    }
  }
  {
    final value = object.namaLengkap;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.panggilan;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _localRiderSerialize(
  LocalRider object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.gender);
  writer.writeString(offsets[1], object.julukan);
  writer.writeObject<LocalRiderLevel>(
    offsets[2],
    allOffsets,
    LocalRiderLevelSchema.serialize,
    object.level,
  );
  writer.writeString(offsets[3], object.namaLengkap);
  writer.writeString(offsets[4], object.panggilan);
  writer.writeLong(offsets[5], object.riderId);
  writer.writeDateTime(offsets[6], object.tanggalLahir);
  writer.writeLong(offsets[7], object.totalPoints);
}

LocalRider _localRiderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalRider(
    gender: reader.readLongOrNull(offsets[0]),
    julukan: reader.readStringOrNull(offsets[1]),
    level: reader.readObjectOrNull<LocalRiderLevel>(
      offsets[2],
      LocalRiderLevelSchema.deserialize,
      allOffsets,
    ),
    namaLengkap: reader.readStringOrNull(offsets[3]),
    panggilan: reader.readStringOrNull(offsets[4]),
    riderId: reader.readLongOrNull(offsets[5]),
    tanggalLahir: reader.readDateTimeOrNull(offsets[6]),
    totalPoints: reader.readLongOrNull(offsets[7]),
  );
  return object;
}

P _localRiderDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<LocalRiderLevel>(
        offset,
        LocalRiderLevelSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension LocalRiderQueryFilter
    on QueryBuilder<LocalRider, LocalRider, QFilterCondition> {
  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> genderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      genderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> genderEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> genderGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gender',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> genderLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gender',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> genderBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> julukanIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'julukan',
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      julukanIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'julukan',
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> julukanEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'julukan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      julukanGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'julukan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> julukanLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'julukan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> julukanBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'julukan',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> julukanStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'julukan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> julukanEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'julukan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> julukanContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'julukan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> julukanMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'julukan',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> julukanIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'julukan',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      julukanIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'julukan',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> levelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'level',
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> levelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'level',
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      namaLengkapIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'namaLengkap',
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      namaLengkapIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'namaLengkap',
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      namaLengkapEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namaLengkap',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      namaLengkapGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'namaLengkap',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      namaLengkapLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'namaLengkap',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      namaLengkapBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'namaLengkap',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      namaLengkapStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'namaLengkap',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      namaLengkapEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'namaLengkap',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      namaLengkapContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'namaLengkap',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      namaLengkapMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'namaLengkap',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      namaLengkapIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namaLengkap',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      namaLengkapIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'namaLengkap',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      panggilanIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'panggilan',
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      panggilanIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'panggilan',
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> panggilanEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'panggilan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      panggilanGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'panggilan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> panggilanLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'panggilan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> panggilanBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'panggilan',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      panggilanStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'panggilan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> panggilanEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'panggilan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> panggilanContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'panggilan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> panggilanMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'panggilan',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      panggilanIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'panggilan',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      panggilanIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'panggilan',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> riderIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'riderId',
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      riderIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'riderId',
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> riderIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'riderId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      riderIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'riderId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> riderIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'riderId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> riderIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'riderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      tanggalLahirIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tanggalLahir',
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      tanggalLahirIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tanggalLahir',
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      tanggalLahirEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tanggalLahir',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      tanggalLahirGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tanggalLahir',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      tanggalLahirLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tanggalLahir',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      tanggalLahirBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tanggalLahir',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      totalPointsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalPoints',
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      totalPointsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalPoints',
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      totalPointsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      totalPointsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      totalPointsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition>
      totalPointsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPoints',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LocalRiderQueryObject
    on QueryBuilder<LocalRider, LocalRider, QFilterCondition> {
  QueryBuilder<LocalRider, LocalRider, QAfterFilterCondition> level(
      FilterQuery<LocalRiderLevel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'level');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LocalRiderLevelSchema = Schema(
  name: r'LocalRiderLevel',
  id: 5765718354085819690,
  properties: {
    r'icon': PropertySchema(
      id: 0,
      name: r'icon',
      type: IsarType.string,
    ),
    r'levelId': PropertySchema(
      id: 1,
      name: r'levelId',
      type: IsarType.long,
    ),
    r'maksimalPoin': PropertySchema(
      id: 2,
      name: r'maksimalPoin',
      type: IsarType.long,
    ),
    r'minimalPoin': PropertySchema(
      id: 3,
      name: r'minimalPoin',
      type: IsarType.long,
    ),
    r'nama': PropertySchema(
      id: 4,
      name: r'nama',
      type: IsarType.string,
    )
  },
  estimateSize: _localRiderLevelEstimateSize,
  serialize: _localRiderLevelSerialize,
  deserialize: _localRiderLevelDeserialize,
  deserializeProp: _localRiderLevelDeserializeProp,
);

int _localRiderLevelEstimateSize(
  LocalRiderLevel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.icon;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nama;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _localRiderLevelSerialize(
  LocalRiderLevel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.icon);
  writer.writeLong(offsets[1], object.levelId);
  writer.writeLong(offsets[2], object.maksimalPoin);
  writer.writeLong(offsets[3], object.minimalPoin);
  writer.writeString(offsets[4], object.nama);
}

LocalRiderLevel _localRiderLevelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalRiderLevel(
    icon: reader.readStringOrNull(offsets[0]),
    levelId: reader.readLongOrNull(offsets[1]),
    maksimalPoin: reader.readLongOrNull(offsets[2]),
    minimalPoin: reader.readLongOrNull(offsets[3]),
    nama: reader.readStringOrNull(offsets[4]),
  );
  return object;
}

P _localRiderLevelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension LocalRiderLevelQueryFilter
    on QueryBuilder<LocalRiderLevel, LocalRiderLevel, QFilterCondition> {
  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      iconIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'icon',
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      iconIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'icon',
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      iconEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      iconGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      iconLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      iconBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'icon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      iconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      iconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      iconContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      iconMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'icon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      iconIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'icon',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      iconIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'icon',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      levelIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'levelId',
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      levelIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'levelId',
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      levelIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'levelId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      levelIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'levelId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      levelIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'levelId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      levelIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'levelId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      maksimalPoinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maksimalPoin',
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      maksimalPoinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maksimalPoin',
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      maksimalPoinEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maksimalPoin',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      maksimalPoinGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maksimalPoin',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      maksimalPoinLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maksimalPoin',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      maksimalPoinBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maksimalPoin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      minimalPoinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minimalPoin',
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      minimalPoinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minimalPoin',
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      minimalPoinEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minimalPoin',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      minimalPoinGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minimalPoin',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      minimalPoinLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minimalPoin',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      minimalPoinBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minimalPoin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      namaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nama',
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      namaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nama',
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      namaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      namaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      namaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      namaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nama',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      namaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      namaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      namaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nama',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      namaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nama',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      namaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nama',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalRiderLevel, LocalRiderLevel, QAfterFilterCondition>
      namaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nama',
        value: '',
      ));
    });
  }
}

extension LocalRiderLevelQueryObject
    on QueryBuilder<LocalRiderLevel, LocalRiderLevel, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LocalWaliMembershipSchema = Schema(
  name: r'LocalWaliMembership',
  id: 5078473866773623100,
  properties: {
    r'harga': PropertySchema(
      id: 0,
      name: r'harga',
      type: IsarType.string,
    ),
    r'judulMember': PropertySchema(
      id: 1,
      name: r'judulMember',
      type: IsarType.string,
    ),
    r'kategoriPembayaran': PropertySchema(
      id: 2,
      name: r'kategoriPembayaran',
      type: IsarType.string,
    ),
    r'membershipId': PropertySchema(
      id: 3,
      name: r'membershipId',
      type: IsarType.long,
    ),
    r'syaratKetentuan': PropertySchema(
      id: 4,
      name: r'syaratKetentuan',
      type: IsarType.string,
    )
  },
  estimateSize: _localWaliMembershipEstimateSize,
  serialize: _localWaliMembershipSerialize,
  deserialize: _localWaliMembershipDeserialize,
  deserializeProp: _localWaliMembershipDeserializeProp,
);

int _localWaliMembershipEstimateSize(
  LocalRiderMembership object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.harga;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.judulMember;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.kategoriPembayaran;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.syaratKetentuan;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _localWaliMembershipSerialize(
  LocalRiderMembership object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.harga);
  writer.writeString(offsets[1], object.judulMember);
  writer.writeString(offsets[2], object.kategoriPembayaran);
  writer.writeLong(offsets[3], object.membershipId);
  writer.writeString(offsets[4], object.syaratKetentuan);
}

LocalRiderMembership _localWaliMembershipDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalRiderMembership(
    harga: reader.readStringOrNull(offsets[0]),
    judulMember: reader.readStringOrNull(offsets[1]),
    kategoriPembayaran: reader.readStringOrNull(offsets[2]),
    membershipId: reader.readLongOrNull(offsets[3]),
    syaratKetentuan: reader.readStringOrNull(offsets[4]),
  );
  return object;
}

P _localWaliMembershipDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension LocalWaliMembershipQueryFilter on QueryBuilder<LocalRiderMembership,
    LocalRiderMembership, QFilterCondition> {
  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> hargaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'harga',
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> hargaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'harga',
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> hargaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'harga',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> hargaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'harga',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> hargaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'harga',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> hargaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'harga',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> hargaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'harga',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> hargaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'harga',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
          QAfterFilterCondition>
      hargaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'harga',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
          QAfterFilterCondition>
      hargaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'harga',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> hargaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'harga',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> hargaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'harga',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> judulMemberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'judulMember',
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> judulMemberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'judulMember',
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> judulMemberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'judulMember',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> judulMemberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'judulMember',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> judulMemberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'judulMember',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> judulMemberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'judulMember',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> judulMemberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'judulMember',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> judulMemberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'judulMember',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
          QAfterFilterCondition>
      judulMemberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'judulMember',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
          QAfterFilterCondition>
      judulMemberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'judulMember',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> judulMemberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'judulMember',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> judulMemberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'judulMember',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> kategoriPembayaranIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'kategoriPembayaran',
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> kategoriPembayaranIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'kategoriPembayaran',
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> kategoriPembayaranEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kategoriPembayaran',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> kategoriPembayaranGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kategoriPembayaran',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> kategoriPembayaranLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kategoriPembayaran',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> kategoriPembayaranBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kategoriPembayaran',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> kategoriPembayaranStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'kategoriPembayaran',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> kategoriPembayaranEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'kategoriPembayaran',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
          QAfterFilterCondition>
      kategoriPembayaranContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'kategoriPembayaran',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
          QAfterFilterCondition>
      kategoriPembayaranMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'kategoriPembayaran',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> kategoriPembayaranIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kategoriPembayaran',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> kategoriPembayaranIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'kategoriPembayaran',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> membershipIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'membershipId',
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> membershipIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'membershipId',
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> membershipIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'membershipId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> membershipIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'membershipId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> membershipIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'membershipId',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> membershipIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'membershipId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> syaratKetentuanIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syaratKetentuan',
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> syaratKetentuanIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syaratKetentuan',
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> syaratKetentuanEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syaratKetentuan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> syaratKetentuanGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syaratKetentuan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> syaratKetentuanLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syaratKetentuan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> syaratKetentuanBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syaratKetentuan',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> syaratKetentuanStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'syaratKetentuan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> syaratKetentuanEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'syaratKetentuan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
          QAfterFilterCondition>
      syaratKetentuanContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'syaratKetentuan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
          QAfterFilterCondition>
      syaratKetentuanMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'syaratKetentuan',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> syaratKetentuanIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syaratKetentuan',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalRiderMembership, LocalRiderMembership,
      QAfterFilterCondition> syaratKetentuanIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syaratKetentuan',
        value: '',
      ));
    });
  }
}

extension LocalWaliMembershipQueryObject on QueryBuilder<LocalRiderMembership,
    LocalRiderMembership, QFilterCondition> {}
