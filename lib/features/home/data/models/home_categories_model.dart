class HomeModel {
  final String title;
  final String description;
  final String image;

  HomeModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<HomeModel> listHomeData = [
  HomeModel(title: 'Crews', description: 'Browse through the list of crows', image: 'assets/images/crew_image.png'),
  HomeModel(title: 'Rockets', description: 'Browse through the list of rockets', image: 'assets/images/rocket_image.png'),
  HomeModel(title: 'Launchpads', description: 'Browse through the list of launchpads', image: 'assets/images/launchpad_image.png'),
];
