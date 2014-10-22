class People

  attr_accessor :name

  def initialize name
    @name = name
  end

  def greeting
    puts "Hi my name is #{name}"
  end

end

class Student < People

  def learn
    puts "I get it!"
  end
end

class Instructor < People
  def teach
    puts "Everything in Ruby is an Object"
  end

end

chris = Student.new("Chris")
christina = Instructor.new("Christina")

chris.greeting
christina.greeting

christina.teach
chris.learn

# chris.teach
# the above won't work because the teach method is defined only
# in the Instructor class
