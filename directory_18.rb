puts $0 # 8 - could be very wrong - check maybe habe to use quine 

@students = []

def saved_students
    puts "Please input file name"
    filename = $stdin.gets.chomp    # 5
    #filename = ARGV.first 
    return if filename.nil? 
    if File.exists?(filename)
        load_students(filename)
        puts "Loaded #{@students.count} from #{filename}"
    else 
        puts "Sorry, #{filename} doesn't exists"
        exit
    end 
end 
=begin 
def load_students(filename = "student.csv")
    file = File.open(filename, "r")
    file.readlines.each {|line| name, cohort = line.chomp.split(","); @students << {name: name, cohort: cohort.to_sym}} #6 
    puts "Students loaded"
end 
=end 
def save_students
    # open the file for writing 
    file = File.open("student.csv", 'w')
    # iterate over the array of students 
    @students.each {|student| student_data = [student[:name], student[:cohort]]; csv_line = student_data.join(","); file.puts csv_line} # 6
    puts "Students saved"                                                           # 4. 
end 

def interactive_menu
    
    loop do 
       print_menu
       process($stdin.gets.chomp)
    end 
end 

def print_menu
     # 1. print the menu and ask the user what to do
        puts "1. Input the student"
        puts "2. Show the students"
        puts "3. Save list to students.csv"
        puts "4. Load the list from students.csv"
        puts "9. Exit" #9 because you will be adding mor items
end

def process(selection)
    case selection
        when "1"
            input_students
        when "2"
            show_students
        when "3"
            save_students
        when "4"
            saved_students
        when "9"
            exit
        else 
            puts "I don't know what you mean, try again"
    end 
end 
        
def show_students
        print_header
        print_student_list
        print_footer
        puts "Diplaying students"
end 

def input_students 
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # get the first name 
    name = $stdin.gets.chomp
   
    # while the name is not empty, repeat this code 
    while !name.empty? do 
        # add student hash to the array
        @students << {name: name, cohort: :november,}
        puts "Now we have #{@students.count} students"
        # get another name from the user 
        name =  $stdin.gets.chomp
      
    end 
    puts "Students have been added"
    file = File.open(filename, "r")
    file.readlines.each {|line| name, cohort = line.chomp.split(","); @students << {name: name, cohort: cohort.to_sym}} #6 
    puts "Students loaded"

end 

def print_header 
    puts "The students of Villians Academy"
    puts "-------------"
end 

def print_student_list
    @students.each do |student|
        puts "#{student[:name]}, (#{student[:cohort]} cohort)"
    end 
end 

def print_footer
    puts "Overall, we have #{@students.count} great students" 
end 

saved_students
interactive_menu