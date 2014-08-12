require 'sqlite3'

class Environment

  def self.environment=(environment)
    @@environment = environment
  end

  def self.database
    unless @database
      @database = SQLite3::Database.open("db/#{@@environment}.sqlite")
      @database.execute "CREATE TABLE IF NOT EXISTS food(id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(29), calories INTEGER)"
      @database.execute "CREATE TABLE IF NOT EXISTS meal(id INTEGER PRIMARY KEY AUTOINCREMENT, meal VARCHAR(29), date DATETIME)"
      @database.execute "CREATE TABLE IF NOT EXISTS event(id INTEGER PRIMARY KEY AUTOINCREMENT, meal VARCHAR(29), date DATETIME, food VARCHAR(29), calories INTEGER)"
    end
    @database
  end
end
