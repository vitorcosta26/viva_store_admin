import 'package:admin_panel/constants/constants.dart';
import 'package:admin_panel/helpers/firebase_firestore_helper/firebase_firestore.dart';
import 'package:admin_panel/models/category_model/category_model.dart';
import 'package:admin_panel/models/user_model/user_model.dart';
import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  List<UserModel> _userList = [];
  List<CategoryModel> _categoriesList = [];

  Future<void> getUserListFun() async {
    _userList = await FirebaseFirestoreHelper.instance.getUserList();
  }

  Future<void> getCategoriesListFun() async {
    _categoriesList = await FirebaseFirestoreHelper.instance.getCategories();
  }

  Future<void> deleteUserFromFirebase(UserModel userModel) async {
    notifyListeners();
    String value =
        await FirebaseFirestoreHelper.instance.deleteSingleUser(userModel.id);
    if (value == "Usuário deletado com sucesso") {
      _userList.remove(userModel);
      showMessage("Usuário deletado com sucesso");
    }
    notifyListeners();
  }

  List<UserModel> get getUserList => _userList;
  List<CategoryModel> get getCategoriesList => _categoriesList;

  Future<void> callBackFunction() async {
    await getUserListFun();
    await getCategoriesListFun();
  }

  void updateUserList(int index, UserModel userModel) async {
    await FirebaseFirestoreHelper.instance.updateUser(userModel);
    _userList[index] = userModel;
    notifyListeners();
  }

  Future<void> deleteCategoryFromFirebase(CategoryModel categoryModel) async {
    notifyListeners();
    String value = await FirebaseFirestoreHelper.instance
        .deleteSingleCategory(categoryModel.id);
    if (value == "Categoria deletada com sucesso") {
      _categoriesList.remove(categoryModel);
      showMessage("Categoria deletada com sucesso");
    }
    notifyListeners();
  }

  void updateCategoryList(int index, CategoryModel categoryModel) async {
    await FirebaseFirestoreHelper.instance.updateSingleCategory(categoryModel);
    _categoriesList[index] = categoryModel;
    notifyListeners();
  }

  void addCategory(String name, String description) async {
    CategoryModel categoryModel = await FirebaseFirestoreHelper.instance
        .addSingleCategory(name, description);
    _categoriesList.add(categoryModel);
    notifyListeners();
  }
}
