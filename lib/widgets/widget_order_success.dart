import 'package:dailypickings/models/order.dart';
import 'package:dailypickings/pages/checkout_base.dart';
import 'package:dailypickings/pages/home_page.dart';
import 'package:dailypickings/provider/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderSuccessWidget extends CheckoutBasePage {
  @override
  _OrderSuccessWidgetState createState() => _OrderSuccessWidgetState();
}

class _OrderSuccessWidgetState extends CheckoutBasePageState<OrderSuccessWidget> {
  @override
  void initState() {
    this.currentPage = 2;
    this.showBackButton = false;

    var orderProvider = Provider.of<CartProvider>(context, listen: false);
    OrderModel orderModel = new OrderModel();
    orderModel.paymentMethod = "cod";
    orderModel.paymentMethodTitle = "Cash on Delivery";
    orderModel.setPaid = true;
    orderModel.transactionId = "";//response.paymentId.toString();
    orderProvider.processOrder(orderModel);
    orderProvider.createOrder();

    super.initState();
  }

  @override
  Widget pageUI() {
    return Consumer<CartProvider>(
      builder: (context, orderModel, child) {
        if (orderModel.isOrderCreated) {
          return Center(
            child: Container(
              margin: EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 150,
                          height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                           gradient: LinearGradient(
                             begin: Alignment.bottomLeft,
                             end: Alignment.topRight,
                          colors: [
                            Colors.green.withOpacity(1),
                            Colors.green.withOpacity(0.2),
                          ],
                        ),
                      ),
                        child: Icon(Icons.check,
                        color: Colors.white,
                        size: 90,
                        ),
                      )
                    ]
                  ),
                  SizedBox(height: 15,),
                  Opacity(
                    opacity: 0.6,
                    child: Text(
                      "Your order has been successfully submitted!",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  SizedBox(height: 20,),
                  FlatButton(
                    child: Text("Done",
                    style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), ModalRoute.withName("/Home")
                      );
                    },
                    padding: EdgeInsets.all(15),
                    color: Colors.green,
                  )
                ],
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}