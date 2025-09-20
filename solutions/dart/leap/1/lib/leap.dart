class Leap {
  bool leapYear(int year){
    if((year%4==0&&year%100!=0) || (year%400==0)){
      return true;
    } 
    else {
      return false;
    }
  }
}
void main(){
  final leap = Leap();
  print(leap.leapYear(2015));
}
