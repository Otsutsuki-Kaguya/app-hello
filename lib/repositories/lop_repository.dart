
import 'package:app_hello/models/lop.dart';
import 'package:app_hello/services/api_services.dart';

class LopRepository{
  Future<List<Lop>> getDSLop() async{
    List<Lop> list = [];
    list.add(Lop(ten: "--chọn--"));
    final response = await ApiService().getDSLop();
    if(response != null){
      var data = response.data['data'];
      for(var item in data){
        var lop = Lop.fromJson(item);
        list.add(lop);
      }
    }
    return list;
  }
}