import 'package:neeknots_admin/core/constants/string_constant.dart';

class OrderModel {
  final String orderId;
  final String customerName;
  final DateTime orderDate;
  final double totalAmount;
  final List<OrderItem> items;
  OrderModel({
    required this.orderId,
    required this.customerName,
    required this.orderDate,
    required this.totalAmount,
    required this.items,
  });
}

class OrderItem {
  final String productId;
  final String productName;
  final String imageUrl;
  final int quantity;
  final double price;
  OrderItem({
    required this.productId,
    required this.productName,
    required this.imageUrl,
    required this.quantity,
    required this.price,
  });
}

List<OrderModel> sampleOrders = [
  OrderModel(
    orderId: "ORD12345",
    customerName: "John Doe",
    orderDate: DateTime.now().subtract(const Duration(days: 1)),
    totalAmount: 150.75,
    items: [
      OrderItem(
        productId: "PROD1",
        productName: "Product 1",
        imageUrl: productImage_1,
        quantity: 2,
        price: 50.00,
      ),
      OrderItem(
        productId: "PROD2",
        productName: "Product 2",
        imageUrl: productImage,
        quantity: 1,
        price: 50.75,
      ),
    ],
  ),
  OrderModel(
    orderId: "ORD12346",
    customerName: "Jane Smith",
    orderDate: DateTime.now().subtract(const Duration(days: 2)),
    totalAmount: 200.00,
    items: [
      OrderItem(
        productId: "PROD3",
        productName: "Product 3",
        imageUrl: productImage,
        quantity: 4,
        price: 50.00,
      ),
    ],
  ),
];
