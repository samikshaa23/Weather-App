import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:second_task/main.dart';
import 'package:second_task/profile_list.dart';
import 'package:second_task/show_temperature.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              'Profiles'
            ),
          ),
        ),*/
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/login_page.jpg"), fit: BoxFit.fill)),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const Text(
              "Profiles",
              key: Key('profileKey'),
              style: TextStyle(
                  fontSize: 27,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
        Expanded(
          child: ListView.builder(
            itemCount:ProfileList().p_List.length ,
            itemBuilder: (BuildContext context, int index){
            return  Padding(
              padding: const EdgeInsets.only(left: 5, bottom: 30),
              child: SizedBox(
                height: 150,
                width: 280,
                child: Card(
                  // shadowColor: Colors.grey,
                  // elevation:30,
                  // color: Colors.indigoAccent[100],
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // Define how the card's content should be clipped
                  clipBehavior: Clip.antiAlias,
                  /* shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.black,width: 2,
                            )
                          ),*/
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*SizedBox(
                                  height: 1,
                                ),*/
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(top: 13,left: 15),
                                child: Text('Name :',
                                    key: Key('name'),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13),
                                child: Text(ProfileList().p_List[index].name,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18)),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(top: 10,left: 15),
                                child: Text('Phone No:',
                                    key: Key('phone no'),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                    '${ProfileList().p_List[index].phoneno}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18)),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Padding(
                                padding:EdgeInsets.only(top: 10,left: 15),
                                child: Text('E-Mail ID:',
                                    key: Key('mail id'),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                    ProfileList().p_List[index].emailid,
                                    style:const TextStyle(
                                        color: Colors.white, fontSize: 18)),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Padding(
                                padding:EdgeInsets.only(top: 10,left: 15),
                                child: Text('City:',
                                    key: Key('city'),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: InkWell(
                                onTap: () async {
                                  // navigation of page
                                  try {
                                    // Fetch weather data
                                    final weatherData = await getWeather(
                                        ProfileList().p_List[index].city,http.Client());
                                    final temperature = weatherData['days'][0]
                                    ['temp']
                                        .toStringAsFixed(1);
                                    final description =
                                    weatherData['description'];

                                    // Navigate to ShowTemp page
                                    // ignore: use_build_context_synchronously
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ShowTemp(
                                          cityName:
                                          ProfileList().p_List[index].city,
                                          temperature: temperature,
                                          description: description,
                                        ),
                                      ),
                                    );
                                  } catch (e) {
                                    debugPrint('Error fetching weather data: $e');
                                    // Handle error (e.g., show a snackbar)
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(ProfileList().p_List[index].city,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },),
        ),
        TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Main()));
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 300),
                  child: Text(
                    "back",
                    key: Key('back'),
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        fontSize: 15),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

Future<Map<String, dynamic>> getWeather(String cityName,http.Client client) async {
  final response = await http.get(Uri.parse(
      'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$cityName?unitGroup=metric&key=N6ZGX8GC3DPU4A5NWWJAVURQC&contentType=json'));

  if (response.statusCode == 200) {
    //print(response.body);
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load weather data');
  }
}
