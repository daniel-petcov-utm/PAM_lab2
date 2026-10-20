import 'package:flutter/material.dart';

import '../models/catalog.dart';
import '../widgets/store_widgets.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool _isFavorite = false;
  int _selectedColor = 0;
  String _selectedSize = 'L';
  int _imagePage = 0;
  final PageController _imageController = PageController();

  @override
  void dispose() {
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xfffcf9f7),
    bottomNavigationBar: Container(
      decoration: const BoxDecoration(
        color: Color(0xff323232),
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 70,
          child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
            label: const Text(
              'Add To Cart',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    ),
    body: SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _productHero(context),
          Container(
            padding: const EdgeInsets.fromLTRB(32, 34, 32, 28),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        widget.product.name,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      widget.product.price,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    Text(
                      '★★★★★',
                      style: TextStyle(color: Color(0xff4d8d80), fontSize: 22),
                    ),
                    SizedBox(width: 8),
                    Text('(83)', style: TextStyle(color: Color(0xff737788))),
                  ],
                ),
                const SizedBox(height: 18),
                const Divider(),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Expanded(
                      child: Text('Color', style: TextStyle(color: Color(0xff74788a))),
                    ),
                    Expanded(
                      child: Text('Size', style: TextStyle(color: Color(0xff74788a))),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _colorChoice(0, const Color(0xffeec8b0)),
                    _colorChoice(1, Colors.black),
                    _colorChoice(2, const Color(0xffef656c)),
                    const Spacer(),
                    ...['S', 'M', 'L'].map(_sizeChoice),
                  ],
                ),
                const SizedBox(height: 24),
                const Divider(),
                _sectionTitle('Description'),
                const SizedBox(height: 15),
                const Text(
                  'This stylish piece is designed for effortless everyday wear. It is comfortable, versatile, and easy to pair with your favorite wardrobe essentials.',
                  style: TextStyle(color: Color(0xff707482), height: 1.5),
                ),
                const SizedBox(height: 24),
                const Divider(),
                _sectionTitle('Reviews'),
                const SizedBox(height: 14),
                const Row(
                  children: [
                    Text('4.9', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700)),
                    SizedBox(width: 10),
                    Text('OUT OF 5', style: TextStyle(color: Color(0xff8a8d99), fontSize: 11)),
                    Spacer(),
                    Text('★★★★★', style: TextStyle(color: Color(0xff4d8d80), fontSize: 20)),
                  ],
                ),
                const SizedBox(height: 16),
                _ratingBar('5', .84, '80%'),
                _ratingBar('4', .20, '12%'),
                _ratingBar('3', .09, '5%'),
                _ratingBar('2', .06, '3%'),
                _ratingBar('1', .02, '0%'),
                const SizedBox(height: 19),
                const Row(
                  children: [
                    Text('47 Reviews', style: TextStyle(color: Color(0xffa4a6ae), fontSize: 11)),
                    Spacer(),
                    Text('WRITE A REVIEW', style: TextStyle(color: Color(0xffa4a6ae), fontSize: 11)),
                    SizedBox(width: 5),
                    Icon(Icons.edit, color: Color(0xffb8bac1), size: 14),
                  ],
                ),
                const SizedBox(height: 21),
                _review(
                  name: 'Jennifer Rose',
                  time: '5m ago',
                  initials: 'JR',
                  text: 'I love it. Awesome customer service!! Helped me out with adding an additional item to my order. Thanks again!',
                ),
                const SizedBox(height: 22),
                _review(
                  name: 'Kelly Rihanna',
                  time: '9m ago',
                  initials: 'KR',
                  text: "I'm very happy with order, It was delivered on and good quality. Recommended!",
                ),
                const SizedBox(height: 24),
                _sectionTitle('Similar Product'),
                const SizedBox(height: 16),
                SizedBox(
                  height: 231,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    separatorBuilder: (_, _) => const SizedBox(width: 18),
                    itemBuilder: (_, index) => _similarProduct(
                      imageUrl: index == 1
                          ? 'assets/images/similar_2.png'
                          : 'assets/images/similar_1.png',
                      name: index == 1 ? 'Gym Crop Top' : 'Rise Crop Hoodie',
                      price: index == 1 ? r'$ 39.99' : r'$ 43.00',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget _productHero(BuildContext context) => SizedBox(
    height: 390,
    child: Stack(
      alignment: Alignment.center,
      children: [
        const Positioned(
          top: 55,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xfff6ece6),
              shape: BoxShape.circle,
            ),
            child: SizedBox(width: 235, height: 235),
          ),
        ),
        Positioned.fill(
          top: 12,
          bottom: 0,
          child: PageView.builder(
            controller: _imageController,
            itemCount: 3,
            onPageChanged: (index) => setState(() => _imagePage = index),
            itemBuilder: (_, _) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: NetworkStoreImage(url: widget.product.imageUrl),
            ),
          ),
        ),
        Positioned(
          top: 18,
          left: 30,
          child: _roundIcon(Icons.arrow_back_ios_new, () => Navigator.pop(context)),
        ),
        Positioned(
          top: 18,
          right: 30,
          child: _roundIcon(
            _isFavorite ? Icons.favorite : Icons.favorite_border,
            () => setState(() => _isFavorite = !_isFavorite),
            color: const Color(0xffff6e75),
          ),
        ),
        Positioned(
          bottom: 12,
          child: Row(
            children: List.generate(
              3,
              (index) => Container(
                width: _imagePage == index ? 10 : 6,
                height: _imagePage == index ? 10 : 6,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: _imagePage == index ? const Color(0xff555555) : const Color(0xff8f8f8f),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );

  Widget _roundIcon(IconData icon, VoidCallback onTap, {Color? color}) => Material(
    color: Colors.white,
    shape: const CircleBorder(),
    elevation: 2,
    child: IconButton(onPressed: onTap, icon: Icon(icon, color: color ?? const Color(0xff253957))),
  );

  Widget _colorChoice(int index, Color color) => GestureDetector(
    onTap: () => setState(() => _selectedColor = index),
    child: Container(
      width: 29,
      height: 29,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: _selectedColor == index ? Border.all(color: Colors.white, width: 3) : null,
        boxShadow: _selectedColor == index
            ? const [BoxShadow(color: Color(0x33000000), blurRadius: 5)]
            : null,
      ),
    ),
  );

  Widget _sizeChoice(String size) => GestureDetector(
    onTap: () => setState(() => _selectedSize = size),
    child: Container(
      width: 34,
      height: 34,
      margin: const EdgeInsets.only(left: 7),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _selectedSize == size ? const Color(0xff505050) : const Color(0xfff7f7f7),
        shape: BoxShape.circle,
      ),
      child: Text(
        size,
        style: TextStyle(color: _selectedSize == size ? Colors.white : const Color(0xffbbbbbb)),
      ),
    ),
  );

  Widget _ratingBar(String rating, double value, String percentage) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Row(
      children: [
        SizedBox(
          width: 36,
          child: Text(
            '$rating  ★',
            style: const TextStyle(color: Color(0xff4d8d80), fontSize: 11),
          ),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) => Stack(
              children: [
                Container(height: 4, color: const Color(0xffececef)),
                Container(
                  height: 4,
                  width: constraints.maxWidth * value,
                  color: const Color(0xff4d8d80),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 38,
          child: Text(
            percentage,
            textAlign: TextAlign.right,
            style: const TextStyle(color: Color(0xff5f6371), fontSize: 11),
          ),
        ),
      ],
    ),
  );

  Widget _review({
    required String name,
    required String time,
    required String initials,
    required String text,
  }) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: const Color(0xffe8e3df),
            child: Text(initials, style: const TextStyle(fontSize: 11, color: Color(0xff5b504b))),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
                const Text('★★★★★', style: TextStyle(color: Color(0xff4d8d80), fontSize: 14)),
              ],
            ),
          ),
          Text(time, style: const TextStyle(color: Color(0xffb1b3ba), fontSize: 11)),
        ],
      ),
      const SizedBox(height: 12),
      Text(text, style: const TextStyle(color: Color(0xff5e6270), fontSize: 13, height: 1.35)),
    ],
  );

  Widget _similarProduct({
    required String imageUrl,
    required String name,
    required String price,
  }) => SizedBox(
    width: 128,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 172,
            width: 128,
            child: NetworkStoreImage(url: imageUrl),
          ),
        ),
        const SizedBox(height: 9),
        Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),
        const SizedBox(height: 5),
        Text(price, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
      ],
    ),
  );

  Widget _sectionTitle(String title) => Row(
    children: [
      Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
      const Spacer(),
      const Icon(Icons.keyboard_arrow_down_rounded),
    ],
  );
}
