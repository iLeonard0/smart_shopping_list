import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../models/product.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://dummyjson.com")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/products")
  Future<ProductResponse> fetchProducts();
}