import 'package:flutter/material.dart';
import 'package:second_task/show_data.dart';

class ShowTemp extends StatelessWidget {
  final String cityName;
  final String temperature;
  final String description;

  const ShowTemp({super.key,
    required this.cityName,
    required this.temperature,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        automaticallyImplyLeading: false,
backgroundColor: Colors.white,
iconTheme: IconThemeData(color: Colors.blueAccent),
        title: Center(child: Text('$cityName Weather',style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 23,
          fontWeight: FontWeight.w500
        ),)),
      ),*/
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/city.jpg"), fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 90,
              ),
              Text(
                "$cityName Weather",
                key: const Key('city weather'),
                style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 200,
              ),
              Text(
                'Temperature: $temperature°C',
                key: const Key('temperature'),
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Text(
                  'Description : $description',
                  key: const Key('description'),
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 350,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 240),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const ShowData()));
                    },
                    child: const Text(
                      "back",
                      key: Key('back'),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
