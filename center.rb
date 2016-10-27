def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  
    while !name.empty? do 
        # add the student hash to the array
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
    end
    
  # return the array of students
  students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students)
    students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def center(students)
    students.each do |student|
    puts "#{student[:name]},".center(35) + "(#{student[:cohort]} cohort)"
    end 
end 
    #student_cohort = student[:cohort].inspect.center(40)
    #cohort = "#{"(#{student[:cohort]} cohort)".length}".to_i
    #puts "#{"(#{student[:cohort]} cohort)".length}"
    # puts "#{student[:name].length}"
    #puts "#{30 - student[:name].length + cohort}"
    #.center(10 - student[:name].length + student[:name].length)
    
    #center(30 - student[:name].length + student[:cohort].length )


students = input_students
print_header
print(students)
print_footer(students)
center(students)
