import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HighlightCard extends StatelessWidget {
  final Key key;
  final String picture;
  final String tip;

  HighlightCard({
    this.key,
    @required this.picture,
    @required this.tip,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5.0,
        right: 5.0,
        bottom: 5.0,
      ),
      key: key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              width: 280.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: picture,
                  placeholder: (context, url) => Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: Icon(
                      Icons.error,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            tip,
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}
