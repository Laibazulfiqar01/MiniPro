import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../colors/colors.dart';

class GroceryHomePage extends StatefulWidget {
  const GroceryHomePage({super.key});

  @override
  State<GroceryHomePage> createState() => _GroceryHomeState();
}

class _GroceryHomeState extends State<GroceryHomePage> {
  List<dynamic> xyz = [
    {
      "nameplate": 'assets/images/Group 01.png',
      "searchbar": 'assets/images/searchbar.png',
      "text": 'assets/images/Text.png',
      "Recommeded": 'Recommended',
    },
    {
      "nameplate": 'assets/images/Group 01.png',
      "searchbar": 'assets/images/searchbar.png',
      "text": 'assets/images/Text.png',
    },
  ];
  final PageController _pageController = PageController(initialPage: 0);
  bool showBanner = true;
  bool recomendedText = true;
  bool productImage = true;

  // Banner on the first screen.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 350,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              itemCount: xyz.length,
              onPageChanged: (int page) {
                setState(() {
                  recomendedText = page == 0;
                  productImage = page == 0;
                  showBanner = page == 0;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  height: 250,
                  width: 450,
                  color: screenOneColor,
                  child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.fromLTRB(5, 70, 6 0)),
                      Image.asset(xyz[index]['nameplate']),
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset(xyz[index]['searchbar']),
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset(xyz[index]['text']),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          savings(),
          if (showBanner) bannerCard(),
          const SizedBox(
            height: 25,
          ),
          if (recomendedText)
            const Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 15, 0),
              child: Text("Recommended",
                  style: TextStyle(
                    fontSize: 35,
                  )),
            ),
          const SizedBox(
            height: 16,
          ),
          if (productImage) Image.asset('assets/images/Products.png'),
          const SizedBox(
            height: 35,
          ),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget bannerCard() {
    return CarouselSlider(
      items: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: const DecorationImage(
              image: AssetImage('assets/images/Card.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
      options: CarouselOptions(
        height: 150.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayAnimationDuration: const Duration(milliseconds: 700),
        viewportFraction: 0.8,
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: "Category",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "Favorites",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_vert),
          label: "More",
        ),
      ],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );
  }

  Widget savings() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: const DecorationImage(
          image: AssetImage('assets/images/totalsavings.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
