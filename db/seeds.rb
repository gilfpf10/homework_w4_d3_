require_relative("../models/hogwarts")
require_relative("../models/house")
require("pry-byebug")

house1 = House.new({
  "house_name" => "Gryffindor"
  })
  house1.save
house2 = House.new({
  "house_name" => "Ravenclaw"
  })
  house2.save
house3 = House.new({
  "house_name" => "Hufflepuff"
  })
  house3.save
house4 = House.new({
  "house_name" => "Slytherin"
  })
house4.save


student1 = Student.new({
"first_name"=> "Harry",
"second_name"=>"Potter",
"house_id"=> house1.id,
"age" => 16
  })
student1.save
student2 = Student.new({
"first_name"=> "Hermione",
"second_name"=>"Granger",
"house_id"=> house2.id,
"age" => 17
  })
student2.save

student3 = Student.new({
"first_name"=> "Dracco",
"second_name"=>"Malfoy",
"house_id"=> house3.id,
"age" => 18
  })
student3.save

binding.pry
nil
