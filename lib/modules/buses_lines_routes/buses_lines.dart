import 'package:flutter/material.dart';
import '../../constants/constants.dart';
class Buses_Lines extends StatefulWidget {
  const Buses_Lines({Key? key}) : super(key: key);
  @override
  State<Buses_Lines> createState() => _Buses_LinesState();
}
class _Buses_LinesState extends State<Buses_Lines> {
  List<String> busesList = [
    '1346',
    '4579',
    '1032',
    '25',
    '869',
    '88',
    '100',
    '1',
    '1346',
    '4579',
    '1032',
  ];
  List<String> firststation = [
    "cairo airport",
    "ahmed helmy",
    "el salam",
    "Rod El Farag",
    "cairo airport",
    "ahmed helmy",
    "el salam",
    "Rod El Farag",
    "ahmed helmy",
    "el salam",
    "Rod El Farag",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: klightblue,
          title: const Text(
            'Buses Lines & Routes',
            style: TextStyle(
                fontFamily: 'Century Gothic',
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),),
          actions: [
            IconButton(onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            }, icon: const Icon(Icons.search, color: Colors.white,),),
          ],
        ),
        body:  ListView.separated(
        separatorBuilder: (context, index) =>
        Container(color: Colors.grey[70], height: 2),
    itemBuilder: (ctx, index) {
    return ExpansionTile(
children: [

  Container(
    decoration: BoxDecoration(
      color: const Color(0xffffffff),
      borderRadius: BorderRadius.circular(5.0),
      boxShadow: const [
        BoxShadow(
          color: Color(0x6e000000),
          offset: Offset(3, 3),
          blurRadius: 6,


        )
      ],
    ),
    height:230,
width: 340,

child: Padding(
  padding: const EdgeInsets.all(15.0),
  child:   Column(

    children: [
      Row(
    children: const [
      Icon(Icons.east,color: kBlue,),
        SizedBox(width: 20.0,),
        Text(
          'Ninety street',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xff113453),
            fontWeight: FontWeight.w700,
          ),


  ),
    ],
  ),
      const SizedBox(height: 15.0,),
      Row(
        children: const [
          Icon(Icons.east,color: kBlue,),

          Text(
            'El Mosher Axis',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff113453),
              fontWeight: FontWeight.w700,
            ),


          ),
        ],
      ),
      const SizedBox(height: 15.0,),

      Row(
        children: const [
          Icon(Icons.east,color: kBlue,),
          Text(
            'Ramsis extention st',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff113453),
              fontWeight: FontWeight.w700,
            ),


          ),
        ],
      ),
      const SizedBox(height: 15.0,),

      Row(
        children: const [
          Icon(Icons.east,color: kBlue,),
          Text(
            'Abbasia',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff113453),
              fontWeight: FontWeight.w700,
            ),


          ),
        ],
      ),
      const SizedBox(height: 15.0,),

      Row(
        children: const [
          Icon(Icons.east,color: kBlue,),
          Text(
            'Ninety street',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff113453),
              fontWeight: FontWeight.w700,
            ),


          ),
        ],
      ),
    ],
  ),
),

    ),
      ],
      title: Container(

        height: 75,


        child:Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.asset('assets/images/lines.png', width: 120,
                      fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Image.asset(
                      'assets/images/lines_bus.png', width: 60,),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8.0,),
            Container(
                width: 55,
                child: Center(child: Text("${busesList[index]}",
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight
                      .bold, color: klightblue),))),
            const SizedBox(width: 8.0,),
            Image.asset('assets/images/seperator.png', height: 50,),
            const SizedBox(width: 7,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6.0,),
                    Text("${firststation[index]}",
                      style: const TextStyle(
                        fontFamily: 'Century Gothic',
                        fontSize: 14,
                        color: kBlue,
                      ),),
                    const SizedBox(height: 13.0,),
                    const Text('Third Settlement',
                      style: TextStyle(
                        fontFamily: 'Century Gothic',
                        fontSize: 14,
                        color: kred,
                      ),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
    }, itemCount: busesList.length,),

    );
  }

}
class DataSearch extends SearchDelegate {
  List<String> busesList = [
    '1346',
    '4579',
    '1032',
    '25',
    '869',
    '88',
    '100',
    '1',
    '1346',
    '4579',
    '1032',
  ];
  List<String> firststation = [
    "cairo airport",
    "ahmed helmy",
    "el salam",
    "Rod El Farag",
    "cairo airport",
    "ahmed helmy",
    "el salam",
    "Rod El Farag",
    "ahmed helmy",
    "el salam",
    "Rod El Farag",
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {
        query = "";
      }, icon: const Icon(Icons.close),),
    ];
  }
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      close(context, null);
    },
      icon: const Icon(Icons.arrow_back),
    );
  }
  @override
  Widget buildResults(BuildContext context) {
    return Text("$query");
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    List filterbuses = firststation.where((element) => element.startsWith(query))
        .toList();
    return ListView.separated(
      itemBuilder: (context, index) =>
          InkWell(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.only(top: 1, left: 2),
              child: Container(
                height: 75,
                color: Colors.white,
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Image.asset('assets/images/lines.png', width: 120,
                            fit: BoxFit.cover),
                        Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Image.asset(
                            'assets/images/lines_bus.png', width: 60,),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10,),
                    Container(
                        width: 55,
                        child: Center(child: Text("${busesList[index]}",
                          style: const TextStyle(fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: klightblue),))),
                    const SizedBox(width: 10,),
                    Image.asset('assets/images/seperator.png', height: 50,),
                    const SizedBox(width: 7,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 6.0,),
                          Text("${firststation[index]}",
                            style: const TextStyle(
                              fontFamily: 'Century Gothic',
                              fontSize: 14,
                              color: kBlue,
                            ),),
                          const SizedBox(height: 13.0,),
                          const Text('Third Settlement',
                            style: TextStyle(
                              fontFamily: 'Century Gothic',
                              fontSize: 14,
                              color: kred,
                            ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      separatorBuilder: (BuildContext context, int index) =>
          Container(color: Colors.grey[70], height: 2),
      itemCount: query == "" ? firststation.length : filterbuses.length,
    );
  }
}