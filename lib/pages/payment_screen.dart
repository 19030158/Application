import 'package:dailypickings/models/payment_methods.dart';
import 'package:dailypickings/pages/base_page.dart';
import 'package:dailypickings/pages/checkout_base.dart';
import 'package:dailypickings/widgets/widget_payment_method_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends BasePage {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends BasePageState<PaymentScreen> {
  PaymentMethodList list;

  @override
  void initState() {
    super.initState();
    this.currentPage = 1;
  }

  @override
  Widget pageUI() {
    list = new PaymentMethodList(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 15),
          list.paymentsList.length > 0
              ? Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              leading: Icon(
                Icons.payment,
                color: Theme.of(context).hintColor,
              ),
              title: Text(
                "Payment Options",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline4,
              ),
              subtitle: Text("Select your preferred Payment"),
            ),
          )
              : SizedBox(height: 0),
          SizedBox(height: 10),
          ListView.separated(
            scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
              return PaymentMethodListItem(
                  paymentMethod: list.paymentsList.elementAt(index)
              );
              },
              separatorBuilder: (context, index) {
              return SizedBox(height: 10);
              },
              itemCount: list.paymentsList.length,
          ),
          SizedBox(height: 15),
          list.cashList.length > 0
              ? Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              leading: Icon(
                Icons.monetization_on,
                color: Theme.of(context).hintColor,
              ),
              title: Text(
                "Cash on Delivery",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline4,
              ),
              subtitle: Text("Pay cash when your items get delivered"),
            ),
          )
              : SizedBox(height: 0),
          ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              return PaymentMethodListItem(
                paymentMethod: list.cashList.elementAt(index),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10);
            },
            itemCount: list.cashList.length,
          ),
        ],
      ),
    );
  }
}
