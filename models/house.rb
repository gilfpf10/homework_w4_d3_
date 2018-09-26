require_relative("../db/sql_runner")
require_relative("../models/hogwarts")

class House

  attr_accessor :house_name, :id

  def initialize(options)
    @id = options ["id"].to_i
    @house_name = options ["house_name"]
end
    def save()
sql = "INSERT INTO houses
(
  house_name
)
VALUES($1)
RETURNING *"
 values = [@house_name]
 house_name_data = SqlRunner.run(sql,values)
 @id = house_name_data.first() ["id"].to_i
end

def self.find()

  sql = "SELECT * FROM houses WHERE id = $1"
  values = [id]
  houses = SqlRunner( sql, values )
  result = House.new( house.first )
  return result
end


def self.all()
  sql = "SELECT * FROM houses"
  houses = SqlRunner.run( sql )
  result = houses.map { |house| House.new( house ) }
  return result
end





end
