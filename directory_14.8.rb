# 8. Write a short program that reads its own source code (search StackOverflow to find out how to get the name of the currently executed file) and prints it on the screen.

puts File.read($0) 

require 'csv'
@students = []

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save students"
    puts "4. Load students"
    puts "9. Exit"
end 

def show_students
    print_header
    print_students_list(@students)
    print_footer(@students)
end 

def interactive_menu
    loop do 
       print_menu
       process(STDIN.gets.chomp)
    end 
end 

def process(selection)
    case selection
        when "1" then input_students
        when "2" then show_students
        when "3" then save_students
        when "4" then file_choice                              
        when "9" then exit
        else 
            puts "I don't know what you mean, try again"
    end 
end 

def input_students
    students_names = []
    puts "Please enter the name of the students"
    puts "To finish, just hit return twice"
    
    name = STDIN.gets.chomp.capitalize
    while !name.empty? do
    students_names << name
    puts students_names.count > 0 ? "Now we have #{students_names.count} students" : "Now we have #{students_names.count} student"
    name = STDIN.gets.chomp.capitalize 
    end
    
    return student_list(students_names)
    
end 

def student_list(students_names)
    
    students_names.each {|name| @students << {name: name, cohort: :november}}
    
    @students
end 

def print_header 
    puts "The Students of the Villians Academy"
    puts "-------------"
end 

def print_students_list(students)
    @students.each do |student|
        puts "#{student[:name]}, (#{student[:cohort]} cohort)"
    end 
end 

def print_footer(students)
    puts @students.count > 1 ? "Overall, we have #{@students.count} great students" : "Overall, we have #{@students.count} great student" 
end 


def save_students
    puts "In which file do you wish to save the student list?"                  # 5. Make the script more flexible by asking for the filename if the user chooses these menu items.
    filename = STDIN.gets.chomp
    CSV.open(filename, 'w') do |student_data|
        #student_data << [:name, :cohort]
        @students.each do |student| 
        student_data << [student[:name], student[:cohort]]
    end 
    end 
    puts @students.count > 1 ? "Saved #{@students.count} students to #{filename}" : "Saved #{@students.count} student to #{filename}" 
end 

def file_choice 
    puts "Which file do you wish to load?"                                      # 5. Make the script more flexible by asking for the filename if the user chooses these menu items.
    filename = STDIN.gets.chomp
    
    load_students(filename) 
end 


def load_students(filename = "students.csv")
    students_names = []
    CSV.foreach(filename) do |line|
        name = line.first
        students_names << name 
    end
    puts "Loaded #{students_names.count} students from #{filename}"
    return student_list(students_names)

end 

def load_file 
    filename = ARGV.first || "students.csv" 
    return if filename.nil? 
    if File.exist?(filename)
        load_students(filename)
    else 
        puts "Sorry, #{filename} doesn't exist."
        exit 
    end 
end 



load_file 
interactive_menu
