def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  cohort = gets.chomp 
  
    while !name.empty? do 
        # add the student hash to the array
        students << {name: name, cohort: cohort}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
        cohort = gets.chomp
    end
    
  # return the array of students
  students
end

def cohort(students)
    
    cohort_list = []
    students.map {|student| cohort_list << student[:cohort]}
    if cohort_list.size <= 2
        cohort_options = cohort_list.uniq.join", "
    else
        last_cohorts = cohort_list.pop(2)
        cohort_joined = cohort_list << last_cohorts.join(" and ")
        cohort_options = cohort_joined.flatten.uniq.join", "
    end 
    puts "Which cohort would you like to see: #{cohort_options}"
    selected_cohort = gets.chomp.capitalize.to_sym 
    
    puts "Students from the #{selected_cohort} cohort:"
    students.map do |student| 
        puts "#{student[:name]}, (#{student[:cohort]} cohort)" if selected_cohort == student[:cohort] 
        end 
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

students = input_students
print_header
cohort(students)
#print(students)
print_footer(students)
