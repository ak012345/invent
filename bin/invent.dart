import 'comm.dart';

class Invent {
  List<Comm> inv = [];

  List<Comm> getInv() => inv;
  void addComm(Comm commIN) => inv.add(commIN);





  void updateInvent(Comm commIN, Comm commOUT) {
// in:a=4, out:b=1
//in:c=2, out: 
    if (isPresentInTheInvent(commIN.name)) {
      // if the comm is in the inv, update Vals appropriately
      this.updateValsOfInventItem(commIN);
      // todo: add up the inventvalues
    } else {
     // if the commIN wasnt in the Invent, add it.
     this.inv.add(commIN);
    }

    if (isPresentInTheInvent(commOUT.name)) {
      // if the comm OBJECT is in the inv
      this.updateValsOfInventItem(commOUT);
       // todo: subtract invent values
    } else {
      commOUT = new Comm.copy(commOUT);
      commOUT.qty = 0-commOUT.qty;
       this.inv.add(commOUT); // if it isnt there, add it
    }
  }






  void updateValsOfInventItem(Comm commToAppendVal) {
    // bool valWasFound = false;
    commToAppendVal.val.forEach((currentVal) {
      //for each val in the new item
      if (isCurrentValAlsoInInventCommValList(currentVal)) {
        int ndxInvent = wherePresentInTheInvent(currentVal.name); //get index of comm in the Invent
        int ndx = whereCurrentValAlsoInInventCommValList(currentVal); 
        this.inv[ndxInvent].val[ndx].qty = commToAppendVal.qty; //update teh invent Val to the new incomming val
        // valWasFound = true; //the val
      } else {
        int ndxInvent = wherePresentInTheInvent(commToAppendVal.name); //get index of comm in the Invent
        this.inv[ndxInvent].val.add(currentVal);
      }
    });

    // if(!valWasFound){

    //   int ndxInvent = wherePresentInTheInvent(commToAppendVal.name); //get index of comm in the Invent
    //   this.inv[ndxInvent].val.addAll(commToAppendVal.val);
    // }
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
