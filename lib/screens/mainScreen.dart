import 'package:flutter/material.dart';
import 'package:task1/models/productModel.dart';
import 'package:task1/services/productService.dart';
import 'package:task1/widgets/productCard.dart';

class MainScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<List<Product>> futureProducts;
  bool isGrid = false;
  @override
  void initState() {
    super.initState();
    futureProducts = Productservice().fetchProducts();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: FutureBuilder<List<Product>>(
        future: futureProducts,
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('An error has occurred:'),
                  Text(' ${snapshot.error}'),
                ],
              ),
            );
          } else if (snapshot.hasData) {
            return Container(
              height: 1555,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Toggle view: '),
                      ToggleButtons(
                        borderRadius: BorderRadius.circular(50),
                        isSelected: [isGrid, !isGrid],
                        onPressed: (index) =>
                            setState(() => isGrid = index == 0),
                        children: const [Icon(Icons.grid_on), Icon(Icons.list)],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  isGrid
                      ? ProductGrid(products: snapshot.data!, isGrid: isGrid)
                      : ProductList(products: snapshot.data!, isGrid: isGrid),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final bool isGrid;
  const new({super.key, required this.products, required this.isGrid});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index], isGrid: isGrid);
        },
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final bool isGrid;
  const new({super.key, required this.products, required this.isGrid});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.5,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index], isGrid: isGrid);
        },
      ),
    );
  }
}
