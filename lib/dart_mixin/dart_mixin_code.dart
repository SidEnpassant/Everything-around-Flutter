// dart mixin helps in code reusability , it helps making code reusable

// inheritance also used for code reusability but there are cons -
// cannot inherit multiple classes

// but with mixin get two property of mixin , with mixin can do that

class Animal with Walk , Talk , Reproduce{
  int legs = 0;

}

class Human with Walk , Talk , Reproduce{

}

mixin Walk{
  void walk(){

  }
}


mixin Talk{
  void talk(){

  }
}

mixin Reproduce{
  void reproduce(){

  }
}

// IN CASE OF INHERITANCE CAN ONLY EXTEND ONE SINGLE PARENT CLASS FOR CODE REUSABILITY
// BUT HERE IN CASE OF MIXIN CAN USE MULTIPLE BY USING - "WITH"
