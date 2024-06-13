import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ShellPage extends StatefulWidget {
  const ShellPage({super.key});

  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: RouterOutlet(),
          ),
          BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });

              if (value == 1) {
                return Modular.to.navigate('/pets');
              }
            },
            fixedColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.pets),
                label: 'Pets',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.location_on),
                label: 'Localizar',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.support),
                label: 'Apoio',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Perfil',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
