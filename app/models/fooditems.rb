class Food
  attr_reader :name, :calories, :id

  def initialize(options)
    @name = options[:name]
    @calories = options[:calories]
    @id = options[:id]
  end

  def self.create(options)
    food = Food.new(options)
    food.save
    food
  end

  def save
    Environment.database.execute("INSERT INTO food (name, calories) VALUES ('#{@name}', '#{@calories}')")
    @id = Environment.database.last_insert_row_id
  end
end
