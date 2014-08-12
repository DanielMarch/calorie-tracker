class MealController
  def add
    puts "What meal would you like to add food to?"
    meal = clean_gets
    if meal == "breakfast" || meal == "lunch" || meal == "dinner"
      newmeal = Meal.create(meal: meal)
      puts "Would you like to add a food item to '#{meal}'?"
      answer = clean_gets
      if answer == "yes"
        puts "What food would you like to add?"
        fooditem = clean_gets
        newevent = Event.create(food: fooditem, meal: meal)
      elsif answer == "no"
        puts "Okay..."
      else
        puts "Thats a nonsense answer. Yes or No stupid."
      end
    elsif meal == "brunch"
      puts "Brunch? Are you tring to be clever?"
    elsif meal == "supper"
      puts "This is not ye olden times, try dinner."
    else
      puts "I do not recognize that meal. Try again."
    end
  end
end
