class ShopData {
  final String id;
  final String name;
  final String grade;
  final String award;
  final String location;
  final String description;
  final String legendaryDish;
  final String imagePath;
  final double latitude;
  final double longitude;

  const ShopData({
    required this.id,
    required this.name,
    required this.grade,
    required this.award,
    required this.location,
    required this.description,
    required this.legendaryDish,
    required this.imagePath,
    required this.latitude,
    required this.longitude,
  });
}

class StatData {
  final String number;
  final String label;
  final String sublabel;

  const StatData({
    required this.number,
    required this.label,
    required this.sublabel,
  });
}

class GravyData {
  final String name;
  final String description;
  final String imagePath;

  const GravyData({
    required this.name,
    required this.description,
    required this.imagePath,
  });
}

class UserPhoto {
  final String username;
  final String shopName;
  final String imagePath;
  final String timeAgo;

  const UserPhoto({
    required this.username,
    required this.shopName,
    required this.imagePath,
    required this.timeAgo,
  });
}

class HomeData {
  HomeData._();

  // Dean's List - Featured shops
  static const List<ShopData> deansList = [
    ShopData(
      id: '1',
      name: 'Nasi Kandar Line Clear',
      grade: 'S',
      award: 'Best Kuah Campur Ratio',
      location: 'Pulau Pinang',
      description:
          'Since 1930. The kuah here achieves the impossible — each ladle perfectly balanced. The fish curry and bendi combination is a diploma in itself.',
      legendaryDish: 'Fish Curry + Bendi',
      imagePath: 'assets/images/shops/line_clear.jpg',
      latitude: 5.4141,
      longitude: 100.3288,
    ),
    ShopData(
      id: '2',
      name: 'Nasi Kandar Beratur',
      grade: 'S',
      award: 'Most Haunting Fish Curry',
      location: 'Pulau Pinang',
      description:
          'The queue forms before Maghrib. By Isyak, they\'re sold out. The fish curry here visits you in dreams for days after.',
      legendaryDish: 'Ikan Kari Kepala',
      imagePath: 'assets/images/shops/beratur.jpg',
      latitude: 5.4136,
      longitude: 100.3294,
    ),
    ShopData(
      id: '3',
      name: 'Nasi Kandar Sulaiman',
      grade: 'A',
      award: 'Crispiest Fried Chicken Diploma',
      location: 'Kuala Lumpur',
      description:
          'Ayam goreng that shatters like glass. Underneath, juice. No one knows how they do it. No one asks. Everyone just orders.',
      legendaryDish: 'Ayam Goreng Rempah',
      imagePath: 'assets/images/shops/sulaiman.jpg',
      latitude: 3.1514,
      longitude: 101.6943,
    ),
    ShopData(
      id: '4',
      name: 'Nasi Kandar Yasmeen',
      grade: 'S',
      award: 'Hidden Gem Graduate',
      location: 'Ipoh, Perak',
      description:
          'Tucked behind a hardware shop. The sotong is braised for 6 hours. Locals guard this secret like family gold.',
      legendaryDish: 'Sotong Masak Hitam',
      imagePath: 'assets/images/shops/yasmeen.jpg',
      latitude: 4.5975,
      longitude: 101.0901,
    ),
    ShopData(
      id: '5',
      name: 'Nasi Kandar Salam',
      grade: 'A',
      award: 'Late Night Scholar Award',
      location: 'Johor Bahru',
      description:
          'Opens at 10pm. Closes at 5am. The place where final year students and factory workers unite over hot rice and cold teh ais.',
      legendaryDish: 'Kari Kambing',
      imagePath: 'assets/images/shops/salam.jpg',
      latitude: 1.4927,
      longitude: 103.7414,
    ),
  ];

  // Stats Grid Data
  static const List<StatData> statsGrid = [
    StatData(
      number: '847',
      label: 'Shops Enrolled',
      sublabel: 'Across 14 states',
    ),
    StatData(
      number: '3.8',
      label: 'Avg Kuah GPA',
      sublabel: 'Community score',
    ),
    StatData(
      number: '2.3M',
      label: 'Litres of Gravy',
      sublabel: 'Consumed this month',
    ),
    StatData(
      number: '14',
      label: 'Perfect Streaks',
      sublabel: 'Fridays you never missed',
    ),
    StatData(
      number: '3',
      label: 'Rarest Dishes',
      sublabel: 'Burung Puyuh masala left',
    ),
    StatData(
      number: '98%',
      label: 'Graduation Rate',
      sublabel: 'Of students return',
    ),
  ];

  // Gravy Library
  static const List<GravyData> gravyLibrary = [
    GravyData(
      name: 'Kari Ikan',
      description:
          'Deep, sour, haunting. Made with tamarind and fresh fish head. The foundation of all great nasi kandar.',
      imagePath: 'assets/images/gravy/kari_ikan.jpg',
    ),
    GravyData(
      name: 'Kuah Bendi',
      description:
          'Slimy in the best way. Okra cuts through the richness. The quiet hero of every banana leaf.',
      imagePath: 'assets/images/gravy/kuah_bendi.jpg',
    ),
    GravyData(
      name: 'Masak Merah',
      description:
          'Not spicy. Just deep. Slow-cooked tomatoes and onions until they surrender into velvet.',
      imagePath: 'assets/images/gravy/masak_merah.jpg',
    ),
    GravyData(
      name: 'Kari Sotong',
      description:
          'Ink-dark, briny, sweet from hours of braising. The squid absorbs everything and gives back more.',
      imagePath: 'assets/images/gravy/kari_sotong.jpg',
    ),
    GravyData(
      name: 'Kurma',
      description:
          'The gentle one. Fragrant with star anise and cinnamon. A warm hug before the heat arrives.',
      imagePath: 'assets/images/gravy/kurma.jpg',
    ),
    GravyData(
      name: 'Sambal Telur',
      description:
          'Not gravy but essential. The egg soaks up sambal overnight. Tomorrow it becomes dangerous.',
      imagePath: 'assets/images/gravy/sambal_telur.jpg',
    ),
  ];

  // User photos feed
  static const List<UserPhoto> userPhotos = [
    UserPhoto(
      username: 'amirulfoodjournal',
      shopName: 'Line Clear',
      imagePath: 'assets/images/users/photo1.jpg',
      timeAgo: '2 hours ago',
    ),
    UserPhoto(
      username: 'gravyhunter_kl',
      shopName: 'Beratur',
      imagePath: 'assets/images/users/photo2.jpg',
      timeAgo: '5 hours ago',
    ),
    UserPhoto(
      username: 'nasikandar_mom',
      shopName: 'Sulaiman',
      imagePath: 'assets/images/users/photo3.jpg',
      timeAgo: '8 hours ago',
    ),
    UserPhoto(
      username: 'bananaleafdiaries',
      shopName: 'Yasmeen',
      imagePath: 'assets/images/users/photo4.jpg',
      timeAgo: '12 hours ago',
    ),
    UserPhoto(
      username: 'kuahcampur_sifu',
      shopName: 'Salam',
      imagePath: 'assets/images/users/photo5.jpg',
      timeAgo: '1 day ago',
    ),
    UserPhoto(
      username: 'penang_foodie',
      shopName: 'Line Clear',
      imagePath: 'assets/images/users/photo6.jpg',
      timeAgo: '1 day ago',
    ),
    UserPhoto(
      username: 'johorean_eats',
      shopName: 'Salam',
      imagePath: 'assets/images/users/photo7.jpg',
      timeAgo: '2 days ago',
    ),
    UserPhoto(
      username: 'ipoh_mali',
      shopName: 'Yasmeen',
      imagePath: 'assets/images/users/photo8.jpg',
      timeAgo: '2 days ago',
    ),
  ];

  // Navigation items
  static const List<Map<String, String>> navItems = [
    {'label': 'Hall', 'icon': 'hall'},
    {'label': 'Map', 'icon': 'map'},
    {'label': 'Card', 'icon': 'card'},
    {'label': 'Alumni', 'icon': 'alumni'},
  ];
}