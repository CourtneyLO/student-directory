def input_students
    
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    name = gets.chomp.capitalize 
    puts "Please indicate cohort"
    cohort = gets.chomp.capitalize.to_sym                                       # 7. How can you ask for both the name and the cohort? & How will you convert it to a symbol?
    cohort.empty? ? cohort = :November : cohort                                 # 7. What if one of the values is empty? Can you supply a default value?
    # while the name is not empty, repeat this code
    while !name.empty? do 
        # add the student hash to the array
        students << {name: name, cohort: cohort}
        # 9. How can you fix it so that it used singular form when appropriate and plural form otherwise?
        puts students.index({name: name, cohort: cohort}) > 0 ? "Now we have #{students.count} students" : "Now we have #{students.count} student"
        # get another name from the user 
        name = gets.chomp.capitalize
        puts "Please indicate cohort"
        cohort = gets.chomp.capitalize.to_sym                                   # 7. How can you ask for both the name and the cohort? & How will you convert it to a symbol?
        cohort.empty? ? cohort = :November : cohort                             # 7. What if one of the values is empty? Can you supply a default value?
    end 
    # return the array of students 
     
    typo(students)
end 

def print_header
    puts "The students of Villains Academy"
    puts "--------------"
end 

def print(students)
    students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end 
end 

def print_footer(students)
    # 9. How can you fix it so that it used singular form when appropriate and plural form otherwise?
    puts students.count > 1 ? "Overall, we have #{students.count} great students" : "Overall, we have #{students.count} great student"
end 

# 1. How can you modify the program to print a number before the name of each student, e.g. "1. Dr. Hannibal Lecter"? 
def numbering_students(students)
    students.each_with_index {|student, index| puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"}
end 

# 2. Modify your program to only print the students whose name begins with a specific letter. 
def specific_letter(students)
    puts "Please indicate the first letter of the name you wish to see."
    answer = gets.chomp.capitalize
    students.select {|student| puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name].split("").shift == answer }
end 

# 3. Modify your program to only print the students whose name is shorter than 12 characters.
def shorter_12_characters(students)
    puts "Students with names shorter than 12 characters:"
    students.each {|student| puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name].length < 12 }
end 

# 4. Rewrite the each() method that prints all students using while or until control flow methods
def while_print(students)
    index = 0 
    while index < students.size 
        puts "#{students[0 + index]}"
    index += 1   
    end 
end 

# 7. What if the user makes a typo?
def typo(students)
    
    index = 0 
    while index < students.size 
        puts "#{students[0 + index]}"
    index += 1   
    end 
    
    puts "Do you wish to change anything?"
    answer = gets.chomp
    
        if answer.include? "y"
            return input_students
        elsif answer.include? "n"
            students
        else 
            puts "please type again"
        end 
end 

# 8. Change the way the users are displayed: print them grouped by cohorts.
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
# nothing happens until we call these methods 
print_header
print(students)
print_footer(students)
numbering_students(students)
specific_letter(students)
shorter_12_characters(students)
while_print(students)
cohort(students)

    