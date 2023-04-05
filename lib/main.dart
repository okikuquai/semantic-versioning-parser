//Semantic Versioning Parser
//Author: Yuki Kikuchi

void main(List<String> arguments) {
  final versions = arguments
      .map((e) => SemanticVersion.tryParse(e))
      .whereType<SemanticVersion>()
      .toList();
  //sortは値を並べ替えるだけなので値は返さない
  versions.sort((a, b) => b.compareTo(a));
  versions.forEach(print);

}

class SemanticVersion {
  final int major;
  final int minor;
  final int patch;

  SemanticVersion(this.major, this.minor, this.patch);

  static SemanticVersion? tryParse(String version) {
    final parts = version.split('.');
    if (parts.length != 3) return null;

    final major = int.tryParse(parts[0]);
    final minor = int.tryParse(parts[1]);
    final patch = int.tryParse(parts[2]);
    if (major != null && minor != null && patch != null) {
      return SemanticVersion(major, minor, patch);
    }
    return null;
  }

  @override
  String toString() {
    return '$major.$minor.$patch';
  }

  int compareTo(SemanticVersion other) {
    if (major != other.major) {
      return major.compareTo(other.major);
    }
    if (minor != other.minor) {
      return minor.compareTo(other.minor);
    }
    return patch.compareTo(other.patch);
  }
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SemanticVersion) return false;
    return major == other.major && minor == other.minor && patch == other.patch;
  }

  @override
  int get hashCode => toString().hashCode;
}
