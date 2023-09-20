import 'package:accessboard_models/models/access_right/access_right.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Base Class', () {
    test('check if it is base class', () {
      final NotAuthenticated notAuthenticated = NotAuthenticated();
      expect(notAuthenticated, isA<AccessRightBase>());
    });
  });

  group('NotAuthenticated', () {
    test('fromJson', () {
      final json = {
        'state': 'notAuthenticated',
      };
      final accessRight = NotAuthenticated.fromJson(json);
      expect(accessRight.state, AccessRightState.notAuthenticated);
    });

    test('toJson', () {
      final accessRight = NotAuthenticated();
      final json = accessRight.toJson();
      expect(json['state'], 'notAuthenticated');
    });
  });
}
