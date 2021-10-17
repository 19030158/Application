import 'package:dailypickings/models/cart_response_model.dart';
import 'package:dailypickings/pages/verify_address.dart';
import 'package:dailypickings/provider/cart_provider.dart';
import 'package:dailypickings/provider/loader_provider.dart';
import 'package:dailypickings/utils/ProgressHUD.dart';
import 'package:dailypickings/widgets/widget_cart_product.dart';
import 'package:dailypickings/widgets/widget_order_success.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    var cartItemsList = Provider.of<CartProvider>(context, listen: false);
    cartItemsList.resetStreams();
    cartItemsList.fetchCartItems();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<LoaderProvider>(
        builder: (context,loaderModel,child) {
      return Scaffold(
        body: ProgressHUD(
          child: _cartItemsList(),
          inAsyncCall: loaderModel.isApiCallProcess,
          opacity: 0.3,

      ));
    });

  }

  Widget _productsList() {
    return new Consumer<CartProvider>(
      builder: (context, cartModel, child) {
        if (cartModel.CartItems != null && cartModel.CartItems.length > 0) {

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                      itemCount: cartModel.CartItems.length,
                      itemBuilder: (context, index) {
                        var data = cartModel.CartItems[index];
                        return CartProduct(data: data);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(
                                Icons.sync,
                                color: Colors.white,
                              ),
                              Text(
                                'Update Cart',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          onPressed: () {
                            var loaderProvider = Provider.of<LoaderProvider>(
                                context,
                                listen: false);
                            loaderProvider.setLoadingStatus(true);

                            var cartProvider = Provider.of<CartProvider>(
                                context,
                                listen: false);
                            cartProvider.updateCart(
                                  (val) {
                                loaderProvider.setLoadingStatus(false);
                                // Utils.displaySnackBar(
                                //   context, "Cart Updated.", scaffoldKey);
                              },
                            );
                          },
                          padding: EdgeInsets.all(15),
                          color: Colors.green,
                          shape: StadiumBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            new Text(
                              "Total",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            new Text(
                              "\$${cartModel.totalAmount}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        FlatButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Checkout",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                //builder: (context) => VerifyAddress(),
                              ),
                            );
                          },
                          padding: EdgeInsets.all(15),
                          color: Colors.redAccent,
                          shape: StadiumBorder(),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
    }
    );
  }

  Widget _cartItemsList() {
    return new Consumer<CartProvider>(
      builder: (context, cartModel, child) {
        if(cartModel.CartItems != null && cartModel.CartItems.length > 0) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: cartModel.CartItems.length,
                    itemBuilder: (context, index)
                    {
                      return CartProduct(data: cartModel.CartItems[index]);
                    }
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.sync,
                              color: Colors.white,
                            ),
                            Text(
                              "Update Cart",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        onPressed: (){},
                        padding: EdgeInsets.all(15),
                        color: Colors.green,
                        shape: StadiumBorder(),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              new Text(
                                '\$${cartModel.totalAmount}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              new Text(
                                "\$${cartModel.totalAmount}",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          FlatButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Checkout",
                                style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VerifyAddress()
                                ),
                              );
                            },
                            padding: EdgeInsets.all(15),
                            color: Colors.redAccent,
                            shape: StadiumBorder(),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        } else {
          return Container();
        }
    }
    );
  }
}
