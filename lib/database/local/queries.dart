import 'package:employee_management_system/database/local/tables.dart';

String createTableforEmployee =
    "Create table if not exists $employeeTable(eid INTEGER ,ename TEXT ,edob TEXT,eaddress TEXT,ejoining_dt TEXT,ecode TEXT,emobile_no TEXT,ebank_acc_no TEXT,equalification TEXT,esalary TEXT,eposition TEXT,eusername TEXT,epassword TEXT,estatus INTEGER DEFAULT 1,PRIMARY KEY(eid AUTOINCREMENT))";

String createTableforAdmin =
    "Create table if not exists $adminTable(id INTEGER ,username TEXT,password TEXT,name TEXT,position TEXT,mobileno TEXT,status INTEGER DEFAULT 1,PRIMARY KEY(id AUTOINCREMENT))";
