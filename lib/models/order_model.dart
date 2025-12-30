import 'package:neeknots_admin/core/constants/string_constant.dart';

enum OrderStatus { pending, processing, shipped, onWay, delivered, cancelled }

class OrderModel {
  final String orderId;
  final String customerName;
  final DateTime orderDate;
  final double totalAmount;
  final List<OrderItem> items;
  final OrderStatus status;

  OrderModel({
    required this.orderId,
    required this.customerName,
    required this.orderDate,
    required this.totalAmount,
    required this.items,
    this.status = OrderStatus.pending,
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
    orderId: "ORD10001",
    customerName: "John Doe",
    orderDate: DateTime.now().subtract(const Duration(days: 1)),
    totalAmount: 150.75,
    status: OrderStatus.delivered,
    items: [
      OrderItem(
        productId: "PROD1",
        productName: "Product 1",
        imageUrl: productUrl,
        quantity: 2,
        price: 50.00,
      ),
      OrderItem(
        productId: "PROD2",
        productName: "Product 2",
        imageUrl: product_0,
        quantity: 1,
        price: 50.75,
      ),
    ],
  ),

  OrderModel(
    orderId: "ORD10002",
    customerName: "Jane Smith",
    orderDate: DateTime.now().subtract(const Duration(days: 2)),
    totalAmount: 200.00,
    status: OrderStatus.onWay,
    items: [
      OrderItem(
        productId: "PROD3",
        productName: "Product 3",
        imageUrl: product_1,
        quantity: 4,
        price: 50.00,
      ),
    ],
  ),

  OrderModel(
    orderId: "ORD10003",
    customerName: "Michael Brown",
    orderDate: DateTime.now().subtract(const Duration(days: 3)),
    totalAmount: 320.00,
    status: OrderStatus.pending,
    items: [
      OrderItem(
        productId: "PROD4",
        productName: "Product 4",
        imageUrl: product_2,
        quantity: 2,
        price: 160.00,
      ),
    ],
  ),

  OrderModel(
    orderId: "ORD10004",
    customerName: "Emily Johnson",
    orderDate: DateTime.now().subtract(const Duration(days: 4)),
    totalAmount: 99.99,
    status: OrderStatus.cancelled,
    items: [
      OrderItem(
        productId: "PROD5",
        productName: "Product 5",
        imageUrl: product_3,
        quantity: 1,
        price: 99.99,
      ),
    ],
  ),

  OrderModel(
    orderId: "ORD10005",
    customerName: "Robert Wilson",
    orderDate: DateTime.now().subtract(const Duration(days: 5)),
    totalAmount: 450.00,
    status: OrderStatus.delivered,
    items: [
      OrderItem(
        productId: "PROD6",
        productName: "Product 6",
        imageUrl: product_4,
        quantity: 3,
        price: 150.00,
      ),
    ],
  ),

  OrderModel(
    orderId: "ORD10006",
    customerName: "Sophia Taylor",
    orderDate: DateTime.now().subtract(const Duration(days: 6)),
    totalAmount: 275.50,
    status: OrderStatus.onWay,
    items: [
      OrderItem(
        productId: "PROD7",
        productName: "Product 7",
        imageUrl: product_5,
        quantity: 5,
        price: 55.10,
      ),
    ],
  ),

  OrderModel(
    orderId: "ORD10007",
    customerName: "Daniel Anderson",
    orderDate: DateTime.now().subtract(const Duration(days: 7)),
    totalAmount: 180.00,
    status: OrderStatus.pending,
    items: [
      OrderItem(
        productId: "PROD8",
        productName: "Product 8",
        imageUrl: product_6,
        quantity: 2,
        price: 90.00,
      ),
    ],
  ),

  OrderModel(
    orderId: "ORD10008",
    customerName: "Olivia Martinez",
    orderDate: DateTime.now().subtract(const Duration(days: 8)),
    totalAmount: 560.00,
    status: OrderStatus.delivered,
    items: [
      OrderItem(
        productId: "PROD9",
        productName: "Product 9",
        imageUrl: product_7,
        quantity: 4,
        price: 140.00,
      ),
    ],
  ),

  OrderModel(
    orderId: "ORD10009",
    customerName: "James Thomas",
    orderDate: DateTime.now().subtract(const Duration(days: 9)),
    totalAmount: 75.00,
    status: OrderStatus.cancelled,
    items: [
      OrderItem(
        productId: "PROD10",
        productName: "Product 10",
        imageUrl: product_8,
        quantity: 1,
        price: 75.00,
      ),
    ],
  ),

  OrderModel(
    orderId: "ORD10010",
    customerName: "Isabella White",
    orderDate: DateTime.now().subtract(const Duration(days: 10)),
    totalAmount: 999.99,
    status: OrderStatus.delivered,
    items: [
      OrderItem(
        productId: "PROD11",
        productName: "Product 11",
        imageUrl: product_9,
        quantity: 1,
        price: 999.99,
      ),
    ],
  ),

  OrderModel(
    orderId: "ORD10011",
    customerName: "William Harris",
    orderDate: DateTime.now().subtract(const Duration(days: 11)),
    totalAmount: 240.00,
    status: OrderStatus.onWay,
    items: [
      OrderItem(
        productId: "PROD12",
        productName: "Product 12",
        imageUrl: product_10,
        quantity: 3,
        price: 80.00,
      ),
    ],
  ),

  OrderModel(
    orderId: "ORD10012",
    customerName: "Ava Clark",
    orderDate: DateTime.now().subtract(const Duration(days: 12)),
    totalAmount: 130.00,
    status: OrderStatus.pending,
    items: [
      OrderItem(
        productId: "PROD13",
        productName: "Product 13",
        imageUrl: product_11,
        quantity: 2,
        price: 65.00,
      ),
    ],
  ),

  OrderModel(
    orderId: "ORD10013",
    customerName: "Ethan Lewis",
    orderDate: DateTime.now().subtract(const Duration(days: 13)),
    totalAmount: 360.00,
    status: OrderStatus.delivered,
    items: [
      OrderItem(
        productId: "PROD14",
        productName: "Product 14",
        imageUrl: product_12,
        quantity: 6,
        price: 60.00,
      ),
    ],
  ),

  OrderModel(
    orderId: "ORD10014",
    customerName: "Mia Walker",
    orderDate: DateTime.now().subtract(const Duration(days: 14)),
    totalAmount: 220.00,
    status: OrderStatus.onWay,
    items: [
      OrderItem(
        productId: "PROD15",
        productName: "Product 15",
        imageUrl: product_13,
        quantity: 4,
        price: 55.00,
      ),
    ],
  ),

  OrderModel(
    orderId: "ORD10015",
    customerName: "Alexander Hall",
    orderDate: DateTime.now().subtract(const Duration(days: 15)),
    totalAmount: 88.00,
    status: OrderStatus.cancelled,
    items: [
      OrderItem(
        productId: "PROD16",
        productName: "Product 16",
        imageUrl: product_14,
        quantity: 1,
        price: 88.00,
      ),
    ],
  ),

  OrderModel(
    orderId: "ORD10016",
    customerName: "Charlotte Allen",
    orderDate: DateTime.now().subtract(const Duration(days: 16)),
    totalAmount: 410.00,
    status: OrderStatus.delivered,
    items: [
      OrderItem(
        productId: "PROD17",
        productName: "Product 17",
        imageUrl: product_15,
        quantity: 5,
        price: 82.00,
      ),
    ],
  ),

  OrderModel(
    orderId: "ORD10017",
    customerName: "Benjamin Young",
    orderDate: DateTime.now().subtract(const Duration(days: 17)),
    totalAmount: 199.99,
    status: OrderStatus.pending,
    items: [
      OrderItem(
        productId: "PROD18",
        productName: "Product 18",
        imageUrl: product_16,
        quantity: 1,
        price: 199.99,
      ),
    ],
  ),

  OrderModel(
    orderId: "ORD10018",
    customerName: "Amelia King",
    orderDate: DateTime.now().subtract(const Duration(days: 18)),
    totalAmount: 540.00,
    status: OrderStatus.onWay,
    items: [
      OrderItem(
        productId: "PROD19",
        productName: "Product 19",
        imageUrl: product_18,
        quantity: 6,
        price: 90.00,
      ),
    ],
  ),

  OrderModel(
    orderId: "ORD10019",
    customerName: "Lucas Scott",
    orderDate: DateTime.now().subtract(const Duration(days: 19)),
    totalAmount: 60.00,
    status: OrderStatus.delivered,
    items: [
      OrderItem(
        productId: "PROD20",
        productName: "Product 20",
        imageUrl: product_2,
        quantity: 2,
        price: 30.00,
      ),
    ],
  ),
];
