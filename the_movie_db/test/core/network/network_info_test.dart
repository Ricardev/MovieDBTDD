// @dart=2.9

import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/core/network/network_info.dart';
import 'package:mockito/mockito.dart';

class MockConnectivity extends Mock implements Connectivity {}

void main() {
  NetworkInfo networkInfo;
  MockConnectivity connectivity;
  setUp(() {
    connectivity = MockConnectivity();
    networkInfo = NetworkInfo();
  });

  group('is connected', () {
    final mockWifi = ConnectivityResult.wifi;
    test('should succeed', () async {
      when(connectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);
      final result = await connectivity.checkConnectivity();
      verify(connectivity.checkConnectivity());
      expect(result, ConnectivityResult.wifi);
    });
  });
}
