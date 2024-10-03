class NavbarModel {
  final int index;
  const NavbarModel({
    required this.index,
  });
  NavbarModel copyWith({int? index}) {
    return NavbarModel(index: index ?? this.index);
  }
}
