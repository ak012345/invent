
import 'comm.dart';
import 'invent.dart';

class Trde{


  Comm commIN;
  Comm commOUT;


  Trde(this.commIN, this.commOUT){

      this.commIN.addVal(this.commOUT);
      int ndx =  this.commIN.getVals().indexOf(this.commOUT);
      this.commIN.getVals()[ndx].qty = this.commIN.qty / this.commOUT.qty;
      
      
      
      if(isPresentInArray(this.commIN.name)){ // if the comm OBJECT is in the inv
          ndx = wherePresentInArray(this.commOUT.name); //get its index
       
          double qty = Invent.getInv()[ndx].qty; //get its qty
          Comm commIN_new = new Comm(this.commIN.name,qty + this.commIN.qty); 
          Invent.getInv()[ndx] = commIN_new; //make this the new item
        } else {
          Invent.addComm( new Comm(this.commIN.name, this.commIN.qty)); // if it isnt there, add it
        }  
      
      
       if(isPresentInArray(this.commOUT.name)){ // if the comm OBJECT is in the inv
          ndx = wherePresentInArray(this.commOUT.name); //get its index
       
          double qty = Invent.getInv()[ndx].qty; //get its qty
          Comm commOUT_new = new Comm(this.commOUT.name,qty - this.commOUT.qty); 
          Invent.getInv()[ndx] = commOUT;
        } else {
          this.commOUT = new Comm(this.commOUT.name,0);
          Invent.addComm(this.commOUT); // if it isnt there, add it
        }  
  }

  bool isPresentInArray( String name){
    bool exists = false;
    Invent.getInv().forEach((element) {
      if(element.name == name){
          exists = true;   
      }
  });
  return exists;
}

  int wherePresentInArray(String name){
    int ndx = -1;
    Invent.getInv().forEach((element) {
      if(element.name == name){
        ndx = Invent.getInv().indexOf(element);    
      }
  });
  return ndx;
}


}