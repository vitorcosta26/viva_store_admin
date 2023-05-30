import 'package:admin_panel/constants/routes.dart';
import 'package:admin_panel/provider/app_provider.dart';
import 'package:admin_panel/screens/categories_view/categories_view.dart';
import 'package:admin_panel/screens/home_page/widgets/single_dash_item.dart';
import 'package:admin_panel/screens/user_view/user_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    await appProvider.callBackFunction();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Viva Store',
                      style: TextStyle(fontSize: 18),
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.only(top: 12.0),
                      crossAxisCount: 2,
                      children: [
                        SingleDashItem(
                          subtitle: "Usuários",
                          title: appProvider.getUserList.length.toString(),
                          onPresed: () {
                            Routes.instance.push(
                                widget: const UserView(), context: context);
                          },
                        ),
                        SingleDashItem(
                          subtitle: "Categorias",
                          title:
                              appProvider.getCategoriesList.length.toString(),
                          onPresed: () {
                            Routes.instance.push(
                                widget: const CategoriesView(),
                                context: context);
                          },
                        ),
                        SingleDashItem(
                          subtitle: "Produtos",
                          title: "0",
                          onPresed: () {},
                        ),
                        SingleDashItem(
                          subtitle: "Ganho",
                          title: "0",
                          onPresed: () {},
                        ),
                        SingleDashItem(
                          subtitle: "Pedidos pendentes",
                          title: "0",
                          onPresed: () {},
                        ),
                        SingleDashItem(
                          subtitle: "Pedidos completos",
                          title: "0",
                          onPresed: () {},
                        ),
                        SingleDashItem(
                          subtitle: "Pedidos cancelados",
                          title: "0",
                          onPresed: () {},
                        ),
                        SingleDashItem(
                          subtitle: "Pedidos em entrega",
                          title: "0",
                          onPresed: () {},
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
