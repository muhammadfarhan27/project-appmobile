import 'package:furniture_app/models/sparepart.dart';
import 'package:flutter/material.dart';

class EntryForm extends StatefulWidget {
 final Sparepart sparepart;
 
 EntryForm(this.sparepart);
 @override
 _EntryFormState createState() => _EntryFormState(this.sparepart);
}

class _EntryFormState extends State<EntryForm> {
 Sparepart _sparepart;
 _EntryFormState(this._sparepart);

 TextEditingController _deskripsiController = TextEditingController();
 TextEditingController _hargaController = TextEditingController();
 
 @override
 Widget build(BuildContext context) {
 if (_sparepart != null) {
   _deskripsiController.text = _sparepart.deskripsi;
   _hargaController.text = _sparepart.harga;
 }

 return Scaffold(
   appBar: AppBar(
     title: _sparepart == null ? Text('Tambah Data') : Text('Ubah Data'),
     leading: Icon(Icons.keyboard_arrow_left),
    ),
    
    body: Padding(
      padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
      child: ListView(
        children: <Widget>[
          //nama
          Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: TextField(
              controller: _deskripsiController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Deskripsi',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                ),
                onChanged: (value) {},
              ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: _hargaController, 
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Harga',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      ),
                      ),
                      onChanged: (value) {},
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                              color: Theme.of(context).primaryColorDark,
                              textColor: Theme.of(context).primaryColorLight,
                              child: Text(
                                'Simpan',
                                textScaleFactor: 1.5,
                              ),
                              onPressed: () {
                                if (_sparepart == null) {
                                  _sparepart = Sparepart(
                                  _deskripsiController.text, 
                                  _hargaController.text);
                                } else {
                                  _sparepart.deskripsi = _deskripsiController.text;
                                  _sparepart.harga = _hargaController.text;
                                }
                                Navigator.pop(context, _sparepart);
                              },
                            ),
                          ),
                          Container(
                            width: 5.0,
                          ),
                          Expanded(
                            child: RaisedButton(
                              color: Theme.of(context).primaryColorDark,
                              textColor: Theme.of(context).primaryColorLight,
                              child: Text(
                                'Batal',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } 
      }