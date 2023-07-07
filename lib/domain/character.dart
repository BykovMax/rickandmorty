class Character {
  int id;
  final String name;
  final String status;
  final String species;
  final String image;

  Character(this.id, this.name, this.species, this.status, this.image);

  Character.demo(int item)
      : this(item, 'Name $item', 'Species $item', 'Status $item',
            'https://rickandmortyapi.com/api/character/avatar/$item.jpeg');
}
