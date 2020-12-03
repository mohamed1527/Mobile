class Item {
  final String name;

  final String image;

  final String studentname;

  final String number;

  Item({this.name, this.number, this.studentname, this.image});

 
}

List<Item> allitems() {
  var lstofItems = new List<Item>();

  lstofItems.add(new Item(
      name: "Flash memory",
      number: "01223000262",
      studentname: "Ali",
      image: "flash.png"));
  lstofItems.add(new Item(
      name: "Hard disk",
      number: "01224000262",
      studentname: "Mohamed",
      image: "exharddisk.png"));
  lstofItems.add(new Item(
      name: "Xiaomi Note 10 cover",
      number: "01225000262",
      studentname: "Amira",
      image: "xiaominote10cover.png"));
  lstofItems.add(new Item(
      name: "wallet",
      number: "01226000262",
      studentname: "Soha",
      image: "wallet.png"));
  lstofItems.add(new Item(
      name: "gloves",
      number: "01227000262",
      studentname: "Omar",
      image: "gloves.png"));
  lstofItems.add(new Item(
      name: "necklace",
      number: "01228000262",
      studentname: "Mohab",
      image: "necklace.png"));
      lstofItems.add(new Item(
      name: "necklace",
      number: "01228000262",
      studentname: "Mohab",
      image: "necklace.png"));
      lstofItems.add(new Item(
      name: "necklace",
      number: "01228000262",
      studentname: "Mohab",
      image: "necklace.png"));
      lstofItems.add(new Item(
      name: "necklace",
      number: "01228000262",
      studentname: "Mohab",
      image: "necklace.png"));
      lstofItems.add(new Item(
      name: "necklace",
      number: "01228000262",
      studentname: "Mohab",
      image: "necklace.png"));
      lstofItems.add(new Item(
      name: "necklace",
      number: "01228000262",
      studentname: "Mohab",
      image: "necklace.png"));
      lstofItems.add(new Item(
      name: "necklace",
      number: "01228000262",
      studentname: "Mohab",
      image: "necklace.png"));
  return lstofItems;
}
