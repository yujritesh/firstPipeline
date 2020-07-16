import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://reqres.in/api/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;
}
