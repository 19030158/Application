import 'package:dailypickings/provider/razor_payment_service.dart';
import 'package:dailypickings/widgets/widget_order_success.dart';
import 'package:flutter/material.dart';

class PaymentMethod {
  String id;
  String name;
  String description;
  String logo;
  String route;
  Function onTap;
  bool isRouteRedirect;

  PaymentMethod(
      this.id,
      this.name,
      this.description,
      this.logo,
      this.route,
      this.onTap,
      this.isRouteRedirect
      );
}

class PaymentMethodList {
  List<PaymentMethod> _paymentList;
  List<PaymentMethod> _cashList;

  PaymentMethodList(BuildContext context) {
    this._paymentList = [
      new PaymentMethod(
        "razorpay",
        "RazorPay",
        "Click to pay with RazorPay Method",
        "assets/img/razorpay.png",
        "/RazorPay",
            () {
          RazorPaymentService razorPaymentService = new RazorPaymentService();
          razorPaymentService.initPaymentGateway(context);
          razorPaymentService.getPayment(context);
            },
        false,
      ),
      new PaymentMethod(
          "paypal",
          "PayPal",
          "Click to pay with PayPal Method",
          "assets/img/paypal.png",
          "/PayPal",
      () {},
      true,
      ),
    ];
    this._cashList = [
      new PaymentMethod(
          "cod",
          "Cash on Delivery",
          "Click to pay cash on delivery",
          "assets/img/cash.png",
          "/OrderSuccess",
      () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => OrderSuccessWidget()),
        ModalRoute.withName("/OrderSuccess"));
      },
      false,
      ),
    ];
  }
  List<PaymentMethod> get paymentsList => _paymentList;
  List<PaymentMethod> get cashList => _cashList;

}