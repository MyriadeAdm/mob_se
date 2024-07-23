// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historique.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHistoriqueCollection on Isar {
  IsarCollection<Historique> get historiques => this.collection();
}

const HistoriqueSchema = CollectionSchema(
  name: r'Historique',
  id: 2041168991628856807,
  properties: {
    r'dateTime': PropertySchema(
      id: 0,
      name: r'dateTime',
      type: IsarType.dateTime,
    ),
    r'detailsForfait': PropertySchema(
      id: 1,
      name: r'detailsForfait',
      type: IsarType.string,
    ),
    r'typeForfait': PropertySchema(
      id: 2,
      name: r'typeForfait',
      type: IsarType.string,
    )
  },
  estimateSize: _historiqueEstimateSize,
  serialize: _historiqueSerialize,
  deserialize: _historiqueDeserialize,
  deserializeProp: _historiqueDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _historiqueGetId,
  getLinks: _historiqueGetLinks,
  attach: _historiqueAttach,
  version: '3.1.0+1',
);

int _historiqueEstimateSize(
  Historique object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.detailsForfait;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.typeForfait;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _historiqueSerialize(
  Historique object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dateTime);
  writer.writeString(offsets[1], object.detailsForfait);
  writer.writeString(offsets[2], object.typeForfait);
}

Historique _historiqueDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Historique(
    reader.readStringOrNull(offsets[2]),
    reader.readStringOrNull(offsets[1]),
  );
  object.dateTime = reader.readDateTime(offsets[0]);
  object.id = id;
  return object;
}

P _historiqueDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _historiqueGetId(Historique object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _historiqueGetLinks(Historique object) {
  return [];
}

void _historiqueAttach(IsarCollection<dynamic> col, Id id, Historique object) {
  object.id = id;
}

extension HistoriqueQueryWhereSort
    on QueryBuilder<Historique, Historique, QWhere> {
  QueryBuilder<Historique, Historique, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HistoriqueQueryWhere
    on QueryBuilder<Historique, Historique, QWhereClause> {
  QueryBuilder<Historique, Historique, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Historique, Historique, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Historique, Historique, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Historique, Historique, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension HistoriqueQueryFilter
    on QueryBuilder<Historique, Historique, QFilterCondition> {
  QueryBuilder<Historique, Historique, QAfterFilterCondition> dateTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      dateTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition> dateTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition> dateTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      detailsForfaitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'detailsForfait',
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      detailsForfaitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'detailsForfait',
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      detailsForfaitEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailsForfait',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      detailsForfaitGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'detailsForfait',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      detailsForfaitLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'detailsForfait',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      detailsForfaitBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'detailsForfait',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      detailsForfaitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'detailsForfait',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      detailsForfaitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'detailsForfait',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      detailsForfaitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'detailsForfait',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      detailsForfaitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'detailsForfait',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      detailsForfaitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailsForfait',
        value: '',
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      detailsForfaitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'detailsForfait',
        value: '',
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      typeForfaitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'typeForfait',
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      typeForfaitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'typeForfait',
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      typeForfaitEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typeForfait',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      typeForfaitGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'typeForfait',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      typeForfaitLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'typeForfait',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      typeForfaitBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'typeForfait',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      typeForfaitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'typeForfait',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      typeForfaitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'typeForfait',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      typeForfaitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'typeForfait',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      typeForfaitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'typeForfait',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      typeForfaitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typeForfait',
        value: '',
      ));
    });
  }

  QueryBuilder<Historique, Historique, QAfterFilterCondition>
      typeForfaitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'typeForfait',
        value: '',
      ));
    });
  }
}

extension HistoriqueQueryObject
    on QueryBuilder<Historique, Historique, QFilterCondition> {}

extension HistoriqueQueryLinks
    on QueryBuilder<Historique, Historique, QFilterCondition> {}

extension HistoriqueQuerySortBy
    on QueryBuilder<Historique, Historique, QSortBy> {
  QueryBuilder<Historique, Historique, QAfterSortBy> sortByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<Historique, Historique, QAfterSortBy> sortByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<Historique, Historique, QAfterSortBy> sortByDetailsForfait() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailsForfait', Sort.asc);
    });
  }

  QueryBuilder<Historique, Historique, QAfterSortBy>
      sortByDetailsForfaitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailsForfait', Sort.desc);
    });
  }

  QueryBuilder<Historique, Historique, QAfterSortBy> sortByTypeForfait() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeForfait', Sort.asc);
    });
  }

  QueryBuilder<Historique, Historique, QAfterSortBy> sortByTypeForfaitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeForfait', Sort.desc);
    });
  }
}

extension HistoriqueQuerySortThenBy
    on QueryBuilder<Historique, Historique, QSortThenBy> {
  QueryBuilder<Historique, Historique, QAfterSortBy> thenByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<Historique, Historique, QAfterSortBy> thenByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<Historique, Historique, QAfterSortBy> thenByDetailsForfait() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailsForfait', Sort.asc);
    });
  }

  QueryBuilder<Historique, Historique, QAfterSortBy>
      thenByDetailsForfaitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailsForfait', Sort.desc);
    });
  }

  QueryBuilder<Historique, Historique, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Historique, Historique, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Historique, Historique, QAfterSortBy> thenByTypeForfait() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeForfait', Sort.asc);
    });
  }

  QueryBuilder<Historique, Historique, QAfterSortBy> thenByTypeForfaitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeForfait', Sort.desc);
    });
  }
}

extension HistoriqueQueryWhereDistinct
    on QueryBuilder<Historique, Historique, QDistinct> {
  QueryBuilder<Historique, Historique, QDistinct> distinctByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateTime');
    });
  }

  QueryBuilder<Historique, Historique, QDistinct> distinctByDetailsForfait(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detailsForfait',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Historique, Historique, QDistinct> distinctByTypeForfait(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'typeForfait', caseSensitive: caseSensitive);
    });
  }
}

extension HistoriqueQueryProperty
    on QueryBuilder<Historique, Historique, QQueryProperty> {
  QueryBuilder<Historique, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Historique, DateTime, QQueryOperations> dateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateTime');
    });
  }

  QueryBuilder<Historique, String?, QQueryOperations> detailsForfaitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detailsForfait');
    });
  }

  QueryBuilder<Historique, String?, QQueryOperations> typeForfaitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'typeForfait');
    });
  }
}
