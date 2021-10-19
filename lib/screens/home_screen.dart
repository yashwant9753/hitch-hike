import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hitch_hike/blocks/application_block.dart';
import 'package:hitch_hike/res/custom_colors.dart';
import 'package:hitch_hike/screens/user_form.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, User user})
      : _user = user,
        super(key: key);
  final User _user;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User _user;
  final FocusNode _searchNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 50,
                      color: Palette.firebaseGrey,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget._user.displayName,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          widget._user.email,
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ],
                    )
                  ],
                )),
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('All Activities'),
              onTap: () {
                print(widget._user.uid.runtimeType);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Userform(
                            user: _user,
                          )),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Account'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => UserInfoScreen(
                //             user: _user,
                //           )),
                // );
              },
            ),
            ListTile(
              leading: Icon(Icons.rate_review),
              title: Text('Rate this App'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => RateApp(user: _user)),
                // );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: TextField(
            focusNode: _searchNode,
            decoration: InputDecoration(
                hintText: "Search Location",
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          )),
      body: (applicationBloc.currentLocation == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: GoogleMap(
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                initialCameraPosition: CameraPosition(
                    target: LatLng(applicationBloc.currentLocation.latitude,
                        applicationBloc.currentLocation.longitude),
                    zoom: 14),
              ),
            ),
    );
  }
}
