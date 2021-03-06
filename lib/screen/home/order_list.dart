import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/model/order.dart';
import 'package:flutter_firebase/model/user.dart';
import 'package:flutter_firebase/screen/home/order_tile.dart';
import 'package:provider/provider.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {

    final orders = Provider.of<List<Order>>(context) ?? [];  // using data from the stream that in database, and QuerySnapshot is datatype

    final user = Provider.of<User>(context);

    return ListView.builder(
        itemCount: orders.length,
        itemBuilder:(context,index){
         Order order= orders[index] ;
          return OrderTile(order:order, isOwner: order.documentId == user.uid,);
        });
  }
}
