class Weather {
  String? cityname;
  double? temp;
  double? wind;
  int? humidity;
  double? feelslike;
  int? pressure;
  int? conditions;
  int? cloud;

  Weather(
    this.cityname,
    this.temp,
    this.wind,
    this.humidity,
    this.feelslike,
    this.pressure,
    this.conditions,
    this.cloud,
  );

  Weather.fromJson(Map<String, dynamic> json) {
    cityname = json['name'];
    temp = json['main']['temp'];
    wind = json['wind']['speed'];
    pressure = json['main']['pressure'];
    humidity = json['main']['humidity'];
    feelslike = json['main']['feels_like'];
    conditions = json['weather'][0]['id'];
    cloud = json["clouds"]['all'];
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
  String getbackGround(int temp , int cloud) {
    if (temp > 25&& cloud<15) {
      return 'imges/sunset.jpg';
    } else if (temp < 18 &&cloud>30 ) {
      return 'imges/wintercloud.jpg';
    } else if (temp < 10 && cloud>30) {
      return 'imges/wintercloud.jpg';
    } else if (temp < 10 && cloud<10) {
      return 'imges/sumerday.jpg';
    }
    else if (temp < 18 &&cloud<30 ) {
      return 'imges/rains.jpg';}
   else if (temp > 20&& cloud>30) {
      return 'imges/wintersunnyday.jpg';
    }

    else {
      return 'imges/wintymount.jpg';
    }

  }

}
