import 'package:flutter/material.dart';
import 'package:k_tech/Models/LocalModels.dart' as Model;



class ShopItem extends StatefulWidget {
  final String shopName;
  final String shopPhoto;

  const ShopItem({Key key, this.shopName, this.shopPhoto}) : super(key: key);
//  final Color color;
//  final IconData icon;

//  const ShopItem({Key key, this.color, this.icon}) : super(key: key);

  @override
  _ShopItem createState() => _ShopItem();
}

class _ShopItem extends State<ShopItem> {
  @override
  Widget build(BuildContext context) {
    double iconSize = (MediaQuery.of(context).size.width - 80) / 2;
    // TODO: implement build
    return Card(
      elevation: 5,
      child: Container(
        width: iconSize,
        height: iconSize + 80,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 5),
              height: iconSize - 25,
              width: iconSize,
              child: Image.asset('${widget.shopPhoto}'),
            ),
            Container(alignment: Alignment.center,child: Container(alignment: Alignment.center,padding: EdgeInsets.fromLTRB(10, 10, 10, 0),child: Text(widget.shopName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,wordSpacing: 0.1,),softWrap: false,))),
          ],
        )
      ),
    );
  }
}