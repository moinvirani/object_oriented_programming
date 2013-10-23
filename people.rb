# identifying names

  class Person

    def initialize(name)
      @name = name
    end

    def greeting
      puts "Hi, my name is #{@name}"
    end
  end




  class Student < Person  # < is to inherit
    def learn
      puts "I get it!"
    end
  end

  class Instructor < Person
    def teach
       puts "Everything in Ruby is an Object."
    end
  end


instructor_chris = Instructor.new("Chris")
instructor_chris.greeting
puts "\n"

student_christina = Student.new("Cristina")
student_christina.greeting
puts "\n"

instructor_chris.teach
student_christina.learn
puts "\n"

student_christina.teach
puts "\n"


# The teach method on the student doesn't work because the 
# teach method is inside the instructor class and not in the student class



