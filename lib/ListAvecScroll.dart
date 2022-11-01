import 'package:flutter/material.dart';

class ListeAvecScroll extends StatefulWidget {
  const ListeAvecScroll({super.key});

  @override
  State<ListeAvecScroll> createState() => _ListeAvecScroll();
}

class _ListeAvecScroll extends State<ListeAvecScroll> {
  final ScrollController _firstController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
                  width: constraints.maxWidth / 2,
                  child: Scrollbar(
                    thumbVisibility: true,
                    child: ListView.builder(
                        primary: true,
                        itemCount: 100,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              height: 50,
                              color: index.isEven
                                  ? Color.fromRGBO(120, 120, 120, 100)
                                  : Color.fromRGBO(80, 80, 80, 100),
                              child:
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:Row(
                                          children:[
                                            Padding(padding:EdgeInsets.all(20.0)),
                                            Text('date ',style:TextStyle(color: Colors.white)),
                                            Padding(padding:EdgeInsets.all(16.0)),
                                            Text(' joueur$index',style:TextStyle(color: Colors.white)),
                                            Spacer(),
                                            Text('score:  $index',style:TextStyle(color: Colors.white)),
                                            Padding(padding:EdgeInsets.all(20.0))
                                  ]
                                )
                              )
                          );
                        }),
                  ));
        });
  }
}
