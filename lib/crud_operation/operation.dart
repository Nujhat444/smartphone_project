import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
class CrudOperation {
  static final supabase=Supabase.instance.client;

  static Future<void> insert_data (String user_id,String E_mail,String password)async
  {
    try{

      await supabase.from("User_information").insert({
        'uuid':user_id,
        'E_mail':E_mail,
        'Password': password,


      });

    }
    catch(e)
    {
      print(e);
    }
  }

  static Widget get_stream_data_UI(String column_name,String uuid)
  {
    return StreamBuilder<List<Map<String,dynamic>>>(
        stream:  //crud_operation.getDataByUuid(uuid),
        supabase
            .from("User_information")
            .stream(primaryKey: ['uuid'])
            .eq("uuid", uuid),
        builder: (context, Snapshot) {

          if(!Snapshot.hasData)
          {
            //return LinearProgressIndicator();
            return Container(
              height: 20,
              width: 20,
              color: Colors.grey.shade300,
            );
          }
          final users=Snapshot.data!;
          final user=users.first;
          return Text(user['${column_name}'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),);
        }
    );
  }
  static Future<void> update_data(String location,String uuid) async{

    await supabase.from("User_information").update({'Location':location}).eq("uuid",uuid);

  }
}