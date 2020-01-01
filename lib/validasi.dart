class Validation{
  String validasiPassword(String value){
    if (value.length<4){
      return 'Password Minimal 6 Karakter';
    }
    return null;
  }
  String validasiEmail(String value){
    if(!value.contains('@')){
      return 'Email Tidak Valid';
    }
    return null;
  }
  String validasiNama(String value){
    if(value.isEmpty){
      return 'Nama Tidak Boleh Kosong';
    }
    return null;
  }
}