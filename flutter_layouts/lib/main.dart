import 'package:flutter/material.dart';
import 'dart:math' as math;

void main(){
  runApp(MaterialApp(
    title: "layouts",
    home: Layouts(),
  ));
}

Widget ColumnCell(String title, void Function() tap)
{
  return Column(children: <Widget>[
    Divider(height: 10,),
    ListTile(
      title: Center(child: Text(title)),
      onTap: tap,
    )
    ],
  );

}

class LayoutPracticePage extends StatelessWidget {

  String title;
  Widget body;

  LayoutPracticePage({Key key, this.title, this.body}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body ?? Container(),
    );
  }
}


class Layouts extends StatefulWidget {
  @override
  _LayoutsState createState() => _LayoutsState();
}

class _LayoutsState extends State<Layouts> {

  void pushTo(BuildContext context, Widget page)
  {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext content){
      return page;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layouts"),
      ),
      body: Container(
          child: SafeArea(
            child:ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ListTile(
                      title: Text("Single-child",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    )
                  ],
                ),
                ColumnCell("Container", ()=>{
                  pushTo(context, LayoutPracticePage(title: "container", body: ShowContainer(),))
                }),
                ColumnCell("Padding", ()=>{
                  pushTo(context, LayoutPracticePage(title: "Padding", body: ShowPadding(),))
                }),
                ColumnCell("Center", ()=>{
                  pushTo(context, LayoutPracticePage(title: "Center", body: ShowCenter(),))
                }),
                ColumnCell("Align", ()=>{
                  pushTo(context, LayoutPracticePage(title: "Align", body: ShowAlign(),))
                }),
                ColumnCell("FittedBox", ()=>{
                  pushTo(context, LayoutPracticePage(title: "FittedBox", body: ShowFittedBox(),))
                }),
                ColumnCell("AspectRatio", ()=>{
                  pushTo(context, LayoutPracticePage(title: "AspectRatio", body: ShowAspectRatio(),))
                }),
                ColumnCell("ConstrainedBox", ()=>{
                  pushTo(context, LayoutPracticePage(title: "ConstrainedBox", body: ShowConstrainedBox(),))
                }),
                ColumnCell("OverflowBox", ()=>{
                  pushTo(context, LayoutPracticePage(title: "OverflowBox", body: ShowOverflowBox(),))
                }),
                ColumnCell("SizedOverflowBox", ()=>{
                  pushTo(context, LayoutPracticePage(title: "SizedOverflowBox", body: ShowSizedOverflowBox(),))
                }),
                ColumnCell("Transform", ()=>{
                  pushTo(context, LayoutPracticePage(title: "Transform", body: ShowTransform(),))
                }),
                Column(
                  children: <Widget>[
                    ListTile(
                      title: Text("Multi-child",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    )
                  ],
                ),
                ColumnCell("Row", ()=>{
                  pushTo(context, LayoutPracticePage(title: "Row", body: ShowRow(),))
                }),
              ],
            ),
          )
      ),
    );
  }
}

class ShowContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 30,),
              decoration: BoxDecoration(
                color: Colors.green,
                gradient: RadialGradient(
                  radius: 0.6,
//                  begin: Alignment.topLeft,
//                  end: Alignment.bottomRight,
                  colors: [Colors.red, Colors.blueAccent, Colors.amberAccent]
                ),
              ),
//
              child: Container(
                  transform: Matrix4.rotationZ(0.2),
                  width: 100,
                  height: 100,
                  color:Colors.cyan
              ),
        );
  }
}


class ShowPadding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Container(
                      width: 100,
                      height: 100,
                      color:Colors.cyan
              ),
    );
  }
}

class ShowCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 100,
          height: 100,
          color:Colors.cyan
      ),
    );
  }
}

class ShowAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: 120.0,
            width: 120.0,
            color: Colors.blue[50],
            child: Align(
              alignment: FractionalOffset(0, 0.5),
//          alignment: Alignment.center,
              child: FlutterLogo(
                colors: Colors.orange,
                size: 60,
              ),
            ),
          ),
          Container(
            height: 120.0,
            width: 120.0,
            color: Colors.red[50],
            child: Align(
              alignment: Alignment(0, 1),
              child: FlutterLogo(
                colors: Colors.orange,
                size: 60,
              ),
            ),
          ),
        ],
      )
    );
  }
}

class ShowFittedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        child: FittedBox(
          child: Container(
              width: 100,
              height: 100,
              color:Colors.cyan
          ),
        ),
      ),
    );
  }
}

//A widget that attempts to size the child to a specific aspect ratio.
class ShowAspectRatio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 300,
          color: Colors.red,
          child: AspectRatio(
            aspectRatio: 4/3,
            child: Container(
                color:Colors.cyan
            ),
          ),
      ),
    );
  }
}


//A widget that imposes additional constraints on its child.
class ShowConstrainedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 50),
        child: Container(
          color: Colors.cyan,
          width: 100,
          height: 100,
        )
      ),
    );
  }
}


/**
A widget that imposes different constraints on its child than it gets from its parent, possibly allowing the child to overflow the parent.
**/
class ShowOverflowBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        width: 100,
        height: 100,
        child: OverflowBox(
//            maxWidth: 100,
            maxHeight: 200,
            child: Container(
              color: Colors.cyan,
              child: Text("A widget that imposes different constrainA widget that imposes different constrainA widget that imposes different constrainA widget that imposes different constrainA widget that imposes different constrainA widget that imposes different constrainA widget that imposes different constrainA widget that imposes different constrainA widget that imposes different constrainA widget that imposes different constrainA widget that imposes different constrainA widget that imposes different constrain",
              overflow: TextOverflow.fade,
              style: TextStyle(),),
            )
        ),
      ),
    );
  }
}

// xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
class ShowSizedOverflowBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.green,
        gradient: RadialGradient(
            radius: 0.6,
//                  begin: Alignment.topLeft,
//                  end: Alignment.bottomRight,
            colors: [Colors.red, Colors.blueAccent, Colors.amberAccent]
        ),
      ),
      child: Container(
          width: 100,
          height: 100,
          color:Colors.cyan,
          child: SizedOverflowBox(
            size: Size(200, 100),
            child: Text("fdhjsfghsdsdsdsdsddssfsfjsfghksjgdkjsgfjhdsgfhjgfhjdsgfhjsdfghjsfghksjgdkjsgfjhdsgfhjgfhjdsgfhfghjsfghksjgdkjsgfjhdsgfhjgfhjdsgfhfghjsfghksjgdkjsgfjhdsgfhjgfhjdsgfhfghjsfghksjgdkjsgfjhdsgfhjgfhjdsgfhgfjhdsgfhjsdgfjhh",
            overflow: TextOverflow.visible,),
          ),
      ),
    );
  }
}

class ShowTransform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 50,),
          Transform.rotate(
            angle: math.pi/4,
            child: Container(
                width: 100,
                height: 100,
                color:Colors.cyan
            ),
          ),
          SizedBox(height: 50,),
          Transform.translate(
            offset: Offset(50,0),
            child: Container(
                width: 100,
                height: 100,
                color:Colors.red
            ),
          ),
          SizedBox(height: 50,),
          Transform.scale(
            scale: 1.5,
            child: Container(
                width: 100,
                height: 100,
                color:Colors.black
            ),
          ),
        ],
      )
    );
  }
}


/*multi-child*multi-child*multi-child*multi-child
* *multi-child*multi-child*multi-child*multi-child
* *multi-child*multi-child*multi-child*multi-child
* *multi-child*multi-child*multi-child**/

/*A widget that displays its children in a horizontal array.

To cause a child to expand to fill the available horizontal
 space, wrap the child in an Expanded widget.*/
class ShowRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text('Deliver features faster', textAlign: TextAlign.center),
          ),
          Expanded(
            child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.fitHeight, // otherwise the logo will be tiny
              child: const FlutterLogo(),
            ),
          ),
        ],
      )
    );
  }
}

