  import 'comm.dart';

class Invent{
   static List<Comm> INV = [];
    
    static void addComm(Comm commIN){
      INV.add(commIN);
    }
   
    
    static List<Comm> getInv() => INV;
     
  }