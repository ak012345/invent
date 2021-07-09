import 'comm.dart';
import 'invent.dart';
import 'trde.dart';

class App {
  App() {
    Invent theInv = new Invent();

    Comm a = new Comm("A", 4);
    Comm b = new Comm("B", 1);
    Comm c = new Comm("C", 2);

    // execute a new trade
    new Trde(a, b, theInv);
    new Trde(c, b, theInv); 

    a.showValEntries();
    b.showValEntries();
    c.showValEntries();

    print("=============");
    print("COMM in INV:");
   theInv.getInv().forEach((comm) {
      print(comm.name + ":   QTY: " + comm.qty.toString());
    });
  }



}
