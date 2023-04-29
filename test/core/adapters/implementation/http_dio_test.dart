import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:appexample/core/adapters/implementation/http_dio.dart';

import '../../../mocks/mocks.dart';
import 'http_dio_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  group('HttpDio', () {
    late HttpDio httpDio;
    late MockDio mockDio;

    setUp(() {
      mockDio = MockDio();
      httpDio = HttpDio(mockDio);
    });

    test('get returns expected data', () async {
      final expectedData = {'key': 'value'};
      when(mockDio.get(urlValidWithoutHttp, options: anyNamed('options'))).thenAnswer((_) async => Response(
          data: expectedData, statusCode: 200, requestOptions: RequestOptions(data: jsonEncode(jsonResponseAliasDtoMock))));

      final response = await httpDio.get(urlValidWithoutHttp);

      expect(response.data, expectedData);
    });

    test('post returns expected data', () async {
      final expectedData = {'key': 'value'};
      when(mockDio.post(urlValidWithoutHttp, data: expectedData, options: anyNamed('options'))).thenAnswer((_) async => Response(
          data: expectedData, statusCode: 200, requestOptions: RequestOptions(data: jsonEncode(jsonResponseAliasDtoMock))));

      final response = await httpDio.post(urlValidWithoutHttp, data: expectedData);

      expect(response.data, expectedData);
    });

    test('put returns expected data', () async {
      final expectedData = {'key': 'value'};
      when(mockDio.put(urlValidWithoutHttp, data: expectedData, options: anyNamed('options'))).thenAnswer((_) async => Response(
          data: expectedData, statusCode: 200, requestOptions: RequestOptions(data: jsonEncode(jsonResponseAliasDtoMock))));

      final response = await httpDio.put(urlValidWithoutHttp, data: expectedData);

      expect(response.data, expectedData);
    });

    test('delete returns expected data', () async {
      final expectedData = {'key': 'value'};
      when(mockDio.delete(urlValidWithoutHttp, options: anyNamed('options'))).thenAnswer((_) async => Response(
          data: expectedData, statusCode: 200, requestOptions: RequestOptions(data: jsonEncode(jsonResponseAliasDtoMock))));

      final response = await httpDio.delete(urlValidWithoutHttp);

      expect(response.data, expectedData);
    });
  });
}
