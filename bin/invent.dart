import 'comm.dart';

class Invent {
  List<Comm> inv = [];

  List<Comm> getInv() => inv;
  void addComm(Comm commIN) => inv.add(commIN);

  void updateInvent(Comm commIN, Comm commOUT) {
// in:a=4, out:b=1
//in:c=2, out:
    if (isPresentInTheInvent(commIN.name)) {
      // if the commIn is in the inv, update Vals
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
      commOUT.qty = 0 - commOUT.qty;
      this.inv.add(commOUT); // if it isnt there, add it
    }
  }

  void updateValsOfInventItem(Comm comm_IN_OR_OUT) {
    List<Comm> copiedListofVALSfrom_IN_OR_OUT = List.from(comm_IN_OR_OUT.val);
    // Find Inv.comm.name match with comm_IN_OR_OUT.name
    int inventNDX = wherePresentInTheInvent(comm_IN_OR_OUT.name);
    Comm inventCommOfInterest = this.inv[inventNDX];

    copiedListofVALSfrom_IN_OR_OUT.forEach((currentVal) {
      //for each val in the new item
      if (inventNDX != -1) {
        inventCommOfInterest.updateVals(currentVal);
      } else {
        this.inv[inventNDX].val.add(currentVal);
      }
    });
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
