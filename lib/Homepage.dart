import 'package:employee/Usermodel.dart';
import 'package:employee/api_service.dart';
import 'package:employee/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FetchUser _userList=FetchUser();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text('UserList'),
      actions: [
        IconButton(onPressed: ()
              {
                showSearch(context: context, delegate: SearchUser());
              },
              icon: Icon(Icons.search_sharp),
            )
      ],),
      body: Container(
        child: FutureBuilder<List<userlist>>(
          future: _userList.getUserList(),
          builder: (context, snapshot) {
            var data=snapshot.data; 
             if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
            return ListView.builder(itemCount: data?.length,itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                      title: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text('${data?[index].id}',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(
                                        '${data?[index].name}',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                    Text('${data?[index].email}'),
                  ],)
                ],
              )));
            });
          }
        ),
      ),
    ));
  }
}
