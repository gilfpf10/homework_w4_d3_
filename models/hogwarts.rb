require_relative("../db/sql_runner")


class Student

  attr_accessor :first_name, :second_name, :house_id, :age, :id

  def initialize (options)
    @id = options ["id"].to_i
    @first_name = options["first_name"]
    @second_name = options ["second_name"]
    @house_id = options["house_id"].to_i
    @age = options ["age"].to_i

  end

  def save

    sql = "INSERT INTO students
    (
      first_name,
      second_name,
      house_id,
      age
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING *"
    values = [@first_name,@second_name,@house_id,@age]
    student_data = SqlRunner.run(sql, values)
    @id = student_data.first()['id'].to_i
  end

  def self.find()

    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    students = SqlRunner( sql, values )
    result = Student.new( student.first )
    return result
  end


  def self.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run( sql )
    result = students.map { |student| Student.new( student ) }
    return result
  end

  def student_house()
    sql = "SELECT houses.*
    FROM houses INNER JOIN students
    ON students.house = houses.house_nam
    WHERE student.id = $1 "

    values = [@id]
    houses = SqlRunner.run(sql,values)
    return houses.map { |house_data| House.new( house_data ) }
  end



end
