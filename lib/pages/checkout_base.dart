import 'package:dailypickings/provider/loader_provider.dart';
import 'package:dailypickings/utils/ProgressHUD.dart';
import 'package:dailypickings/widgets/widget_checkpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutBasePage extends StatefulWidget {
  @override
  CheckoutBasePageState createState() => CheckoutBasePageState();
}

class CheckoutBasePageState<T extends CheckoutBasePage> extends State<T> {
  int currentPage = 0;
  bool showBackButton = true;

  @override
  void initState() {
    super.initState();
    print('CheckoutBasePage: initState()');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoaderProvider>(
      builder: (context, loaderModel, child) {
        return Scaffold(
          appBar: _buildAppBar(),
          backgroundColor: Colors.white,
          body: ProgressHUD(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Checkpoints(
                    checkedTill: currentPage,
                    checkpoints: [
                      "Shipping",
                      "Payment",
                      "Order"
                    ],
                    checkpointFilledColor: Colors.green,
                  ),
                  Divider(color: Colors.grey),
                  pageUI()
                ],
              ),
            ),
            inAsyncCall: loaderModel.isApiCallProcess,
            opacity: 0.3,
          ),
        );
      }
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      brightness: Brightness.dark,
      elevation: 0,
      backgroundColor: Colors.redAccent,
      automaticallyImplyLeading: showBackButton,
      title: Text(
        "Checkout",
        style: TextStyle(color: Colors.white),
      ),
      actions: <Widget>[

      ],
    );
  }

  Widget pageUI() {
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
