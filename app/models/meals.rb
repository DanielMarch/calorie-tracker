class Meal
  attr_reader :meal, :date, :id

  def initialize(options)
    @meal = options[:meal]
    @id = options[:id]
    @date = DateTime.now.strftime("%y%m%d")
  end

  def self.create(options)
    row = Environment.database.execute("SELECT * FROM meal WHERE meal LIKE '#{options[:meal]}' AND date LIKE '#{DateTime.now.strftime("%y%m%d")}'")
    if row == []
      meal = Meal.new(options)
      meal.save
      meal
      puts 'Meal was saved.'
    else
      puts 'Meal already exists.'
    end
  end

  def save
    Environment.database.execute("INSERT INTO meal (meal, date) VALUES ('#{@meal}', '#{@date}')")
    @id = Environment.database.last_insert_row_id
  end
end
