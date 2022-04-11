import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_store_app/controllers/home_page_controller.dart';
import 'package:fruit_store_app/global_blocs/catalog/catalog_bloc.dart';
import 'package:fruit_store_app/models/product.dart';
import 'package:fruit_store_app/styles/color_theme.dart';
import 'package:fruit_store_app/views/cart_page/widgets/catalog_list_item.dart';
import 'package:fruit_store_app/views/cart_page/widgets/circle_tab_indicator.dart';
import 'package:fruit_store_app/views/cart_page/widgets/custom_app_bar_widget.dart';
import 'package:fruit_store_app/views/cart_page/widgets/item_card.dart';
import 'package:fruit_store_app/widgets/custom_text.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final HomePageController _homePageController = HomePageController();
  late ScrollController _scrollController;

  List<Widget> listTabs = const [
    Tab(
      child: CustomText(
        label: 'Pinapple',
        fontFamily: 'Inter-SemiBold',
        size: 14.5,
      ),
    ),
    Tab(
      child: CustomText(
        label: 'Oranges',
        fontFamily: 'Inter-SemiBold',
        size: 15,
      ),
    ),
    Tab(
      child: CustomText(
        label: 'Papaya',
        fontFamily: 'Inter-SemiBold',
        size: 15,
      ),
    ),
    Tab(
      child: CustomText(
        label: 'Guava',
        fontFamily: 'Inter-SemiBold',
        size: 15,
      ),
    ),
  ];

  @override
  void initState() {
    _tabController =
        TabController(length: listTabs.length, vsync: this, initialIndex: 1);
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30, left: 30),
              child: CustomText(
                label: 'Fruits and vegetables',
                fontFamily: 'Inter-Bold',
                size: 22,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 30),
              child: CustomText(
                label: 'Seasonal',
                fontFamily: 'Inter-SemiBold',
                size: 20,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            TabBar(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
              controller: _tabController,
              tabs: listTabs,
              indicatorColor: primaryColor,
              labelColor: Colors.black87,
              unselectedLabelColor: Colors.black87.withOpacity(0.6),
              indicator: CircleTabIndicator(color: primaryColor, radius: 4),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 1.05,
              child: TabBarView(
                controller: _tabController,
                children: [
                  const Center(
                    child: Icon(
                      Icons.read_more,
                      size: 50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Flexible(
                          child: SizedBox(
                            height: 210,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: _homePageController.fruitsList.length,
                              itemBuilder: (context, index) {
                                Product product =
                                    _homePageController.fruitsList[index];

                                return ItemCard(
                                  product: Product(
                                    // qtdd: product.qtdd,
                                    name: product.name,
                                    price: product.price,
                                    bgColor: product.bgColor,
                                    image: product.image,
                                    iconColor: product.iconColor,
                                    rating: product.rating,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        BlocBuilder<CatalogBloc, CatalogState>(
                          builder: (context, state) {
                            if (state is CatalogLoading) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: primaryColor,
                                ),
                              );
                            }
                            if (state is CatalogLoaded) {
                              return Flexible(
                                child: ListView.builder(
                                  controller: _scrollController,
                                  itemCount: state.catalog.itemNames.length,
                                  itemBuilder: (context, index) {
                                    return CatalogListItem(
                                      product:
                                          state.catalog.getByPosition(index),
                                    );
                                  },
                                ),
                              );
                            }
                            return const Text('Something went wrong!');
                          },
                        ),
                      ],
                    ),
                  ),
                  const Center(
                    child: Icon(
                      Icons.aspect_ratio,
                      size: 50,
                    ),
                  ),
                  const Center(
                    child: Icon(
                      Icons.backpack_outlined,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
