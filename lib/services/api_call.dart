import 'dart:convert';

import 'package:sky/model/weather.dart';
import 'package:sky/services/location.dart';
import 'package:http/http.dart' as http;

const apikey = '';
class ApiCall {
  Future<Weather> getweatherdata()async{
    Myloction myloction = Myloction();
    await myloction.getloction();
          var url=  Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=${myloction.latitude}&lon=${myloction.longitude}&appid=$apikey&units=metric');

          var respone= await http.get(url);
          var body = jsonDecode(respone.body);
    print(body);
    return Weather.fromJson(body);
  }

}
