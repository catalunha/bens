class UtmFuso2 {
  static List<String> values = [
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '?'
  ];
  static List<String> keys = [
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '?'
  ];
  static int index = 0;
  @override
  String desc() {
    return values[index];
  }
}

class UtmZone2 {
  static List<String> values = ['X', 'H', 'J', 'K', 'L', 'M', 'N', '?'];
  static List<String> keys = ['X', 'H', 'J', 'K', 'L', 'M', 'N', '?'];
  static int index = 0;
  @override
  String desc() {
    return values[index];
  }
}

class UtmPole2 {
  static List<String> values = ['N', 'S'];
  static List<String> keys = ['N', 'S'];
  static int index = 0;
  @override
  String desc() {
    return values[index];
  }
}
