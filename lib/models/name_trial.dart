class NameModel {
  static final names = [
    Item(
      id: 1,
      name: 'Shyamlal Mathiyawala',
    ),
    Item(
      id: 2,
      name: 'Roshni Mathur',
    ),
    Item(
      id: 3,
      name: 'Jogi Pithawala',
    ),
    Item(
      id: 4,
      name: 'Jaspreet Kaur',
    ),
    Item(
      id: 5,
      name: 'Sazia Jhaveri',
    ),
    Item(
      id: 6,
      name: 'Nikum Maheswari',
    ),
    Item(
      id: 7,
      name: 'Govind Deshmukh',
    ),
    Item(
      id: 8,
      name: 'Ruby Mathew',
    ),
    Item(
      id: 9,
      name: 'Jay Soni',
    ),
    Item(
      id: 10,
      name: 'Francis Bob',
    ),
  ];
}

class Item {
  final int id;
  final String name;

  Item({required this.id, required this.name});
}
