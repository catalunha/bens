enum UtmFuso {
  fuso18('18'),
  fuso19('19'),
  fuso20('20'),
  fuso21('21'),
  fuso22('22'),
  fuso23('23'),
  fuso24('24'),
  fuso25('25');

  final String desc;
  const UtmFuso(this.desc);
  // String get name {
  //   switch (this) {
  //     case UtmFuso.fuso18:
  //       return '18';
  //     case UtmFuso.fuso19:
  //       return '19';
  //     case UtmFuso.fuso20:
  //       return '20';
  //     case UtmFuso.fuso21:
  //       return '21';
  //     case UtmFuso.fuso22:
  //       return '22';
  //     case UtmFuso.fuso23:
  //       return '23';
  //     case UtmFuso.fuso24:
  //       return '24';
  //     case UtmFuso.fuso25:
  //       return '25';
  //   }
  // }
}

enum UtmZona {
  zonaX('X'),
  zonaH('H'),
  zonaJ('J'),
  zonaK('K'),
  zonaL('L'),
  zonaM('M'),
  zonaN('N');

  final String desc;
  const UtmZona(this.desc);
  // String get name {
  //   switch (this) {
  //     case UtmZona.zonaX:
  //       return '?';
  //     case UtmZona.zonaH:
  //       return 'N';
  //     case UtmZona.zonaJ:
  //       return 'S';
  //     case UtmZona.zonaK:
  //       return 'K';

  //     case UtmZona.zonaL:
  //       return 'L';

  //     case UtmZona.zonaM:
  //       return 'M';

  //     case UtmZona.zonaN:
  //       return 'N';
  //   }
  // }
}

enum UtmPole {
  norte('N'),
  sul('S');

  final String desc;
  const UtmPole(this.desc);
  // String get name {
  //   switch (this) {
  //     case UtmPole.norte:
  //       return 'N';
  //     case UtmPole.sul:
  //       return 'S';
  //   }
  // }
}

// class Utm {
//   String desc() {
//     return '...';
//   }
// }

// class UtmPole2 extends Utm {
//   static List<String> values = ['Norte', 'Sul'];
//   static List<String> keys = ['N', 'S'];
//   static int index = 0;
//   @override
//   String desc() {
//     return values[index];
//   }
// }
