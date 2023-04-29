import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:appexample/features/favorites/domain/entities/reponsealias_dto.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('ResponseAliasDTO constructor should set values correctly', () {
    final links = Links(urlValidWithoutHttp, 'localhost:3000/123123');
    final responseAliasDTO = ResponseAliasDTO(urlValidWithoutHttp, links);

    expect(responseAliasDTO.alias, urlValidWithoutHttp);
    expect(responseAliasDTO.links.self, links.self);
    expect(responseAliasDTO.links.short, links.short);
  });

  test('ResponseAliasDTO fromJson should parse JSON correctly', () {
    final json = jsonDecode(jsonResponseAliasDtoMock);
    final responseAliasDTO = ResponseAliasDTO.fromJson(json);

    expect(responseAliasDTO.alias, json['alias']);
    expect(responseAliasDTO.links.self, json['_links']['self']);
    expect(responseAliasDTO.links.short, json['_links']['short']);
  });

  test('ResponseAliasDTO toJson should serialize correctly', () {
    final links = Links(urlValidWithoutHttp, 'localhost:3000/123123');
    final responseAliasDTO = ResponseAliasDTO(urlValidWithoutHttp, links);
    final json = responseAliasDTO.toJson();

    expect(json['alias'], urlValidWithoutHttp);
    expect(json['_links']['self'], links.self);
    expect(json['_links']['short'], links.short);
  });

  test('ResponseAliasDTO should return object if json send correctly', () {
    final obj = ResponseAliasDTO.fromJson(jsonDecode(jsonResponseAliasDtoMock));
    expect(obj, isInstanceOf<ResponseAliasDTO>());
  });

  test('ResponseAliasDTO fromJson should throw exception with invalid JSON', () {
    expect(() => ResponseAliasDTO.fromJson(jsonDecode(jsonEmptyMock)), throwsFormatException);
  });
}
