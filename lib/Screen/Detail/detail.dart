import 'package:prism/Screen/FormPage/form_page.dart';
import 'package:prism/Widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class DetailPage extends StatelessWidget {
  DetailPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: Color.fromARGB(51, 27, 216, 216),
            value: 3,
            valueColor: AlwaysStoppedAnimation(Colors.yellowAccent)),
      ),
    );

    final coursePrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text(
        "\$" + "34".toString(),
        style: TextStyle(color: Colors.white),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0),
        Icon(
          Icons.directions_car,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.yellowAccent),
        ),
        SizedBox(height: 10.0),
        Text(
          "Civic",
          style: TextStyle(color: Colors.white, fontSize: 45.0),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 1, child: levelIndicator),
            Expanded(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Damage",
                      style: TextStyle(color: Colors.white),
                    ))),
            // Expanded(flex: 1, child: coursePrice)
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage(
                    "assets/images/detail_car.jpg"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromARGB(227, 58, 91, 97)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      "oasjdionioansdkmaosdomaodnklandiomakldononomnononononoasjdionioansdkmaosdomaodnklandiomakldononomnononononoasjdionioansdkmaosdomaodnklandiomakldononomnononononoasjdionioansdkmaosdomaodnklandiomakldononomnononononoasjdionioansdkmaosdomaodnklandiomakldononomnononononoasjdionioans",
      style: TextStyle(fontSize: 18.0),
    );
    var width = MediaQuery.of(context).size.width;
    final readButton = Container(
      
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: AppButton(
          width:width ,
            opTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => FormPage())));
            },
            buttonName: "OPEN FORM"));
    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
        ),
      ),
    );

    return Scaffold(
      
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
