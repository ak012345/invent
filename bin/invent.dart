import 'comm.dart';

class Invent {
  List<Comm> inv = [];

  List<Comm> getInv() => inv;
  void addComm(Comm commIN) => inv.add(commIN);
  
  void updateInvent(Comm commIN, Comm commOUT) {
    int ndx = -1;

    if (isPresentInArray(commIN.name)) {
      // if the comm is in the inv
      ndx = wherePresentInArray(commOUT.name); //get its index
      this.updateVals();
      double qty = this.inv[ndx].qty; //get its qty
      Comm commIN_new = new Comm(commIN.name, qty + commIN.qty);

      this.inv[ndx] = commIN_new; //make this the new item
    } else {
      this.addComm(
          new Comm(commIN.name, commIN.qty)); // if it isnt there, add it
    }

    if (isPresentInArray(commOUT.name)) {
      // if the comm OBJECT is in the inv
      ndx = wherePresentInArray(commOUT.name); //get its index

      double qty = this.inv[ndx].qty; //get its qty
      Comm commOUT_new = new Comm(commOUT.name, qty - commOUT.qty);
      this.inv[ndx] = commOUT;
    } else {
      commOUT = new Comm(commOUT.name, 0);
      this.addComm(commOUT); // if it isnt there, add it
    }
  }


void updateVals(int ndxToUpdate, Comm theCurrentComm, Comm commToAppend){

}

  bool isPresentInArray(String name) {
    bool exists = false;
    this.inv.forEach((element) {
      if (element.name == name) {
        exists = true;
      }
    });
    return exists;
  }

  int wherePresentInArray(String name) {
    int ndx = -1;
    this.inv.forEach((element) {
      if (element.name == name) {
        ndx = this.inv.indexOf(element);
      }
    });
    return ndx;
  }
}
