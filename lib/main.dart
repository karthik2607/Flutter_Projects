import 'package:FirstProject/home_page.dart';
import 'package:FirstProject/profile_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp( Myapp());
}


class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primarySwatch: Colors.green
      ),
       home:RootPage(),
    );
  }
}
class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentpage=0;
  List<Widget>Pages=[
    HomePage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
      ),
      body: Pages[currentpage],
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          debugPrint("Floating action Button");
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [NavigationDestination(icon: Icon(Icons.home), label: "Home"),
                       NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onDestinationSelected: (int index){
          setState(() {
            currentpage=index;
          });
        },
        selectedIndex: currentpage,
      ),



    );
  }
}



