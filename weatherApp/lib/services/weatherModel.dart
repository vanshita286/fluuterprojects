class WeatherModel {
  late String Base;
  late int visibility;
  late int dt;
  late int timezone;
  late int id;
  late String name;
  late int cod;
  late Coord coord;
  late List<Weather> weathers;
  late Main main;
  late Wind wind;
  late Clouds clouds;
  late Sys sys;

  WeatherModel({
    required this.Base,
    required this.cod,
    required this.dt,
    required this.id,
    required this.name,
    required this.timezone,
    required this.visibility,
  });

  WeatherModel.extractData(Map<String, dynamic> map) {
    Base = map["base"] ?? "NA";
    cod = map["cod"] ?? 0;
    dt = map["dt"] ?? 0;
    id = map["id"] ?? 0;
    name = map["name"] ?? "NA";
    timezone = map["timezone"] ?? "NA";
    visibility = map["visibility"] ?? 0;

    coord = Coord.extractData(map["coord"]);
    main = Main.extractData(map["main"]);
    wind = Wind.extractData(map["wind"]);
    clouds = Clouds.extractData(map["clouds"]);
    sys = Sys.extractData(map["sys"]);
    weathers = List<Weather>.from(map["weather"].map((map) {
      Weather singleW = Weather.extractData(map);
      return singleW;
    }));
  }
}

class Coord {
  late double lon;
  late double lat;

  Coord({
    required this.lat,
    required this.lon,
  });

  Coord.extractData(Map<String, dynamic> map) {
    lon = map["lon"] ?? 0;
    lon = map["lat"] ?? 0;
  }
}

class Weather {
  late int id;
  late String main;
  late String description;
  late String icon;
  late String iconPath;

  Weather({
    required this.description,
    required this.icon,
    required this.iconPath,
    required this.id,
    required this.main,
  });

  Weather.extractData(Map<String, dynamic> map) {
    id = map["id"] ?? 0;
    main = map["main"] ?? "NA";
    description = map["description"] ?? "NA";
    icon = map["icon"] ?? "01d";
    iconPath = "https://openweathermap.org/img/wn/${icon}@2x.png";
  }
}

class Main {
  late double temp;
  late double feels_like;
  late double temp_min;
  late double temp_max;
  late int pressure;
  late int humidity;
  late int sea_level;
  late int grnd_level;

  Main({
    required this.feels_like,
    required this.grnd_level,
    required this.humidity,
    required this.pressure,
    required this.sea_level,
    required this.temp,
    required this.temp_max,
    required this.temp_min,
  });

  Main.extractData(Map<String, dynamic> map) {
    feels_like = _KelvintoCelsius(map["feels_like"]) ?? 0;
    grnd_level = map["grnd_level"] ?? 0;
    humidity = map["humidity"] ?? 0;
    pressure = map["pressure"] ?? 0;
    sea_level = map["sea_level"] ?? 0;
    temp = _KelvintoCelsius(map["temp"]) ?? 0;
    temp_max = _KelvintoCelsius(map["temp_max"]) ?? 0;
    temp_min = _KelvintoCelsius(map["temp_min"]) ?? 0;
  }

  _KelvintoCelsius(tempK) {
    return (tempK - 273.15);
  }

  _CelsiustoKelvin(tempC) {
    return (tempC + 273.15);
  }
}

class Wind {
  late double speed;
  late int deg;
  late double gust;

  Wind({
    required this.deg,
    required this.gust,
    required this.speed,
  });

  Wind.extractData(Map<String, dynamic> map) {
    speed = map["speed"] ?? 0;
    deg = map["deg"] ?? 0;
    speed = map["speed"] ?? 0;
  }
}

class Clouds {
  late int all;

  Clouds({required this.all});

  Clouds.extractData(Map<String, dynamic> map) {
    all = map["all"] ?? 0;
  }
}

class Sys {
  late String country;
  late int sunrise;
  late int sunset;

  Sys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  Sys.extractData(Map<String, dynamic> map) {
    sunrise = map["sunrise"] ?? 0;
    sunset = map["sunset"] ?? 0;
    country = map["country"] ?? "NA";
  }
}
