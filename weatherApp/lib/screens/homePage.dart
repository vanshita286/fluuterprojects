import 'package:flutter/material.dart';
import 'package:weather_app/services/weatherClient.dart';
import 'package:weather_app/services/weatherModel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WeatherClient wClient = WeatherClient();
  List<String> cities = [
    "SriNagar",
    "New Delhi",
    "Amritsar",
    "Shimla",
    "Jaipur"
  ];
  late List<Future<WeatherModel>> wModels;

  List<WeatherModel> finalList = [];
  // late List<WeatherModel> weathers;
  Future<WeatherModel> _getCityWeather(city) async {
    Map<String, dynamic> data = await wClient.getWeather(city);
    // print("This is the data from client $data");
    WeatherModel wModel = WeatherModel.extractData(data);
    finalList.add(wModel);

    print("City: ${wModel.name}");
    print("Country: ${wModel.sys.country}");
    print("Temperature: ${wModel.main.temp}");
    print("Feels like: ${wModel.main.feels_like}");
    print("////////////////////////");

    return wModel;
  }

  Future<List<WeatherModel>> _getWeathers() async {
    List<WeatherModel> wmod = cities
        .map((city) async {
          WeatherModel wModel = await _getCityWeather(city);
          return wModel;
        })
        .cast<WeatherModel>()
        .toList();

    return wmod;

    // print("wModels are: ${wModels}");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Seasons",
            style: TextStyle(
                color: Color.fromARGB(255, 235, 71, 0),
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 247, 173),
        ),
        body: FutureBuilder(
          future: _getWeathers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: LinearProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error is: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: ((context, index) => ListTile(
                      title: Text(snapshot.data![0].clouds.all.toString()),
                    )),
              );
            }
            return const Placeholder();
          },
        ),
      ),
    );
  }
}
