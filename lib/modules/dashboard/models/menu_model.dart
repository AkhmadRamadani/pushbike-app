class MenuModel {
  final String assetPath;
  final String label;
  final Function()? onTap;

  MenuModel({
    required this.assetPath,
    required this.label,
    this.onTap,
  });
}
