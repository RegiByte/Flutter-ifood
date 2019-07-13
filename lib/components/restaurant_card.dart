import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ifoodclone/constants.dart';

class RestaurantCard extends StatelessWidget {
  final String name;
  final String picture;
  final String rating;
  final String foodType;
  final String distance;
  final String deliveryTime;
  final String deliveryPrice;
  final Key key;

  RestaurantCard({
    this.name,
    this.picture,
    this.rating,
    this.foodType,
    this.distance,
    this.deliveryTime,
    this.deliveryPrice,
    this.key,
  });

  Widget _dotSeparator() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(50),
      ),
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: 3,
      height: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      key: key,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.0),
        child: Card(
          elevation: 2.5,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[200]),
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: 80,
                  child: Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.0,
                          color: Colors.grey[200],
                        ),
                      ),
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: picture,
                          placeholder: (context, url) => Container(
                            height: 80,
                            width: 80,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) => Center(
                            child: Icon(Icons.error),
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                VerticalDivider(),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                              size: 15.0,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              rating,
                              style: TextStyle(
                                color: Colors.orangeAccent,
                                fontSize: 13,
                              ),
                            ),
                            _dotSeparator(),
                            Text(
                              foodType,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 13,
                              ),
                            ),
                            _dotSeparator(),
                            Text(
                              distance,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 13,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 1.0,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              deliveryTime,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                            _dotSeparator(),
                            Text(
                              deliveryPrice,
                              style: TextStyle(
                                color: deliveryPrice == kFreeDeliveryText
                                    ? Colors.green
                                    : Colors.black54,
                                fontSize: 12,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
