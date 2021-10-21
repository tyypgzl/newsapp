import 'package:newsapp/core/components/constants/supabase_const.dart';
import 'package:newsapp/feature/category_news/model/category_model.dart';
import 'package:supabase/supabase.dart';

class CategoryServices {
  final _client = SupabaseClient(SupabaseConst.apiUrl, SupabaseConst.apiKey);

  Future<List<CategoryModel>> getCategory() async {
    final response = await _client.from("category").select().execute();

    if (response.status == 200) {
      var categoryList = <CategoryModel>[];
      for (var element in (response.data as List)) {
        CategoryModel categoryModel = CategoryModel.fromJson(element);
        categoryList.add(categoryModel);
      }
      return categoryList;
    } else {
      throw Exception("Response Status Error:${response.error}");
    }
  }
}
