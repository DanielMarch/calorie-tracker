class FoodItemsController
  def add
    puts "What Food would you like to add?"
    name = gets.chomp
    puts "You have added a #{name}. How many calories are in this item?"
    calories = gets.to_i
    puts "Your #{name} contains #{calories} calories."
    food = Food.create(name: name, calories: calories)
  end
end
