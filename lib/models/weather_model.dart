class Weather {
  late Location location;
  late Current current;

  Weather({required location, required current});

  Weather.fromJson(Map<String, dynamic> json) {
    location = (json['location'] != null
        ? Location.fromJson(json['location'])
        : null)!;
    current =
        (json['current'] != null ? Current.fromJson(json['current']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['location'] = location.toJson();
    data['current'] = current.toJson();
    return data;
  }
}

class Location {
  late String name;
  late String region;
  late String country;
  late double lat;
  late double lon;
  late String tzId;
  late int localtimeEpoch;
  late String localtime;

  Location(
      {required name,
      required region,
      required country,
      required lat,
      required lon,
      required tzId,
      required localtimeEpoch,
      required localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['region'] = region;
    data['country'] = country;
    data['lat'] = lat;
    data['lon'] = lon;
    data['tz_id'] = tzId;
    data['localtime_epoch'] = localtimeEpoch;
    data['localtime'] = localtime;
    return data;
  }
}

class Current {
  late int lastUpdatedEpoch;
  late String lastUpdated;
  late double tempC;
  late double tempF;
  late int isDay;
  late Condition condition;
  late double windMph;
  late double windKph;
  late int windDegree;
  late String windDir;
  late double pressureMb;
  late double pressureIn;
  late double precipMm;
  late double precipIn;
  late int humidity;
  late int cloud;
  late double feelslikeC;
  late double feelslikeF;
  late double visKm;
  late double visMiles;
  late double uv;
  late double gustMph;
  late double gustKph;

  Current(
      {required lastUpdatedEpoch,
      required lastUpdated,
      required tempC,
      required tempF,
      required isDay,
      required condition,
      required windMph,
      required windKph,
      required windDegree,
      required windDir,
      required pressureMb,
      required pressureIn,
      required precipMm,
      required precipIn,
      required humidity,
      required cloud,
      required feelslikeC,
      required feelslikeF,
      required visKm,
      required visMiles,
      required uv,
      required gustMph,
      required gustKph});

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdatedEpoch = json['last_updated_epoch'];
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'];
    condition = (json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null)!;
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];
    precipMm = json['precip_mm'];
    precipIn = json['precip_in'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
    visKm = json['vis_km'];
    visMiles = json['vis_miles'];
    uv = json['uv'];
    gustMph = json['gust_mph'];
    gustKph = json['gust_kph'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_updated_epoch'] = lastUpdatedEpoch;
    data['last_updated'] = lastUpdated;
    data['temp_c'] = tempC;
    data['temp_f'] = tempF;
    data['is_day'] = isDay;
    data['condition'] = condition.toJson();
    data['wind_mph'] = windMph;
    data['wind_kph'] = windKph;
    data['wind_degree'] = windDegree;
    data['wind_dir'] = windDir;
    data['pressure_mb'] = pressureMb;
    data['pressure_in'] = pressureIn;
    data['precip_mm'] = precipMm;
    data['precip_in'] = precipIn;
    data['humidity'] = humidity;
    data['cloud'] = cloud;
    data['feelslike_c'] = feelslikeC;
    data['feelslike_f'] = feelslikeF;
    data['vis_km'] = visKm;
    data['vis_miles'] = visMiles;
    data['uv'] = uv;
    data['gust_mph'] = gustMph;
    data['gust_kph'] = gustKph;
    return data;
  }
}

class Condition {
  late String text;
  late String icon;
  late int code;

  Condition({required text, required icon, required code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['icon'] = icon;
    data['code'] = code;
    return data;
  }
}
