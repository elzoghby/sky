import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sky/model/weather.dart';
import 'package:sky/services/api_call.dart';
import 'package:sky/widget/additional_info.dart';
import 'package:sky/widget/weather_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data;
  ApiCall client = ApiCall();
  var icon;

  Future<void> getData() async {
    data = await client.getweatherdata();

    icon = data.conditions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

          children: [
        FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError || data.temp == null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                        'Check your internet connection and the location permission', style: TextStyle(),textAlign: TextAlign.center,),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          getData();
                        });
                      },
                      child: const Text('refresh'))
                ],
              );
            } else {
              return Container(
                // width: double.infinity,
                // height: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(data.getbackGround(data.temp.toInt() , data.cloud)),
                        fit: BoxFit.cover)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      title: const Text('Sky'),
                      centerTitle: true,
                      titleTextStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Text(data.getMessage(data.temp.toInt()),
                        style: TextStyle(fontSize: 28, color: Colors.white)),

                    const SizedBox(
                      height: 60,
                    ),
                    weatherData(data.getWeatherIcon(icon), data.temp.toString(),
                        data.cityname.toString()),
                    TextButton(
                        onPressed: () {
                          setState(() {

                          });
                        },
                        child: const Text('refresh', style: TextStyle(fontSize: 18),)),
                    const SizedBox(
                      height: 60,
                    ),
                    additionalInfo(
                        data!.wind.toString(),
                        data!.humidity.toString(),
                        data!.pressure.toString(),
                        data!.feelslike.toString())
                  ],
                ),
              );
            }

          },
        ),

      ]),
    );
  }
}
