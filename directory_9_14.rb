@students = []

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we will be adding more items 
end 

def show_students
    print_header
    print_students_list(@students)
    print_footer(@students)
end 

def interactive_menu
    loop do 
       print_menu
       process(gets.chomp)
    end 
end 

def process(selection)
    case selection
        when "1"
            input_students
        when "2"
            show_students
        when "9"
            exit # this will cause the program to terminate 
        else 
            puts "I don't know what you mean, try again"
    end 
end 




def input_students
    puts "Please enter the name of the students"
    puts "To finish, just hit return twice"
    # create an empty array 
    @students = []
    # get the first name 
    name = gets.chomp.capitalize
    # while name is not empty, repeat this code
    while !name.empty? do
    # add the students has to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user 
    name = gets.chomp.capitalize 
    end
    
    # return array of students 
    @students
end 

def print_header 
    puts "The students of the Villians Academy"
    puts "-------------"
end 

def print_students_list(students)
    @students.each do |student|
        puts "#{student[:name]}, (#{student[:cohort]} cohort)"
    end 
end 

def print_footer(students)
    puts "Overall, we have #{@students.count} great students"
end 


interactive_menu
        
        