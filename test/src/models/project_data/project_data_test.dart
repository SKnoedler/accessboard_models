import 'package:accessboard_models/accessboard_models.dart';
import 'package:accessboard_models/src/models/switch/state_target_group.dart';
import 'package:test/test.dart';

void main() {
  final expectedobject = ProjectData(
    popUpAdIds: [
      ItemTargetGroupIds(
        itemId: '23',
        targetGroupIds: ['1', '2'],
      ),
      ItemTargetGroupIds(
        itemId: '223',
        targetGroupIds: ['1', '2'],
      ),
    ],
    bannerAdIds: [
      PlaceholderIdMatcher(
        itemId: '23',
        targetGroupIds: ['1', '2'],
        placeholderId: 1,
      ),
    ],
    blogPostIds: [
      ItemTargetGroupIds(
        itemId: '23',
        targetGroupIds: ['1'],
      ),
      ItemTargetGroupIds(
        itemId: '23',
        targetGroupIds: ['1'],
      ),
      ItemTargetGroupIds(
        itemId: '23',
        targetGroupIds: ['1'],
      ),
    ],
    feedbackItemIds: [
      PlaceholderIdMatcher(itemId: '23', placeholderId: 1),
      PlaceholderIdMatcher(itemId: '23', placeholderId: 1),
    ],
    termsId: ItemTargetGroupIds(
      itemId: '23243',
      targetGroupIds: ['1', '432'],
    ),
    switches: [
      WidgetSwitch(
        placeholderId: 1,
        stateTargetGroups: [
          StateTargetGroup(
            isActive: true,
            targetGroup: TargetGroup(
              id: '23',
              name: 'name23',
            ),
          ),
          StateTargetGroup(
            isActive: false,
            targetGroup: TargetGroup(
              id: '23',
              name: 'name23',
            ),
          ),
        ],
      ),
    ],
  );

  final expectedJson = {
    "bannerAdIds": [
      {
        "placeholderId": 1,
        "itemId": "23",
        "targetGroupIds": ["1", "2"]
      }
    ],
    "termsId": {
      "itemId": "23243",
      "targetGroupIds": ["1", "432"]
    },
    "popUpAdIds": [
      {
        "itemId": "23",
        "targetGroupIds": ["1", "2"]
      },
      {
        "itemId": "223",
        "targetGroupIds": ["1", "2"]
      }
    ],
    "blogPostIds": [
      {
        "itemId": "23",
        "targetGroupIds": ["1"]
      },
      {
        "itemId": "23",
        "targetGroupIds": ["1"]
      },
      {
        "itemId": "23",
        "targetGroupIds": ["1"]
      }
    ],
    "feedbackItemIds": [
      {"placeholderId": 1, "itemId": "23", "targetGroupIds": null},
      {"placeholderId": 1, "itemId": "23", "targetGroupIds": null}
    ],
    "switches": [
      {
        "placeholderId": 1,
        "stateTargetGroups": [
          {
            "isActive": true,
            "targetGroup": {"id": "23", "name": "name23"}
          },
          {
            "isActive": false,
            "targetGroup": {"id": "23", "name": "name23"}
          }
        ]
      }
    ]
  };

  test('toJson() converts a List<FaqItem> to a List<Map<String, dynamic>>', () {
    final result = expectedobject.toJson();
    expect(result, expectedJson);
  });

  test(
    'fromJson() converts a List<Map<String, dynamic>> to a List<FaqItem>',
    () {
      final result = ProjectData.fromJson(expectedJson);

      expect(result, expectedobject);
    },
  );
}
