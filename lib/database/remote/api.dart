// import 'dart:convert';
// import 'dart:developer' as logDev;
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;


// // import '../local/models/userModel.dart';

// void uploadData(
//   var user,
// ) async {
//   print(user['id']);
//   List focusList = await FocusDatabase.getDatabyId(user['id']);
//   List horecaList = await HorecaDatabase.getDatabyId(user['id']);
//   List deliveryBoyList = await DeliveryBoyDatabase.getDatabyId(user['id']);
//   List outletList = await NewOutletDatabase.getDatabyId(user['id']);
//   List competitorList = await CompetitorDatabase.getDatabyId(user['id']);

//   var map = <dynamic, dynamic>{};
//   map['psm_user_id'] = user['psm_user_id'];
//   map['mobile'] = "${user['mobile']}";
//   map['form_fill_date'] = "${user['form_fill_date']}";
//   map['longitude'] = user['longitude'];
//   map['latitude'] = user['latitude'];
//   map['lat_long_address'] = user['lat_long_address'];
//   map['name_of_ada'] = user['name_of_ada'];
//   map['name_of_beat_market'] = "${user['name_of_beat_market']}";
//   map['name_of_town'] = "${user['name_of_town']}";
//   map['total_outlet_beat'] = "${user['total_outlet_beat']}";
//   map['outlet_visited'] = "${user['outlet_visited']}";
//   map['HDB_deployed'] = "${user['HDB_deployed']}";
//   map['HAMC_booking'] = "${user['HAMC_booking']}";
//   map['HAIB_booking'] = "${user['HAIB_booking']}";
//   map['POP_deployed'] = "${user['POP_deployed']}";
//   map['focus_list'] = focusList;
//   map['outlet_list'] = outletList;
//   map['horeca_list'] = horecaList;
//   map['delivery_boy'] = deliveryBoyList;
//   map['ground_activity_name'] = user['ground_activity_name'];
//   map['consumer_footfall'] = user['consumer_footfall'];
//   map['sales_qty'] = "${user['sales_qty']}";
//   map['feedback'] = user['feedback'];
//   map['competitor_list'] = competitorList;
//   map['observation'] = user['observation'];
//   map['branch_read'] = "${user['branch_read']}";
//   map['zone_read'] = "${user['zone_read']}";
//   map['ho_read'] = "${user['ho_read']}";
//   map['status'] = "${user['status']}";
//   map['ip_address'] = "${user['ip_address']}";
//   map['created_at'] = "${user['created_at']}";
//   map['updated_at'] = "${user['updated_at']}";

//   var mainmap = <dynamic, dynamic>{};
//   mainmap['record'] = map as Map;
//   final response = await http.post(
//     Uri.parse('http://psm.amul.in:1101/api/saveFreshForm'),
//     body: jsonEncode(mainmap),
//   );
//   logDev.log(response.body);
// }

// getFreshProducts() async {
//   var map = Map<String, dynamic>();
//   map['type'] = '1';
//   final response = await http.post(
//     Uri.parse('http://psm.amul.in:1101/api/get_products'),
//     body: map,
//   );
//   print(response.body.length);
//   return json.decode(response.body);
// }