class ViewController
  def view
    sum = Environment.database.execute("SELECT SUM(calories) FROM event WHERE date LIKE '#{DateTime.now.strftime("%y%m%d")}'").last
    puts "Your total calorie count for the day is #{sum[0]}"
  end
end
