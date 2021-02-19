class complex {
  float r;
  float i;
  complex(float real, float imag) {
    this.r = real;
    this.i = imag;}
  complex(complex a) {
    this.sv(a.gr(), a.gi());}  
  float gr() {
    return this.r;}
  float gi() {
    return this.i;}
  void sv(float real, float imag) {
    this.r = real;
    this.i = imag;}
  void sv(complex a) {
    this.r = a.gr();
    this.i = a.gi();}
  float gm() {
    return sqrt(sq(this.gr())+sq(this.gi()));}
  void addc(complex b) {
    this.sv(this.gr() + b.gr(), this.gi() + b.gi());}
  void subc(complex b) {
    this.sv(this.gr() - b.gr(), this.gi() - b.gi());}
  void multic(complex b) { //a*b
    this.sv(this.gr()*b.gr()-this.gi()*b.gi(), this.gr()*b.gi() + b.gr()*this.gi());}
  void multis(float x) {
    this.sv(this.gr()*x, this.gi()*x);}
  void divc(complex b) { //a/b
    this.sv((this.gr()*b.gr()+this.gi()*b.gi())/( pow(b.gr(),2)+pow(b.gi(),2)),(b.gr()*this.gi()-this.gr()*b.gi())/( pow(b.gr(),2)+pow(b.gi(),2)));}
  void expoc(int p) {
    this.sv(pow(sqrt(pow(this.gr(),2)+pow(this.gi(),2)),p)*cos(p*atan2(this.gi(),this.gr())),pow(sqrt(pow(this.gr(),2)+pow(this.gi(),2)),p)*sin(p*atan2(this.gi(),this.gr())));}
  
  //complex addc(complex b) {
  //  return new complex(this.gr() + b.gr(), this.gi() + b.gi());}
  //complex subc(complex b) {
  //  return new complex(this.gr() - b.gr(), this.gi() - b.gi());}
  //complex multic(complex b) { //a*b
  //  return new complex(this.gr()*b.gr()-this.gi()*b.gi(), this.gr()*b.gi() + b.gr()*this.gi());}
  //complex divc(complex b) { //a/b
  //  return new complex((this.gr()*b.gr()+this.gi()*b.gi())/( pow(b.gr(),2)+pow(b.gi(),2)),(b.gr()*this.gi()-this.gr()*b.gi())/( pow(b.gr(),2)+pow(b.gi(),2)));}
  //complex expoc(int p) {
  //  return new complex(pow(sqrt(pow(this.gr(),2)+pow(this.gi(),2)),p)*cos(p*atan2(this.gi(),this.gr())),pow(sqrt(pow(this.gr(),2)+pow(this.gi(),2)),p)*sin(p*atan2(this.gi(),this.gr())));}

}
