class Intake{
  //5: Add new attribute
  double calories = 0;
  double carbohydrates = 0;
  double sodium = 0;
  double fat = 0;

  void updateCalories (double newCal) {
    calories += newCal;
  }
  void updateCarbs(double newCarbs) {
    carbohydrates += newCarbs;
  }
  //6: Add update
  void updateSodium(double newSodium) {
    sodium += newSodium;
  }
  void updateFat(double newFat) {
    sodium += newFat;
  }

  //7: Add to toString
  @override
  String toString() {
   return "calories: " + calories.toString() +
       ", carbs: " + carbohydrates.toString() +
       ", sodium: " + sodium.toString() +
       ", fat: " + fat.toString();
  }
}
class MealData{
  //3: Add attribute
  double totalCalories;
  double totalCarbohydrates;
  double totalSodium;
  double totalFat;

  //4: Add to constructor
  MealData(this.totalCalories, this.totalCarbohydrates, this.totalSodium, this.totalFat);
}

class TotalIntakeData{
  static Map<String, Intake> userIntakes = new Map();
  static void addInfoToday(String day, MealData m) {
    if (!userIntakes.containsKey(day))
    {
      userIntakes[day] = new Intake();
    }
    userIntakes[day]!.updateCalories(m.totalCalories);
    userIntakes[day]!.updateCarbs(m.totalCarbohydrates);
    //8: update
    userIntakes[day]!.updateSodium(m.totalSodium);
    userIntakes[day]!.updateSodium(m.totalFat);
    print(userIntakes);
  }
  static double getAverageDailyCalories() {
    num avg = 0;
    userIntakes.forEach((key, value) {
      avg += value.calories;
    });
    return avg/userIntakes.length;
  }
  static double getAverageDailyCarbs() {
    num avg = 0;
    userIntakes.forEach((key, value) {
      avg += value.carbohydrates;
    });
    return avg/userIntakes.length;
  }
  //9: Average
  static double getAverageDailySodium(){
    num avg = 0;
    userIntakes.forEach((key, value) {
      avg += value.sodium;
    });
    return avg/userIntakes.length;
  }
  static double getAverageDailyFat(){
    num avg = 0;
    userIntakes.forEach((key, value) {
      avg += value.fat;
    });
    return avg/userIntakes.length;
  }
}