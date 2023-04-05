//Semantic Versioning Parser
//Author: Yuki Kikuchi
import './semantic_version.dart';

void main(List<String> arguments) {
  final versions = arguments
      .map((e) => SemanticVersion.tryParse(e))
      .whereType<SemanticVersion>()
      .toList();
  //sortは値を並べ替えるだけで値は返さない
  versions.sort((a, b) => b.compareTo(a));
  versions.forEach(print);
}
