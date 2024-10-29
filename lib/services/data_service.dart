import 'package:e_commerce/models/recipe.dart';
import 'package:e_commerce/services/http_service.dart';

class DataService {
  static final DataService _singleton = DataService._internal();

  final HTTPService _httpService = HTTPService();

  factory DataService() {
    return _singleton;
  }

  DataService._internal();

  Future<List<Recipie>?> getRecipes(String filter) async {
    String path = "recipes/";
    if (filter.isNotEmpty) {
      path += "meal-type/$filter";
    }
    var response = await _httpService.grt(path);
    if (response?.statusCode == 200 && response?.data != null) {
      List data = response!.data["recipes"];
      List<Recipie> recipes = data.map((e) => Recipie.fromJson(e)).toList();
      return recipes;
    }
  }
}
