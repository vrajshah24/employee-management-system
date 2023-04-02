// ignore_for_file: non_constant_identifier_names
class AdminModel {
  final int? id;
  final String patient_id;
  final String name;
  final String age;
  final String gender;
  final String dr_name;
  final int cardiac_history;
  final int hbp;
  final int lbp;
  final int diabetes;

  AdminModel(
      {this.id,
      required this.patient_id,
      required this.name,
      required this.age,
      required this.gender,
      required this.dr_name,
      required this.cardiac_history,
      required this.hbp,
      required this.lbp,
      required this.diabetes});
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patient_id': patient_id,
      'name': name,
      'age': age,
      'gender': gender,
      'dr_name': dr_name,
      'cardiac_history': cardiac_history,
      'hbp': hbp,
      'lbp': lbp,
      'diabetes': diabetes
    };
  }

  AdminModel copy({
    String? patient_id,
    String? name,
    String? age,
    String? gender,
    String? dr_name,
    int? cardiac_history,
    int? hbp,
    int? lbp,
    int? diabetes,
    required int id,
  }) =>
      AdminModel(
          id: id,
          patient_id: patient_id ?? this.patient_id,
          name: name ?? this.name,
          age: age ?? this.age,
          gender: gender ?? this.gender,
          dr_name: dr_name ?? this.dr_name,
          cardiac_history: cardiac_history ?? this.cardiac_history,
          hbp: hbp ?? this.hbp,
          lbp: lbp ?? this.lbp,
          diabetes: diabetes ?? this.diabetes);
  static AdminModel fromJson(Map<String, Object?> first) => AdminModel(
      id: first['id'] as int,
      patient_id: first['patient_id'] as String,
      name: first['name'] as String,
      age: first['age'] as String,
      gender: first['gender'] as String,
      dr_name: first['dr_name'] as String,
      cardiac_history: first['cardiac_history'] as int,
      hbp: first['hbp'] as int,
      lbp: first['lbp'] as int,
      diabetes: first['diabetes'] as int);
}
