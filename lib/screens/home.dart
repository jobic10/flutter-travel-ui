import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];
  int _selectedIndex = 0;

  Widget _buildIcon(int index) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: GestureDetector(
        child: Icon(
          _icons[index],
          size: 25,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Colors.grey,
        ),
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 120),
              child: Text(
                'What would you like to find',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (e) => _buildIcon(
                      (e.key),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
