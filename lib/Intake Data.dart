import 'package:shared_preferences/shared_preferences.dart';

class MealData{
  //3: Add attribute
  double totalCalories;
  double totalCarbohydrates;
  double totalSodium;
  double totalFat;
  double totalCholesterol;
  double totalPotassium;

  //4: Add to constructor
  MealData(this.totalCalories, this.totalCarbohydrates, this.totalSodium, this.totalFat, this.totalCholesterol, this.totalPotassium);
}

class TotalIntakeData{
  static Map<String, MealData> userIntakes = new Map();
  static Future<void> addInfoToday(String day, MealData m) async{
    if (!userIntakes.containsKey(day))
    {
      userIntakes[day] = m;
    }
    else {
      userIntakes[day]?.totalCalories += m.totalCalories;
      userIntakes[day]?.totalCarbohydrates += m.totalCarbohydrates;
      userIntakes[day]?.totalCholesterol += m.totalCholesterol;
      userIntakes[day]?.totalFat += m.totalFat;
      userIntakes[day]?.totalPotassium+= m.totalPotassium;
      userIntakes[day]?.totalSodium += m.totalSodium;
    }
  await saveInformation();
  }
  static Future<void> saveInformation () async{
    final prefs = await SharedPreferences.getInstance();
    double totalCals = getAverageDailyCalories();
    double totalCarbs = getAverageDailyCarbs();
    double totalCholesterol = getAverageDailyCholesterol();
    double totalFat = getAverageDailyFat();
    double totalPotassium = getAverageDailyPotassium();
    double totalSodium = getAverageDailySodium();

    await prefs.setDouble("Average Calories", totalCals);
    await prefs.setDouble("Average Carbohydrates", totalCarbs);
    await prefs.setDouble("Average Cholesterol", totalCholesterol);
    await prefs.setDouble("Average Fat", totalFat);
    await prefs.setDouble("Average Potassium", totalPotassium);
    await prefs.setDouble("Average Sodium", totalSodium);
  }
  static double getAverageDailyCalories() {
    num avg = 0;
    userIntakes.forEach((key, value) {
      avg += value.totalCalories;
    });
    return avg/userIntakes.length;
  }
  static double getAverageDailyCarbs() {
    num avg = 0;
    userIntakes.forEach((key, value) {
      avg += value.totalCarbohydrates;
    });
    return avg/userIntakes.length;
  }
  //9: Average
  static double getAverageDailySodium(){
    num avg = 0;
    userIntakes.forEach((key, value) {
      avg += value.totalSodium;
    });
    return avg/userIntakes.length;
  }
  static double getAverageDailyFat(){
    num avg = 0;
    userIntakes.forEach((key, value) {
      avg += value.totalFat;
    });
    return avg/userIntakes.length;
  }
  static double getAverageDailyCholesterol(){
    num avg = 0;
    userIntakes.forEach((key, value) {
      avg += value.totalCholesterol;
    });
    return avg/userIntakes.length;
  }
  static double getAverageDailyPotassium(){
    num avg = 0;
    userIntakes.forEach((key, value) {
      avg += value.totalPotassium;
    });
    return avg/userIntakes.length;
  }
}