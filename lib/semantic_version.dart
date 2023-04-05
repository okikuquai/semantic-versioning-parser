class SemanticVersion {
  //getterはとりあえずいいや
  final int _major;
  final int _minor;
  final int _patch;

  SemanticVersion(this._major, this._minor, this._patch);

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
    return '$_major.$_minor.$_patch';
  }

  int compareTo(SemanticVersion other) {
    if (_major != other._major) {
      return _major.compareTo(other._major);
    }
    if (_minor != other._minor) {
      return _minor.compareTo(other._minor);
    }
    return _patch.compareTo(other._patch);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SemanticVersion) return false;
    return _major == other._major && _minor == other._minor && _patch == other._patch;
  }

  @override
  int get hashCode => toString().hashCode;
}
