class Food
  attr_reader :name, :calories, :id

  def initialize(options)
    @name = options[:name]
    @calories = options[:calories]
    @id = options[:id]
  end

  def self.create(options)
    row = Environment.database.execute("SELECT * FROM food WHERE name	LIKE '#{options[:name]}'")
    if row == []
      food = Food.new(options)
      food.save
      food
    else
      puts 'That food already exists'
    end
  end

  def save
    Environment.database.execute("INSERT INTO food (name, calories) VALUES ('#{@name}', '#{@calories}')")
    @id = Environment.database.last_insert_row_id
  end
end
