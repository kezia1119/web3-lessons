import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";
import Deque "mo:base/Deque";



actor DBank {
  stable var currentValue: Float = 300;
  currentValue := 300;


  stable var startTime = Time.now();
  startTime := Time.now();


  Debug.print(debug_show(startTime));

  Debug.print(debug_show(currentValue));

  public func topUp(amount: Float) {
    currentValue += amount;

    Debug.print(debug_show(currentValue));
  };
  public func withdrawl(amount: Float){
    let tmpValue: Float = currentValue - amount;
    if (tmpValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print("Errer to withdrawl currentValue ");
    };

  };


  public query func chackBalence(): async Float{
    return currentValue;
  };


  public func compound(){
    let currentTime = Time.now();
    let timeElaoseedNS = currentTime - startTime;
    let timeElaoseedS = timeElaoseedNS / 1000000000;
    currentValue := currentValue * (1.01 **Float.fromInt(timeElaoseedS));
    startTime := currentTime;
  };

};