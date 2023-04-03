// ignore_for_file: non_constant_identifier_names
class Employee {
  final int? eid;
  final String? ename;
  final String? edob;
  final String? eaddress;
  final String? ejoining_dt;
  final String? ecode;
  final String? emobile_no;
  final String? ebank_acc;
  final String? equalification;
  final String? esalary;
  final String? eposition;
  final String? eusername;
  final String? epassword;
  final int? estatus;

  Employee({
    this.eid,
    this.ename,
    this.edob,
    this.eaddress,
    this.ejoining_dt,
    this.ecode,
    this.emobile_no,
    this.ebank_acc,
    this.equalification,
    this.esalary,
    this.eposition,
    this.eusername,
    this.epassword,
    this.estatus,
  });
  Map<String, dynamic> toJson() {
    return {
      'eid': eid,
      'ename': ename,
      'edob': edob,
      'eaddress': eaddress,
      'ejoining_dt': ejoining_dt,
      'ecode': ecode,
      'emobile_no': emobile_no,
      'ebank_acc': ebank_acc,
      'equalification': equalification,
      'esalary': esalary,
      'eposition': eposition,
      'eusername': eusername,
      'epassword': epassword,
      'estatus': estatus
    };
  }

  static Employee fromJson(Map<String, Object?> first) => Employee(
      eid: first['eid'] as int,
      ename: first['ename'] as String,
      edob: first['edob'] as String,
      eaddress: first['eaddress'] as String,
      ejoining_dt: first['ejoining_dt'] as String,
      ecode: first['ecode'] as String,
      emobile_no: first['emobile_no'] as String,
      ebank_acc: first['ebank_acc'] as String,
      equalification: first['equalification'] as String,
      esalary: first['esalary'] as String,
      eposition: first['eposition'] as String,
      eusername: first['eusername'] as String,
      epassword: first['epassword'] as String,
      estatus: first['estatus'] as int);
}
