class Sparepart {
  int _id;
  String _deskripsi;
  String _harga;
  Sparepart(this._deskripsi, this._harga);
  Sparepart.forMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._deskripsi = map['deskripsi'];
    this._harga = map['harga'];
  }
  int get id => _id;
  String get deskripsi => _deskripsi;
  String get harga => _harga;
  set deskripsi(String value) {
    _deskripsi = value;
  }

  set harga(String value) {
    _harga = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['deskripsi'] = deskripsi;
    map['harga'] = harga;
    return map;
  }
}
