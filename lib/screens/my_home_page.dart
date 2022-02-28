import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_home_work/logic/weather/cubit/weather_cubit.dart';
import 'package:weather_home_work/widgets/custom_loading.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final weatherCubit = WeatherCubit();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                    hintText: "type city",
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.white, fontSize: 22)),
                keyboardType: TextInputType.name,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: 200,
                height: 200,
                child:
                    Image.asset("assets/images/free-icon-storm-1146799.png")),
            SizedBox(
              height: 40,
            ),
            BlocProvider.value(
              value: weatherCubit,
              child: BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  return state.when(initial: () {
                    return Column(
                      children: [
                        Text(
                          "temperature",
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "country",
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                        SizedBox(
                          height: 190,
                        ),
                        Text(
                          "Day Time",
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                        Container(
                          width: 120,
                          height: 1,
                          color: Colors.white,
                        )
                      ],
                    );
                  }, loading: () {
                    return CustomLoading();
                  }, loaded: (weather) {
                    return Column(
                      children: [
                        Text(
                          "Температура ${weather.current.tempC.toString()} °C",
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          weather.location.country,
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        ),
                        SizedBox(
                          height: 150,
                        ),
                        Text(
                          weather.current.lastUpdated,
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        ),
                        Container(
                          width: 220,
                          height: 1,
                          color: Colors.white,
                        )
                      ],
                    );
                  }, failed: (e) {
                    return Center(
                        child: Text(
                      e,
                      style: TextStyle(fontSize: 28),
                    ));
                  });
                },
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          backgroundColor: Colors.blueGrey[900],
          onPressed: () {
            weatherCubit.getWeatherInfo(textEditingController.text);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
