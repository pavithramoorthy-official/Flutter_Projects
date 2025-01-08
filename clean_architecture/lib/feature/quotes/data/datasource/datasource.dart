import 'package:clean_architecture/feature/quotes/data/model/quotes_model.dart';
import 'package:dio/dio.dart';
abstract class QuotesDataSource{
  Future<QuotesModel> getQuotes();
}

class QuotesDataSourceImplementation extends QuotesDataSource {
  final Dio dio;

  QuotesDataSourceImplementation(this.dio);

  @override
  Future<QuotesModel> getQuotes() async {
    try {
      final response = await dio.get("https://dummyjson.com/quotes");
      if (response.statusCode == 200) {
        //print("Quotes List : $response");
        return QuotesModel.fromJson(response.data);
      } else {
        throw Exception('failed to load quotes');
      }
    } catch (e) {
      throw Exception('failed to load quotes : $e');
    }
  }
}