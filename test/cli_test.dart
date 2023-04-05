import 'package:parameterized_test/parameterized_test.dart';
import 'package:semantic_versioning_parser/semantic_version.dart';
import 'package:test/expect.dart';

void main() {
  final exceptedExactCase = [
    SemanticVersion(11, 2, 4),
    SemanticVersion(1, 2, 4),
    SemanticVersion(3, 4, 5)
  ];
  parameterizedTest(
    'Semantic Versioning class test. Success Case',
    ParameterizedSource.csv([
      '11.2.4, 1.2.4, 3.4.5',
    ]),
    (List<dynamic> values) {
      final actual = values
          .map((e) => SemanticVersion.tryParse(e))
          .whereType<SemanticVersion>()
          .toList();
      expect(actual, exceptedExactCase);
    },
  );

  parameterizedTest(
    'Semantic Versioning class test. Fail Case',
    ParameterizedSource.csv([
      'aaa, q.2.3, 3.rt.5, 1.4.a',
    ]),
    (List<dynamic> values) {
      final actual = values
          .map((e) => SemanticVersion.tryParse(e))
          .whereType<SemanticVersion>()
          .toList();
      equals(actual.isEmpty);
    },
  );
}
