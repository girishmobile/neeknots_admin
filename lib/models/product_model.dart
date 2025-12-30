import 'package:neeknots_admin/core/constants/string_constant.dart';

enum Status { active, inActive, draft, disconnect }

class ProductModel {
  final String prodId;
  final String name;
  final String description;
  final double price;
  final int quantity;
  final Status status;
  final String? imageUrl;

  ProductModel({
    required this.prodId,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    this.imageUrl,
    this.status = Status.active,
  });
}

List<ProductModel> sampleProduct = [
  ProductModel(
    prodId: "P001",
    name: "Little Green Alligator",
    description:
        "Handcrafted soft alligator toy made with premium fabric.\n"
        "Carefully stitched for durability and comfort.\n"
        "Perfect companion for kids and gifting.",
    price: 499.0,
    quantity: 10,
    imageUrl: product_0,
  ),
  ProductModel(
    prodId: "P002",
    name: "Smiley Alligator Plush",
    description:
        "Cute smiling alligator plush handcrafted by artisans.\n"
        "Soft texture and child-safe materials.\n"
        "Ideal for playtime and decor.",
    price: 529.0,
    quantity: 12,
    imageUrl: product_1,
  ),
  ProductModel(
    prodId: "P003",
    name: "Jungle Buddy Alligator",
    description:
        "Inspired by jungle wildlife soft toy design.\n"
        "Handmade using high-quality fabric.\n"
        "Lightweight and easy to carry.",
    price: 549.0,
    quantity: 8,
    imageUrl: product_2,
  ),
  ProductModel(
    prodId: "P004",
    name: "Mini Snappy Alligator",
    description:
        "Mini-sized alligator soft toy with fine stitching.\n"
        "Compact design suitable for small hands.\n"
        "Great for travel and gifting.",
    price: 399.0,
    quantity: 15,
    imageUrl: product_3,
  ),
  ProductModel(
    prodId: "P005",
    name: "Royal Green Alligator",
    description:
        "Premium handcrafted alligator plush with rich color.\n"
        "Designed for long-lasting softness.\n"
        "Adds charm to any toy collection.",
    price: 699.0,
    quantity: 6,
    imageUrl: product_4,
  ),
  ProductModel(
    prodId: "P006",
    name: "Cozy Plush Alligator",
    description:
        "Extra soft plush alligator made for comfort.\n"
        "Gentle fabric suitable for kids.\n"
        "Perfect cuddle buddy.",
    price: 579.0,
    quantity: 20,
    imageUrl: product_5,
  ),
  ProductModel(
    prodId: "P007",
    name: "Kids Safe Alligator",
    description:
        "Designed specially for child safety.\n"
        "Handcrafted with smooth edges and soft fabric.\n"
        "Ideal for toddlers.",
    price: 459.0,
    quantity: 18,
    imageUrl: product_6,
  ),
  ProductModel(
    prodId: "P008",
    name: "Hand Stitch Alligator",
    description:
        "Carefully hand-stitched by skilled artisans.\n"
        "Strong seams ensure durability.\n"
        "Traditional craftsmanship feel.",
    price: 589.0,
    quantity: 9,
    imageUrl: product_7,
  ),
  ProductModel(
    prodId: "P009",
    name: "Organic Fabric Alligator",
    description:
        "Made using organic and skin-friendly fabric.\n"
        "Soft touch with natural finish.\n"
        "Eco-conscious toy choice.",
    price: 649.0,
    quantity: 11,
    imageUrl: product_8,
  ),
  ProductModel(
    prodId: "P010",
    name: "Limited Edition Alligator",
    description:
        "Special limited edition handcrafted soft toy.\n"
        "Unique design with premium finish.\n"
        "Perfect for collectors.",
    price: 749.0,
    quantity: 5,
    imageUrl: product_9,
  ),
  ProductModel(
    prodId: "P011",
    name: "Artisan Crafted Alligator",
    description:
        "Individually crafted by skilled artisans.\n"
        "Every piece has unique character.\n"
        "A true handmade product.",
    price: 799.0,
    quantity: 4,
    imageUrl: product_10,
  ),
  ProductModel(
    prodId: "P012",
    name: "Eco Friendly Alligator",
    description:
        "Crafted using sustainable materials.\n"
        "Environment-friendly and safe for kids.\n"
        "Soft yet durable design.",
    price: 569.0,
    quantity: 16,
    imageUrl: product_11,
  ),
  ProductModel(
    prodId: "P013",
    name: "Deluxe Plush Alligator",
    description:
        "Deluxe quality plush with extra softness.\n"
        "Premium stitching and fabric used.\n"
        "Designed for luxury feel.",
    price: 899.0,
    quantity: 3,
    imageUrl: product_12,
  ),
  ProductModel(
    prodId: "P014",
    name: "Traditional Stitch Alligator",
    description:
        "Traditional hand-stitching technique used.\n"
        "Strong build with cultural craftsmanship.\n"
        "Timeless handmade design.",
    price: 629.0,
    quantity: 7,
    imageUrl: product_13,
  ),
  ProductModel(
    prodId: "P015",
    name: "Comfort Hug Alligator",
    description:
        "Designed for warm and cozy hugs.\n"
        "Soft filling provides extra comfort.\n"
        "Loved by kids of all ages.",
    price: 489.0,
    quantity: 14,
    imageUrl: product_14,
  ),
  ProductModel(
    prodId: "P016",
    name: "Signature Alligator Plush",
    description:
        "Signature design with premium detailing.\n"
        "Elegant look with handcrafted finish.\n"
        "Perfect gifting option.",
    price: 999.0,
    quantity: 2,
    imageUrl: product_15,
  ),
  ProductModel(
    prodId: "P017",
    name: "Natural Dye Alligator",
    description:
        "Colored using natural and safe dyes.\n"
        "Soft texture with earthy tones.\n"
        "Safe and skin-friendly.",
    price: 679.0,
    quantity: 6,
    imageUrl: product_16,
  ),
  ProductModel(
    prodId: "P018",
    name: "Buddy Style Alligator",
    description:
        "Friendly buddy-style plush design.\n"
        "Lightweight and easy to carry.\n"
        "Great companion for kids.",
    price: 719.0,
    quantity: 8,
    imageUrl: product_17,
  ),
  ProductModel(
    prodId: "P019",
    name: "Heritage Alligator Plush",
    description:
        "Inspired by traditional handcrafted toys.\n"
        "Detailed stitching with premium fabric.\n"
        "A blend of heritage and comfort.",
    price: 1099.0,
    quantity: 3,
    imageUrl: product_18,
  ),
];
