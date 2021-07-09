import 'bin/comm.dart';
import 'bin/invent.dart';
import 'bin/trde.dart';

class app {
  app() {
    Invent inv = new Invent();

    Comm a = new Comm("A", 4);
    Comm b = new Comm("B", 1);
    Comm c = new Comm("C", 2);

    // execute a new trade
    new Trde(a, b);
    new Trde(c, b); 

    a.showValEntries();
    b.showValEntries();
    c.showValEntries();

    print("=============");
    print("COMM in INV:");
    Invent.getInv().forEach((comm) {
      print(comm.name + ":   QTY: " + comm.qty.toString());
    });
  }
}
