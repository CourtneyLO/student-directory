def input_students 
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create and empty array
    students = []
    # get the first name 
    name = gets.chomp.capitalize 
    name.empty? ? cohort = "No Name" : cohort 
    puts "Please indicate which cohort you are in"
    cohort = gets.chomp.capitalize.to_sym 
    cohort.empty? ? cohort = ":November" : cohort 
   
    # while the name is not empty, repeat this code 
    while !name.empty? do 
        # add student hash to the array
        students << {name: name, cohort: cohort}
        puts students.index({name: name, cohort: cohort}) > 0 ? "Now we have #{students.count} students" : "Now we have #{students.count} student"
        # get another name from the user 
        puts "Name"
        name = gets.chomp.capitalize 
        name.empty? ? cohort = "No Name" : cohort 
        puts "Cohort"
        cohort = gets.chomp.capitalize.to_sym 
        cohort.empty? ? cohort = ":November" : cohort 
    end 
    # return the array of students 
    students
end 

def print_header(students) 
    if !students.empty?                                 # 12
        puts "The students of Villians Academy"
        puts "-------------"
    else 
        return nil
    end 
end 


def print(students)
    students.each do |student|
        puts "#{student[:name]}, (#{student[:cohort]} cohort)"
        end 
end 

def print_footer(names)
    if !names.empty?                                                            # 12 
        puts names.count > 1 ? "Overall, we have #{names.count} great students" : "Overall, we have #{names.count} great student" # 9.
    else 
        return nil
    end 
end 

# 1. We're using the each() method to iterate over an array of students. 
#    How can you modify the program to print a number before the name of each student, 
#    e.g. "1. Dr. Hannibal Lecter"? Hint: look into each_with_index()
def each_with_index(students)
    students.each_with_index {|student, index| puts "#{index + 1}. #{student[:name]}"} #(#{student[:cohort]} cohort)"} 
end 

# 2. Modify your program to only print the students whose name begins with a specific letter. 
def specific_letter(students, letter)
    students.select {|student| puts "#{student[:name]} has a name beginning with the letter #{letter}" if student[:name].split("").shift == letter }
end 

# 3. Modify your program to only print the students whose name is shorter than 12 characters.
def shorter_12_characters(students)
    students.each {|student| puts "#{student[:name]} has a name shorter than 12 character" if student[:name].length < 12 }
end 
 
# 4. Rewrite the each() method that prints all students using while or until control flow methods
def while_print(students)
    index = 0 
    while index < students.size 
        puts "#{students[0 + index]}"
    index += 1   
    end 
end   
 

def center(students)
    students.each do |student|
        #name_longest = student[:name].length
        #puts "#{name_longest}"
        #length = student_min - student[:name].length + 30 
        #puts "#{length}"
        puts "#{student[:name]}, (#{student[:cohort]} cohort)".center(40)
    
    #center(30 - student[:name].length + student[:cohort].length )
    end 
end 
    
    # + (student[:name].length)
    
    
    # .center(25 - student[:name].length)
# 8. Once you complete the previous exercise, change the way the users are displayed:
#    print them grouped by cohorts. To do this, you'll need to get a list of all existing cohorts
#    (the map() method may be useful but it's not the only option), iterate over it and only print the students from that cohort.   
def cohort(students)
    
    cohort_list = []
    students.map {|student| cohort_list << student[:cohort]}
    cohort_options = cohort_list.uniq.join", "
    
    puts "Which cohort would you like to see: #{cohort_options}"
    selected_cohort = gets.chomp.capitalize.to_sym 
    
    students.map do |student| 
        puts "#{student[:name]}, (#{student[:cohort]} cohort)" if selected_cohort == student[:cohort] 
        end 
end 

# 10) .strip! && .chop && delete!("/n")
  
students = input_students 
print_header(students)
#print(students)
#each_with_index(students)
#shorter_12_characters(students)
#specific_letter(students, "D")
#while_print(students)
#more_info(students)
center(students)
#cohort(students)
print_footer(students)
