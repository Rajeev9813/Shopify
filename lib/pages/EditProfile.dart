import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profie"),
        leading: IconButton(
          icon: Icon(
            Icons. arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: (){},
          )
        ],
      ),
          body: Container(
        padding: EdgeInsets.only(left: 15, top: 20,right: 15),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1)
                              )
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                               'https://cdn.pixabay.com/photo/2023/05/05/18/26/child-7972995_1280.jpg'
                              )
                            )
                          ),
                        ),
                        Positioned(
                           bottom: 0,
                           right: 0,
                           child:Container(
                             height: 40,
                               width: 40,
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 border: Border.all(
                                   width: 4,
                                   color: Colors.white
                                 ),
                                 color: Colors.blue
                               ),
                             child: Icon(
                               Icons.edit,
                               color: Colors.white,   //// to be completed
                             ),

            ),
                         )
                      ],
                    ),
                  )
                ],
              ),
            ),
    ),
    );
  }
}
