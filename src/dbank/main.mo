import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";


actor Dbank{
  stable var currentValue: Float = 300;
  currentValue := 300;
  let id = 23489132847283;
  stable var startTime = Time.now();

  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float){
    if(currentValue > amount) {
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Low balance")
    };
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElaspedNS = currentTime - startTime;
    let timeElaspedS = timeElaspedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElaspedS));
  };
};
