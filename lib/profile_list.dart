

class Profiles{
  late String name;
  late int phoneno;
  late String emailid;
  late String city;
  Profiles({
      required this.name,required this.city,required this.emailid,required this.phoneno}
      );
}

class ProfileList{
  List<Profiles> p_list=List.of([
    Profiles(
      name: "Samiksha Mohite",
      phoneno: 9359493600,
      emailid: 'sam@gmail.com',
      city: 'Pune'
    ),
    Profiles(
        name: "Bhavna Pendure",
        phoneno: 9459493500,
        emailid: 'bhavna@gmail.com',
        city: 'Satara'
    ),
    Profiles(
        name: "Dhanashri Sonawane",
        phoneno: 9659493800,
        emailid: 'dhano@gmail.com',
        city: 'Sangli'
    ),


  ]);
}




