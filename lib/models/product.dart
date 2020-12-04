import 'package:furniture_app/ui/home.dart';

class Home {
  final int id, price;
  final String title, description, image;

  Home({this.id, this.price, this.title, this.description, this.image});
}

// list of products
// for our demo
List<Home> home = [
  Home(
    id: 1,
    price: 56,
    title: "ShockBreaker KTC",
    image: "assets/images/Item_5.PNG",
    description:
        "ShockBreaker KTC ORIGINAL REBOUND ATAS BAWAH FUNGSI-UKURAN 350-355mm",
  ),
];
