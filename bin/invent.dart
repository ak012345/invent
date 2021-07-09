import 'comm.dart';

class Invent {
  List<Comm> inv = [];

  List<Comm> getInv() => inv;
  void addComm(Comm commIN) => inv.add(commIN);

  void updateInvent(Comm commIN, Comm commOUT) {
    int ndx = -1;

    if (isPresentInTheInvent(commIN.name)) {
      // if the comm is in the inv, update Vals appropriately
      this.updateValsOfInventItem(commIN);
    } else {
     // if the commIN wasnt in the Invent, add it.
    }

    if (isPresentInTheInvent(commOUT.name)) {
      // if the comm OBJECT is in the inv
      ndx = wherePresentInTheInvent(commOUT.name); //get its index

      double qty = this.inv[ndx].qty; //get its qty
      Comm commOUT_new = new Comm(commOUT.name, qty - commOUT.qty);
      this.inv[ndx] = commOUT;
    } else {
      commOUT = new Comm(commOUT.name, 0);
      this.addComm(commOUT); // if it isnt there, add it
    }
  }

  void updateValsOfInventItem(Comm commToAppendVal) {
    bool valWasFound = false;
    commToAppendVal.val.forEach((currentVal) {
      //for each val in the new item
      if (isCurrentValAlsoInInventCommValList(currentVal)) {
        int ndxInvent = wherePresentInTheInvent(currentVal.name); //get index of comm in the Invent
        int ndx = whereCurrentValAlsoInInventCommValList(currentVal); 
        this.inv[ndxInvent].val[ndx].qty = commToAppendVal.qty; //update teh invent Val to the new incomming val
        valWasFound = true; //the val
      }
    });

    if(!valWasFound){
      int ndxInvent = wherePresentInTheInvent(commToAppendVal.name); //get index of comm in the Invent
      this.inv[ndxInvent].val.addAll(commToAppendVal.val);
    }
  }

  bool isCurrentValAlsoInInventCommValList(Comm currentVal) {
    bool isFound = false;
    int ndx = wherePresentInTheInvent(
        currentVal.name); //get index of comm in the Invent
    this.inv[ndx].val.forEach((curretnInventCommVal) {
      //loop through each Invent Val and compare names
      if (curretnInventCommVal.name == currentVal.name) {
        isFound = true;
      }
    });
    return isFound;
  }

  int whereCurrentValAlsoInInventCommValList(Comm currentVal) {
    int ndx = -1;
    int ndxInvent = wherePresentInTheInvent(
        currentVal.name); //get index of comm in the Invent
    this.inv[ndxInvent].val.forEach((curretnInventCommVal) {
      //loop through each Invent Val and compare names
      if (curretnInventCommVal.name == currentVal.name) {
        ndx = this.inv[ndxInvent].val.indexOf(curretnInventCommVal);
      }
    });
    return ndx;
  }

  bool isPresentInTheInvent(String name) {
    bool exists = false;
    this.inv.forEach((element) {
      if (element.name == name) {
        exists = true;
      }
    });
    return exists;
  }

  int wherePresentInTheInvent(String name) {
    int ndx = -1;
    this.inv.forEach((element) {
      if (element.name == name) {
        ndx = this.inv.indexOf(element);
      }
    });
    return ndx;
  }
}
