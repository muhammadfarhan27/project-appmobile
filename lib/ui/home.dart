import 'package:furniture_app/helpers/dbhelper.dart';
import 'package:furniture_app/models/sparepart.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'entryform.dart';

class Home extends StatefulWidget {
 @override
 _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 DbHelper _dbHelper = DbHelper();
 int _count = 0;
 List<Sparepart> _sparepartList;

 @override
 Widget build(BuildContext context) {
   if (_sparepartList == null) {
     _sparepartList = List<Sparepart>();
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text('TAMBAH SPAREPART'),
      ),
      
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Tambah Sparepart',
        onPressed: () async {
          var sparepart = await navigateToEntryForm(context, null);
          if (sparepart != null) addSparepart(sparepart);
        }),
      );
    }

 Future<Sparepart> navigateToEntryForm(
   BuildContext context, Sparepart sparepart) async {
     var result = await Navigator.push(
       context,
       MaterialPageRoute(
         builder: (BuildContext context) {
           return EntryForm(sparepart);
          },
        ),
      );
    return result;
 }

 ListView createListView() {
   TextStyle textStyle = Theme.of(context).textTheme.subhead;
   return ListView.builder(
     itemCount: _count,
     itemBuilder: (BuildContext context, int index) {
       return Card(
         color: Colors.white,
         elevation: 2.0,
         child: ListTile(
           leading: CircleAvatar(
             backgroundColor: Colors.red,
             child: Icon(Icons.people),
           ),
            title: Text(
              this._sparepartList[index].deskripsi,
              style: textStyle,
            ),
            subtitle: Text(
              this._sparepartList[index].harga,
            ),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () {
                deleteSparepart(_sparepartList[index]);
              },
            ),
            
            onTap: () async {
              var sparepart =
              await navigateToEntryForm(context, 
    this._sparepartList[index]);
              if (sparepart != null) editSparepart(sparepart);
            },
          ),
        );
      },
    );
  }

 void addSparepart(Sparepart object) async {
   int result = await _dbHelper.insert(object);
   if (result > 0) {
     updateListView();
    }
  }

 void editSparepart(Sparepart object) async {
   int result = await _dbHelper.update(object);
   if (result > 0) {
     updateListView();
    }
  }

 void deleteSparepart(Sparepart object) async {
   int result = await _dbHelper.delete(object.id);
   if (result > 0) {
     updateListView();
     }
    }

 void updateListView() {
   final Future<Database> dbFuture = _dbHelper.initDb();
   dbFuture.then((database) {
     Future<List<Sparepart>> sparepartListFuture =
  _dbHelper.getSparepartList();
     sparepartListFuture.then((sparepartList) {
       setState(() {
         this._sparepartList = sparepartList;
         this._count = sparepartList.length;
        });
      });
    });
  } 
}