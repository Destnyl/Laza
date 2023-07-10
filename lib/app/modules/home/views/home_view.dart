import 'package:ecommerce/app/routes/app_pages.dart';
import 'package:ecommerce/app/widgets/sidebar.dart';
import 'package:ecommerce/app/widgets/empty_state.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag),
          ),
        ],
      ),
      drawer: Sidebar(
        onTapLogout: () {
          controller.onLogout();
        },
      ),
      bottomNavigationBar: bottomNavigation(),
      body: Obx(() => OverlayLoaderWithAppIcon(
            isLoading: controller.isLoading.isTrue,
            appIcon: Image.asset('images/brand.png'),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello", style: Get.textTheme.titleLarge),
                  Text("Welcome to Laza.", style: Get.textTheme.bodySmall),
                  const SizedBox(height: 12),
                  search(),
                  sectionTitle(title: "Choose Brand"),
                  Obx(() => Visibility(
                        visible: controller.isBrandLoading.isFalse,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Row(
                            children: controller.brands
                                .map(
                                  (e) => Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    child: brand(
                                        title: e.name,
                                        logo: Image.asset(e.logo),
                                        brandId: e.id),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      )),
                  sectionTitle(title: "New Arrival"),
                  Expanded(
                    child: Obx(() => Visibility(
                          visible: controller.isLoading.isFalse,
                          replacement: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: Visibility(
                            visible: controller.products.isNotEmpty,
                            replacement: const EmptyState(),
                            child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: controller.products.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 2 / 3,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                var product = controller.products[index];
                                return productCard(
                                  id: product.id,
                                  title: product.name,
                                  image: product.imageUrl,
                                  price: product.price,
                                );
                              },
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget bottomNavigation() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet_outlined),
          label: 'Card',
        ),
      ],
      selectedItemColor: Get.theme.colorScheme.primary,
      unselectedItemColor: Colors.grey,
      currentIndex: controller.selectedIndex.value,
      onTap: (value) {
        controller.onItemTap(value);
      },
    );
  }

  Widget sectionTitle({title}) {
    return Row(
      children: [
        Expanded(child: Text(title, style: Get.textTheme.bodyLarge)),
        TextButton(onPressed: () {}, child: const Text("View all"))
      ],
    );
  }

  Widget search() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: TextFormField(
            onEditingComplete: controller.onSearch,
            controller: controller.searchController,
            decoration: const InputDecoration(
              hintText: "Search...",
              prefixIcon: Icon(Icons.search),
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
            ),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              controller.getProducts();
            },
            child: const Icon(Icons.mic),
          ),
        )
      ],
    );
  }

  Widget brand({title, logo, brandId}) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF5F6FA),
        minimumSize: const Size(50, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: () {
        controller.filterByCategory(brandId);
      },
      icon: logo,
      label: Text(
        title,
        style: const TextStyle(color: Colors.black87),
      ),
    );
  }

  Widget productCard({id, title, image, price}) {
    return InkWell(
      onTap: () {
        controller.onViewProductDetails(id);
      },
      child: Column(
        children: [
          Image.asset(image),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    title,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "\$$price",
                    style: Get.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
