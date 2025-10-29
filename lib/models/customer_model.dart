import 'package:neeknots_admin/core/constants/string_constant.dart';

class CustomerModel {
  final String name;
  final String email;
  final String imageUrl;
  final DateTime joinedDate;
  final int totalOrders;
  final double totalSpent;
  CustomerModel({
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.joinedDate,
    required this.totalOrders,
    required this.totalSpent,
  });
}

List<CustomerModel> sampleCustomers = [
  CustomerModel(
    name: "John Doe",
    email: "john.doe@example.com",
    imageUrl: productImage,
    joinedDate: DateTime.now().subtract(const Duration(days: 10)),
    totalOrders: 8,
    totalSpent: 1250.50,
  ),
  CustomerModel(
    name: "Jane Smith",
    email: "jane.smith@example.com",
    imageUrl: productImage_1,
    joinedDate: DateTime.now().subtract(const Duration(days: 25)),
    totalOrders: 5,
    totalSpent: 780.00,
  ),
  CustomerModel(
    name: "Michael Brown",
    email: "michael.brown@example.com",
    imageUrl: productImage,
    joinedDate: DateTime.now().subtract(const Duration(days: 45)),
    totalOrders: 12,
    totalSpent: 2050.75,
  ),
  CustomerModel(
    name: "Emily Johnson",
    email: "emily.johnson@example.com",
    imageUrl: productImage_1,
    joinedDate: DateTime.now().subtract(const Duration(days: 5)),
    totalOrders: 3,
    totalSpent: 320.00,
  ),
  CustomerModel(
    name: "David Williams",
    email: "david.williams@example.com",
    imageUrl: productImage,
    joinedDate: DateTime.now().subtract(const Duration(days: 60)),
    totalOrders: 15,
    totalSpent: 4100.00,
  ),
  CustomerModel(
    name: "Sophia Miller",
    email: "sophia.miller@example.com",
    imageUrl: productImage_1,
    joinedDate: DateTime.now().subtract(const Duration(days: 2)),
    totalOrders: 2,
    totalSpent: 180.00,
  ),
  CustomerModel(
    name: "Daniel Wilson",
    email: "daniel.wilson@example.com",
    imageUrl: productImage,
    joinedDate: DateTime.now().subtract(const Duration(days: 20)),
    totalOrders: 7,
    totalSpent: 950.25,
  ),
  CustomerModel(
    name: "Olivia Martinez",
    email: "olivia.martinez@example.com",
    imageUrl: productImage_1,
    joinedDate: DateTime.now().subtract(const Duration(days: 8)),
    totalOrders: 6,
    totalSpent: 1125.00,
  ),
  CustomerModel(
    name: "William Anderson",
    email: "william.anderson@example.com",
    imageUrl: productImage,
    joinedDate: DateTime.now().subtract(const Duration(days: 35)),
    totalOrders: 9,
    totalSpent: 1560.40,
  ),
  CustomerModel(
    name: "Ava Thompson",
    email: "ava.thompson@example.com",
    imageUrl: productImage_1,
    joinedDate: DateTime.now().subtract(const Duration(days: 3)),
    totalOrders: 4,
    totalSpent: 480.75,
  ),
];
