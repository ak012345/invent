import 'comm.dart';
import 'invent.dart';

class Trde {
  Trde(Comm commIn, Comm commOut, Invent theInv) {
    Comm newTrdeInVal = new Comm(commIn.name, commOut.qty / commIn.qty);
    Comm newTrdeOutVal = new Comm(commOut.name, commIn.qty / commOut.qty);

    Comm copyOfCommIn = new Comm.copy(commIn);
    Comm copyOfCommOut = new Comm.copy(commOut);

    copyOfCommIn.addVal(newTrdeInVal);
    copyOfCommOut.addVal(newTrdeOutVal);

    theInv.updateInvent(copyOfCommIn, copyOfCommOut);
  }
}
