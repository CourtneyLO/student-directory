def input_students
    
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    name = gets.chomp.split(" ").map(&:capitalize).join(" ") 
    puts "Please indicate cohort"
    cohort = gets.chomp.capitalize.to_sym                                   # 7. How can you ask for both the name and the cohort? & How will you convert it to a symbol?
    cohort = :November if cohort.empty?                                     # 7. What if one of the values is empty? Can you supply a default value? => only by using an if statement
    puts "How old are you?"
    age = gets.chomp
    puts "What are your hobbies?"
    hobbies = gets.delete("\n")                                                 # 10. Find another method among those provided by the String class that could be used for the same purpose.
    puts "What country are you from?"                                           #     Other methods are .strip and .chop      
    country = gets.strip
    puts "What is you height?"
    height = gets.chop 
    # while the name is not empty, repeat this code
    while !name.empty? do 
        # add the student hash to the array
        students << {name: name, cohort: cohort, age: age, hobbies: hobbies, country: country, height: height}
        # 9. How can you fix it so that it used singular form when appropriate and plural form otherwise?
        puts students.index({name: name, cohort: cohort, age: age, hobbies: hobbies, country: country, height: height}) > 0 ? "Now we have #{students.count} students" : "Now we have #{students.count} student"
        # get another name from the user 
        name = gets.chomp.split(" ").map(&:capitalize).join(' ')
        puts "Please indicate cohort"
        cohort = gets.chomp.capitalize.to_sym                                   # 7. How can you ask for both the name and the cohort? & How will you convert it to a symbol?
        cohort.empty? ? cohort = :November : cohort                             # 7. What if one of the values is empty? Can you supply a default value?
        puts "How old are you?"
        age = gets.chomp
        puts "What are your hobbies?"
        hobbies = gets.delete("\n") 
        puts "What country are you from?"
        country = gets.strip
        puts "What is you height?"
        height = gets.chop 
 
    end 
    # return the array of students 
     
    typo(students)
end 

def print_header(students) 
        puts "The students of Villians Academy" if !students.empty?
        puts "-------------" if !students.empty?
    
end  

def print(students)
    students.each do |student|
        puts "#{student[:name]}, (#{student[:cohort]} cohort, #{student[:age]} years old, hobbies: #{student[:hobbies]}, country of birth: #{student[:country]} and height: #{student[:height]}cm)"
    end 
end 

def print_footer(students)
    # 9. How can you fix it so that it used singular form when appropriate and plural form otherwise?
    puts students.count > 1 ? "Overall, we have #{students.count} great students" : "Overall, we have #{students.count} great student" if !students.empty?  
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
        puts "#{index + 1}. #{students[0 + index][:name]} (#{students[0 + index][:cohort]} cohort)"
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
    
    if !students.empty? 
    puts "Do you wish to change anything?"
    answer = gets.chomp
    
        if answer.include? "y"
            return input_students
        elsif answer.include? "n"
            students
        else 
            puts "please type again"
            typo(students)
        end 
    else 
       exit(0)
    end 
end 
# 12. There are two ways you can prevent the list from printing when no input is given. 1) use if !students.empty? in header and footer or 
#     2. use if else statment in typo that will exit if no input is given 

# 6. Research how the method center() of the String class works. Use it in your code to make the output beautifully aligned.
def center(students)
    students.each do |student|
    puts "#{student[:name]},".center(35) + "(#{student[:cohort]} cohort)"
    end 
end 


# 8. Change the way the users are displayed: print them grouped by cohorts.
def cohort(students)
    
    cohort_list = []
    students.map {|student| cohort_list << student[:cohort]}
    if cohort_list.size <= 2
        cohort_options = cohort_list.uniq.join(" or ")
    else
        last_cohorts = cohort_list.pop(2)
        cohort_joined = cohort_list << last_cohorts.join(" or ")
        cohort_options = cohort_joined.flatten.uniq.join", "
    end
    puts "Which cohort would you like to see: #{cohort_options}?"
    selected_cohort = gets.chomp.capitalize.to_sym 
    
    puts "Students from the #{selected_cohort} cohort:"
    students.map do |student| 
        puts "#{student[:name]}, (#{student[:cohort]} cohort)" if selected_cohort == student[:cohort] 
        end 
end


students = input_students 
# nothing happens until we call these methods 
print_header(students)
print(students)
print_footer(students)
numbering_students(students)
specific_letter(students)
shorter_12_characters(students)
while_print(students)
center(students)
cohort(students)

