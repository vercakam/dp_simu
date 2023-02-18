import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simu/endo.dart';
import 'package:simu/splash_screen.dart';



class home_screen extends StatelessWidget{
  final String value; // tady je můj token

  const home_screen({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
              color: Color.fromARGB(255, 253, 20, 4),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: size.height *0.05,
                  ),
                  
                  Text(
                    "Vyberte simulátor",
                     style: TextStyle(
                        fontSize: 30,
                        color: Colors.white),           
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 15,
                    children: <Widget>[
                      Simulator_cely(name_sim: "ENDO mentor", next_page: ENDO(value: value)),
                      Simulator(name_sim: "ANGIO mentor"),
                      Simulator(name_sim: "LAP mentor"),
                      Simulator(name_sim: "PLEVIC mentor"),
                      Simulator(name_sim: "PERC mentor"),
                      Simulator(name_sim: "RobotiX"),
                      Simulator(name_sim: "SPINE mentor"),
                      Simulator(name_sim: "URO mentor"),
                      Simulator(name_sim: "UZ mentor"),
                    ],
                  ),

                ],      
              ),
            ),
          )
        ],
      ),
    ); 
  }
  
}

class Simulator extends StatelessWidget {
    final String name_sim;
    final bool isDone;
    const Simulator ({
      Key? key, 
      required this.name_sim,
      this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, constraint) {
        return Container(
          width: constraint.maxWidth/2 -10 ,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 247, 235, 235),
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0,10),
                blurRadius: 23,
                spreadRadius: -13
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Row(
                children: <Widget>[
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 214, 180, 180),
                      shape: BoxShape.circle,
                
                    ),
                    child: Icon(
                      Icons.not_interested,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text("$name_sim",
                    style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 92, 90, 90)), 
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

class Simulator_cely extends StatelessWidget {
    final String name_sim;
    final next_page;
    final bool isDone;
    const Simulator_cely ({
      Key? key, 
      required this.name_sim,
      required this.next_page,
      this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, constraint) {
        return Container(
          width: constraint.maxWidth  ,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0,12),
                blurRadius: 13,
                spreadRadius: -13
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) =>  next_page));
              },
              child: Row(
                children: <Widget>[
                  Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 225, 12, 12),
                      shape: BoxShape.circle,
                
                    ),
                    child: Icon(
                      Icons.emergency,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 1),
                  Text("$name_sim",
                    style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 0, 0, 0)), 
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
