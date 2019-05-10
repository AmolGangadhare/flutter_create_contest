import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MaterialApp(home: App()));

class App extends StatefulWidget {
  @override
  _App createState() => _App();
}

class _App extends State {
  int stx = 21, upk = 0, cpk = 0, flg = -1, ct = 1;
  List kys = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Scaffold(
            body: Stack(children: <Widget>[
          Positioned.fill(child: Image.asset('res/b1.jpg', fit: BoxFit.fill)),
          Positioned(
              height: 160,
              width: 160,
              child: Visibility(
                  child: Stack(alignment: Alignment.center, children: <Widget>[
                    FlareActor(flg == 0 ? 'flr/cd.flr' : 'flr/ud.flr'),
                    Text(flg == 0 ? 'You picked $upk' : 'Betty picked $cpk',
                        style: TextStyle(fontFamily: 'fnt', fontSize: 18))
                  ]),
                  visible: flg > -1),
              top: 20,
              left: flg == 0 ? 10 : MediaQuery.of(context).size.width - 170),
          Positioned(
              height: 200,
              child: Visibility(
                  child: Stack(children: <Widget>[
                    FlareActor('flr/b3.flr', fit: BoxFit.fill),
                    GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7),
                        itemCount: stx,
                        itemBuilder: (bc, i) => Padding(
                            padding: EdgeInsets.all(5),
                            child: Image.asset('res/m.png')),
                        scrollDirection: Axis.vertical)
                  ]),
                  visible: stx > 0),
              bottom: 225,
              left: 10,
              right: 10),
          Positioned(
              height: 220,
              child: Visibility(
                  child: Stack(children: <Widget>[
                    FlareActor('flr/ui.flr', fit: BoxFit.fill),
                    Positioned(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: kys
                                .map((d) => FloatingActionButton(
                                    onPressed: () => update(d),
                                    backgroundColor: Colors.black,
                                    child: Text(d.toString(),
                                        style: TextStyle(color: Colors.white))))
                                .toList()),
                        bottom: 50,
                        left: 10,
                        right: 10)
                  ]),
                  visible: stx > 0 && ct > 0),
              bottom: 0,
              left: 10,
              right: 10),
          Positioned(
              child: Visibility(
                  child: Row(children: <Widget>[
                    IconButton(
                        icon: FlareActor('flr/r.flr'),
                        iconSize: 30,
                        onPressed: () => setState(() {
                              ct = stx = 21;
                              flg = upk = cpk = -1;
                            })),
                    IconButton(
                        icon: FlareActor('flr/i.flr'),
                        iconSize: 30,
                        onPressed: () => showDialog(
                            context: context,
                            builder: (c) =>
                                AlertDialog(content: Image.asset('res/h.jpg'))))
                  ]),
                  visible: ct > 0),
              bottom: 0,
              right: 50),
          Positioned(
              child:
                  Visibility(child: FlareActor('flr/w.flr'), visible: stx < 1),
              bottom: 5,
              left: 0,
              right: 0,
              height: 500),
          ct == 0
              ? Stack(alignment: Alignment.center, children: <Widget>[
                  ModalBarrier(color: Colors.grey.withOpacity(.6)),
                  SizedBox(
                      child: FlareActor('flr/ct.flr', fit: BoxFit.fill),
                      height: 300,
                      width: 300)
                ])
              : Align(),
        ])),
        onTap: () {
          if (stx < 2)
            setState(() {
              ct = stx = 21;
              flg = upk = cpk = -1;
            });
        });
  }

  update(int val) {
    if (stx > 1) {
      setState(() {
        stx -= (upk = val);
        flg = ct = 0;
      });
      Future.delayed(Duration(seconds: 3)).then((d) => setState(() {
            stx -= (cpk = (5 - val));
            ct = flg = stx > 0 ? 1 : -1;
          }));
    } else {
      setState(() {
        stx -= (cpk = (5 - val));
        ct = flg = stx > 0 ? 1 : -1;
      });
    }
  }
}
