class Event
  attr_reader :food, :meal, :date, :id

  def initialize(options)
    @food = options[:food]
    @meal = options[:meal]
    @date = DateTime.now.strftime("%y%m%d")
    @id = options[:id]
  end

  def self.create(options)
    row = Environment.database.execute("SELECT * FROM food WHERE name	LIKE '#{options[:food]}'")
    if row == []
      puts "#{options[:food]} does not exist yet. How about creating that first skippy."
    else
      row2 = Environment.database.execute("SELECT * FROM meal WHERE meal LIKE '#{options[:meal]}' AND date LIKE '#{DateTime.now.strftime("%y%m%d")}'")
      if row2 == []
        puts "If you see this something really broke"
      else
        row3 = Environment.database.execute("SELECT meal.meal, meal.date, food.name, food.calories FROM meal, food WHERE meal LIKE '#{options[:meal]}' AND name like '#{options[:food]}' AND  date LIKE '#{DateTime.now.strftime("%y%m%d")}'").last
        Environment.database.execute("INSERT INTO event (meal, date, food, calories) VALUES ('#{row3[0]}', '#{row3[1]}', '#{row3[2]}', '#{row3[3]}')")
        @id = Environment.database.last_insert_row_id
      end
    end
  end
end
