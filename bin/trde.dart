import 'comm.dart';
import 'invent.dart';

class Trde {
  // in:a=4, out:b=1
  Trde(Comm commIn, Comm commOut, Invent theInv) {
    Comm newTrdeOutVal = new Comm(commOut.name, (commOut.qty / commIn.qty));
    Comm newTrdeInVal = new Comm(commIn.name, commIn.qty / commOut.qty);

    Comm copyOfCommIn = new Comm.copy(commIn);
    Comm copyOfCommOut = new Comm.copy(commOut);

    copyOfCommIn.addVal(newTrdeOutVal);
    copyOfCommOut.addVal(newTrdeInVal);

    theInv.updateInvent(copyOfCommIn, copyOfCommOut);
  }
}
