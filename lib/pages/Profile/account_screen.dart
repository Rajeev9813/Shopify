import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jutta_junction/pages/login_page.dart';
import 'package:jutta_junction/viewmodels/auth_viewmodel.dart';
import 'package:jutta_junction/viewmodels/global_ui_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  void logout() async {
    _ui.loadState(true);
    try {
      await _auth.logout().then((value) {
        Navigator.of(context).pushReplacementNamed('/login');
      }).catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message.toString()),
          backgroundColor: Colors.purpleAccent,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(50),
          elevation: 20,
        ));
      });
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.toString()),
        backgroundColor: Colors.purpleAccent,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(50),
        elevation: 20,
      ));
    }
    _ui.loadState(false);
  }

  late GlobalUIViewModel _ui;
  late AuthViewModel _auth;
  @override
  void initState() {
    _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
    _auth = Provider.of<AuthViewModel>(context, listen: false);
    super.initState();
  }

  double rating = 0;
  createRating() {
    return SizedBox(
      child: RatingBar.builder(
        initialRating: rating,
        minRating: 1,
        itemSize: 35,
        itemPadding: EdgeInsets.symmetric(horizontal: 1),
        itemBuilder: (context, _) => Icon(
          CupertinoIcons.heart_fill,
          color: Colors.redAccent,
        ),
        updateOnDrag: true,
        onRatingUpdate: (rating) => setState(() {
          this.rating = rating;
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text("Your Profile"),
      //   backgroundColor: Colors.purple,
      //   actions: [
      //     IconButton(
      //         icon: const Icon(Icons.sell),
      //         tooltip: 'Open shopping cart',
      //         onPressed: () {
      //           Navigator.of(context).pushNamed("/my-products");
      //         })
      //   ],
      // ),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new)
              .iconColor(Color.fromARGB(255, 255, 255, 255))
              .box
              .make(),
          onPressed: () {
            Navigator.pushNamed(context, "/NewHomePage");
          },
        ),
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.sell),
              tooltip: 'Open shopping cart',
              onPressed: () {
                Navigator.of(context).pushNamed("/my-products");
              })
        ],
      ),
      body: Container(
        color: Color(0xFFD6D6D6),
        child: ListView(
          children: [colorTiles(), bwTiles(), logoutButton()],
        ),
      ),
    );
  }
Widget divider() {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Divider(
        thickness: 1.5,
      ),
    );
  }

  Widget colorTiles() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                child: Icon(Icons.person_outline, color: Colors.deepPurple),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withOpacity(0.09),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              title: Text("Personal Data",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              trailing:
                  Icon(Icons.arrow_forward_ios, color: Colors.purple, size: 20),
              onTap: () {
                Navigator.of(context).pushNamed("/your_profile");
              },
            ),
            divider(),
            ListTile(
              leading: Container(
                child: Icon(Icons.email_outlined, color: Colors.blue),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.09),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              title: Text("Change your email",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              trailing:
                  Icon(Icons.arrow_forward_ios, color: Colors.purple, size: 20),
              onTap: () {
                Navigator.of(context).pushNamed("/change_email");
              },
            ),
            divider(),
            ListTile(
              leading: Container(
                child: Icon(Icons.password_outlined, color: Colors.pink),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.pink.withOpacity(0.09),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              title: Text("Change your password",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              trailing:
                  Icon(Icons.arrow_forward_ios, color: Colors.purple, size: 20),
              onTap: () {
                Navigator.of(context).pushNamed("/changepassRoute");
              },
            ),
            divider(),
            ListTile(
              leading: Container(
                child: Icon(Icons.location_city, color: Colors.orange),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.09),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              title: Text("Change your address",
                  style: TextStyle(fontWeight: FontWeight.w700)),
              trailing:
                  Icon(Icons.arrow_forward_ios, color: Colors.purple, size: 20),
              onTap: () {
                Navigator.of(context).pushNamed("/change_address");
              },
            ),
          ],
        ),
      ),
    );
  }
