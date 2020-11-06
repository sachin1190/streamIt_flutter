import 'package:flutter/material.dart';

class HeaderWidgetPurp extends StatelessWidget {
  Color grad1 = Color.fromARGB(238, 58, 136, 1);
  Color grad2 = Color.fromARGB(128, 162, 245, 1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        shadowColor: Colors.purpleAccent,
        elevation: 4,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "MOVIES",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  elevation: 4,
                  child: Container(
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.lightBlueAccent,
                        ),
                        onPressed: null),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          height: 75,
          decoration: BoxDecoration(
              gradient: LinearGradient(stops: [
            0.3,
            1.0
          ], colors: [
            Colors.purpleAccent.withOpacity(0.7),
            Colors.lightBlueAccent.withOpacity(.8)
          ])),
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        shadowColor: Colors.deepOrange,
        elevation: 4,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "TV SHOWS",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  elevation: 4,
                  child: Container(
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.orange,
                        ),
                        onPressed: null),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          height: 75,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  stops: [0.3, 0.9],
                  colors: [Colors.deepOrangeAccent, Colors.orange])),
        ),
      ),
    );
  }
}
