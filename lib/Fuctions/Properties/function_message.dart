import 'package:dio/dio.dart';
import 'package:lease_managment/Fuctions/function_login_logout.dart';

class ApiMessage {
  Dio dio = Dio();
  String url = 'http://10.0.0.41:8060/api/v1/property/notify';

  Future<void> sendMessage(int id) async {
    String? token = await ApiConexion().getToken();
    try {
      final response = await dio.post('$url/$id',
          data: {'notifyToken': 'dkV0iQ96ScKIi-062yorCO:APA91bG-3mEAyCjCl6RXvE6VIBBVXKOaim5J0O_joPSXh-6fsvZDzxHE7vunSnpzOMJm0G1CAlXTjvn4Fax7o7ECJC_I_NDrK7kHKmaX_2pcOk6F5MNl9yfoKepY2ReluVSHmJUvpsol'},
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      if (response.statusCode == 200) {
        print('Message sent');
      } else {
        throw Exception('Failed to send message');
      }
    } catch (e) {
      throw Exception('Error sending message: $e');
    }
  }
}
