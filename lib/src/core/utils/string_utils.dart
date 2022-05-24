class StringUtils {
  static String getExtension(String path) {
    return path.split('.').last;
  }

  static String getLastSlices(String path, String char, int n) {
    int i = 0;
    final slices =  path.split('/');
    return slices.reversed.fold('', (prev, curr) {
      if (i <= n) {
        i++;
        return '$curr${i==1?'':char}$prev';
      }
      return prev;
    });
  }
}