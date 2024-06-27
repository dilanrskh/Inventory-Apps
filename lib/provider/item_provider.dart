import 'package:flutter/material.dart';
import 'package:inventory_app/models/response_barang.dart';
import 'package:inventory_app/services/item_services.dart';

class ItemProvider extends ChangeNotifier {
  final _itemService = ItemServices();

  var isFetching = false;
  List<Barang> listBarang = [];
  List<Barang> listSearchBarang = [];
  late ResponseBarang responseBarang;

  Future getListBarang() async {
    isFetching = true;
    notifyListeners();
    listBarang = await _itemService.getListBarang();
    isFetching = false;
    notifyListeners();
  }

  Future insertBarang(String name, String amount, String image) async {
    final response = await _itemService.insertBarang(name, amount, image);
    responseBarang = response;
    getListBarang();
  }

  Future updateBarang(
      String id, String name, String amount, String image) async {
    final response = await _itemService.updateBarang(id, name, amount, image);
    responseBarang = response;
    getListBarang();
  }

  Future deleteBarang(String id) async {
    final response = await _itemService.deleteBarang(id);
    responseBarang = response;
    getListBarang();
  }

  void search(String keywords) {
    List<Barang> listSearch = [];
    if (keywords.isEmpty) {
      listSearch.clear();
      listSearchBarang = listSearch;
    } else {
      for (var itemBarang in listBarang) {
        if (itemBarang.barangNama.toLowerCase().contains(keywords)) {
          listSearch.add(itemBarang);
        }
      }
      listSearchBarang = listSearch;
    }
    notifyListeners();
  }

  ItemProvider() {
    getListBarang();
  }
}
