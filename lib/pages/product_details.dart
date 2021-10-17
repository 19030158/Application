import 'package:dailypickings/models/product.dart';
import 'package:dailypickings/models/variable_product.dart';
import 'package:dailypickings/pages/base_page.dart';
import 'package:dailypickings/widgets/widget_product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api_service.dart';

class ProductDetails extends BasePage {
  ProductDetails({Key key, this.product}) : super(key: key);

  Product product;

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends BasePageState<ProductDetails> {
  APIService apiService;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget pageUI() {
    return this.widget.product.type == "variable" ? _variableProductList() : ProductDetailsWidget(data: this.widget.product);
  }

  Widget _variableProductList() {
    apiService = new APIService();
    return new FutureBuilder(
      future: apiService.getVariableProducts(this.widget.product.id),
      builder: (BuildContext context, AsyncSnapshot<List<VariableProduct>> model) {
        if(model.hasData) {
          return ProductDetailsWidget(data: this.widget.product, variableProducts: model.data,);
        }

        return Center(child: CircularProgressIndicator(),);
      },
    );
  }
}
