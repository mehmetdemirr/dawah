import 'package:auto_route/auto_route.dart';
import 'package:davet/product/bottom_navigation/viewmodel/bottom_navigation_viewmodel.dart';
import 'package:davet/product/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});
  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  List<Widget> screenList = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];
  Color inactiveColor = const Color.fromARGB(255, 161, 163, 168);
  Color activeColor = const Color.fromRGBO(45, 49, 66, 1);
  @override
  Widget build(BuildContext context) {
    var state = context.watch<BottomNavigationViewModel>();
    return Scaffold(
      extendBody: true,
      body: screenList[state.selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Stack(
        clipBehavior: Clip.none, // Gölgenin taşmasına izin verir
        children: [
          Positioned(
            bottom: -10, // Gölgenin sadece alt tarafta görünmesini sağlar
            child: Container(
              width: 56, // Buton genişliği
              height: 77, // Buton yüksekliği
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.7), // Gölge rengi
                    spreadRadius: 0, // Yayılma mesafesi
                    blurRadius: 4, // Gölgenin bulanıklığı
                    offset:
                        const Offset(0, 5), // Gölgenin alt tarafa konumlanması
                  ),
                ],
              ),
            ),
          ),
          FloatingActionButton(
            backgroundColor: const Color.fromRGBO(28, 28, 28, 1),
            onPressed: () {
              context.read<BottomNavigationViewModel>().changeSelectedIndex(2);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 1, // Varsayılan gölgeyi kapatır
            child: const Text(
              "d",
              style: TextStyle(
                fontFamily: 'Akasi',
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        notchMargin: 10,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home_outlined,
                color: state.selectedIndex == 0 ? activeColor : inactiveColor,
              ),
              onPressed: () {
                context
                    .read<BottomNavigationViewModel>()
                    .changeSelectedIndex(0);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.diversity_3,
                color: state.selectedIndex == 1 ? activeColor : inactiveColor,
              ),
              onPressed: () {
                context
                    .read<BottomNavigationViewModel>()
                    .changeSelectedIndex(1);
              },
            ),
            const SizedBox(
              width: 2,
            ),
            IconButton(
              icon: Icon(
                Icons.account_balance_outlined,
                color: state.selectedIndex == 3 ? activeColor : inactiveColor,
              ),
              onPressed: () {
                context
                    .read<BottomNavigationViewModel>()
                    .changeSelectedIndex(3);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.account_circle_outlined,
                color: state.selectedIndex == 4 ? activeColor : inactiveColor,
              ),
              onPressed: () {
                context
                    .read<BottomNavigationViewModel>()
                    .changeSelectedIndex(4);
              },
            ),
          ],
        ),
      ),
    );
  }
}
