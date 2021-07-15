class Comm {
  String name = "";
  double qty = 0;
  List<Comm> val = [];

  Comm(String name, double qty) {
    this.name = name;
    this.qty = qty;
  }

  Comm.copy(Comm newComm) {
    this.name = newComm.name.toUpperCase();
    this.qty = newComm.qty;
    this.val = newComm.val;
  }

  double getQty() => this.qty;
  String getName() => this.name;
  List<Comm> getVals() => this.val;

  //changes didnt do nothing. fixME
  void addVal(Comm someVal) {
    this.val.add(someVal);
  }

  void updateVals(Comm someValWithoutChildren) {
    this.val.forEach((element) {
      if (element.name == someValWithoutChildren.name) {
        int ndx = this.val.indexOf(element);
        this.val[ndx].qty = someValWithoutChildren.qty;
      }
    });
  }

  void showValEntries() {
    this.val.forEach((comm) {
      print("1 " +
          this.name +
          ": is worth " +
          comm.qty.toString() +
          "  " +
          comm.name +
          "(s)");
    });
  }
}
