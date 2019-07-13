import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ifoodclone/components/category_card.dart';
import 'package:ifoodclone/components/highlight_card.dart';
import 'package:ifoodclone/components/restaurant_card.dart';
import 'package:ifoodclone/constants.dart';
import 'package:ifoodclone/models/category.dart';
import 'package:ifoodclone/models/highlight.dart';
import 'package:ifoodclone/models/restaurant.dart';

class ListRestaurants extends StatefulWidget {
  static String id = 'list_restaurants';

  @override
  _ListRestaurantsState createState() => _ListRestaurantsState();
}

class _ListRestaurantsState extends State<ListRestaurants> {
  bool _loading = false;
  List<Category> _categories = [];
  List<Highlight> _highlights = [];
  List<Restaurant> _restaurants = [];

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _loading = true;
    });

    List<Category> categories = [];
    List<Highlight> highlights = [];
    List<Restaurant> restaurants = [];

    if (_categories.length < 1) {
      categories = await _loadCategories();
    }

    if (_highlights.length < 1) {
      highlights = await _loadHighlights();
    }
    if (_restaurants.length < 1) {
      restaurants = await _loadRestaurants();
    }

    setState(() {
      _categories = categories.length > 1 ? categories : _categories;
      _highlights = highlights.length > 1 ? highlights : _highlights;
      _restaurants = restaurants.length > 1 ? restaurants : _restaurants;
      _loading = false;
    });
  }

  Future<List<Category>> _loadCategories() async {
    List<dynamic> json =
        jsonDecode(await rootBundle.loadString('assets/categories.json'));
    List<Category> categories = [];

    for (var category in json) {
      categories.add(Category.fromJson(category));
    }

    return categories;
  }

  Future<List<Highlight>> _loadHighlights() async {
    List<dynamic> json =
        jsonDecode(await rootBundle.loadString('assets/highlights.json'));
    List<Highlight> highlights = [];

    for (var category in json) {
      highlights.add(Highlight.fromJson(category));
    }

    return highlights;
  }

  Future<List<Restaurant>> _loadRestaurants() async {
    List<dynamic> json =
        jsonDecode(await rootBundle.loadString('assets/restaurants.json'));
    List<Restaurant> restaurants = [];

    for (var restaurant in json) {
      restaurants.add(Restaurant.fromJson(restaurant));
    }

    return restaurants;
  }

  Widget _buildHighlights() {
    return Container(
      height: 190.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _highlights.length,
          itemBuilder: (BuildContext context, int index) {
            Highlight highlight = _highlights[index];

            return HighlightCard(
              key: Key('${highlight.title}_${highlight.tip}'),
              tip: highlight.tip,
              picture: highlight.picture,
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 145,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 15.0, bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    Category category = _categories[index];

                    return CategoryCard(
                      key: Key('${category.name}_${category.picture}'),
                      name: category.name,
                      picture: category.picture,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRestaurants() {
    return SliverFixedExtentList(
      itemExtent: 108.0,
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          Restaurant restaurant = _restaurants[index];

          return RestaurantCard(
            key: Key('${restaurant.name}_${restaurant.picture}'),
            picture: restaurant.picture,
            name: restaurant.name,
            deliveryPrice: restaurant.deliveryPrice,
            deliveryTime: restaurant.deliveryTime,
            distance: restaurant.distance,
            foodType: restaurant.foodType,
            rating: restaurant.rating,
          );
        },
        childCount: _restaurants.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Container(
            color: kBackgroundColor,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.white,
                  expandedHeight: 80.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'ENTREGAR EM',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: kBrandDarkenGrey,
                                  fontSize: 17.0,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Av. Brasil, 123',
                                    style: TextStyle(
                                        color: kBrandDarkerGrey,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: kBrandRed,
                                    size: 18.0,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  floating: false,
                  delegate: _SliverAppBarDelegate(
                    AppBar(
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      centerTitle: false,
                      title: Container(
                        decoration: BoxDecoration(
                          color: kBrandGrey,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            icon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.search,
                                color: kBrandRed,
                              ),
                            ),
                            hintText: 'Prato ou restaurante',
                            hintStyle: TextStyle(color: kBrandDarkGrey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Center(
                            child: Text(
                              'Filtros',
                              style: TextStyle(
                                color: kBrandRed,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                if (_loading)
                  SliverList(
                    delegate: SliverChildListDelegate(
                      <Widget>[
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 5,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else ...[
                  SliverToBoxAdapter(
                    child: _buildHighlights(),
                  ),
                  SliverToBoxAdapter(
                    child: _buildCategories(),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Restaurantes',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  _buildRestaurants()
                ],
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black45,
          selectedItemColor: Colors.black87,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Início'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Busca'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.description),
              title: Text('Pedidos'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              title: Text('Perfil'),
            ),
          ]),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final AppBar _appBar;

  _SliverAppBarDelegate(this._appBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _appBar,
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
