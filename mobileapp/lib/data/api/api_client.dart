import 'package:get/get.dart';
import 'package:mobileapp/utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;

  // ignore: unused_field
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30); //try to get data from server for 30s
    token=AppConstants.TOKEN;
    _mainHeaders = {
      'Content-type':'application/json; charset=UTF-8',
      'Authorization':'Bearer $token',
    };
  }
  Future<Response> getData(String uri) async{
    try{
      Response response = await get(uri); //get method from getx to get data from server
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}