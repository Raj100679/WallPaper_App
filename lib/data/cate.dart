import 'package:wallpaper/models/category_model.dart';

String apiKey = "563492ad6f91700001000001a5fb3c5e4c5c47cc8632760563a8dbc0";
List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [];

  CategoryModel category = new CategoryModel();
  category.imgUrl =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  category.categoryName = "Street Art";
  categories.add(category);
  category = new CategoryModel();

  //
  category.imgUrl =
      "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  category.categoryName = "Wild Life";
  categories.add(category);
  category = new CategoryModel();

  //
  category.imgUrl =
      "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  category.categoryName = "Nature";
  categories.add(category);
  category = new CategoryModel();

  //
  category.imgUrl =
      "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  category.categoryName = "City";
  categories.add(category);
  category = new CategoryModel();

  //
  category.imgUrl =
      "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  category.categoryName = "Motivation";

  categories.add(category);
  category = new CategoryModel();

  //
  category.imgUrl =
      "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  category.categoryName = "Bikes";
  categories.add(category);
  category = new CategoryModel();

  //
  category.imgUrl =
      "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  category.categoryName = "Cars";
  categories.add(category);
  category = new CategoryModel();

  return categories;
}
