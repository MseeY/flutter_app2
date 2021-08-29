import 'package:flutter/material.dart';
import 'package:flutter_app2/core/models/collection_model.dart';
import 'package:flutter_app2/core/viewmodels/collection_provider.dart';
import 'package:provider/provider.dart';

class CollectionItem extends StatelessWidget {
  final CollectionModel collection;
  CollectionItem({
    required this.collection
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _imageCover(),
        _gradientBlack(),
        _titleCount()
      ],
    );
  }

  Widget _imageCover() {
    return Container(
      width: 120,
      height: 150,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: NetworkImage(collection.imgURL.toString()),
          fit: BoxFit.cover
        )
      ),
    );
  }

  Widget _gradientBlack() {
    return Container(
      width: 120,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black87.withOpacity(0.8)
          ]
        )
      ),
    );
  }

  Widget _titleCount() {

    return Builder(
      builder: (context) {

        return Consumer<CollectionProvider>(
          builder: (context, collectionProv, _) {

            return Container(
              width: 120,
              height: 150,
              child: Material(
                type: MaterialType.transparency,
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => collectionProv.goToRestaurantList(collection, context),
                  borderRadius: BorderRadius.circular(5),
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          collection.title.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          "${collection.count} tempat",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}