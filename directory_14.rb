@students = []

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save students"
    puts "4. Load students"
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
       process(STDIN.gets.chomp)
    end 
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
            load_students
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
    name = STDIN.gets.chomp.capitalize
    # while name is not empty, repeat this code
    while !name.empty? do
    # add the students has to the array
    @students << {name: name, cohort: :november}
    puts @students.index({name: name, cohort: :november}) > 0 ? "Now we have #{@students.count} students" : "Now we have #{@students.count} student"
    # get another name from the user 
    name = STDIN.gets.chomp.capitalize 
    end
    
    # return array of students 
    # 4. Can you fix this and implement feedback messages for the user?
    puts @students.count > 1 ? "#{@students.count} students have been added to the student list" : "#{@students.count} student has been added to the student list"
    @students
    
end 

def print_header 
    puts "The students of the Villians Academy"
    puts "-------------"
end 

def print_students_list(students)
    puts @students.count > 1 ? "Students:" : "Student:"
    @students.each do |student|
        puts "#{student[:name]}, (#{student[:cohort]} cohort)"
    end 
end 

def print_footer(students)
    puts @students.count > 1 ? "Overall, we have #{@students.count} great students" : "Overall, we have #{@students.count} great student" 
end 


def save_students
    # open the file for writing 
    puts "In which file do you wish to save the student list?"                  # 5. Make the script more flexible by asking for the filename if the user chooses these menu items.
    filename = STDIN.gets.chomp
    file = File.open(filename, 'w')
    # iterate over the array of students
    # 6. Read the documentation of the File class to find out how to use a code block (do...end) to access a file, so that we don't have to close it explicitly.
    @students.each {|student| student_data = [student[:name], student[:cohort]]; csv_line = student_data.join(","); file.puts csv_line}
    # 4. Can you fix this and implement feedback messages for the user?
    puts @students.count > 1 ? "#{@students.count} students have been saved to #{filename}" : "#{@students.count} student has been saved to #{filename}" 
end 

def load_students(filename = "students.csv")
    puts "Which file do you wish to load?"                                      # 5. Make the script more flexible by asking for the filename if the user chooses these menu items.
    filename = STDIN.gets.chomp
    file = File.open(filename, 'r')
    # 6. Read the documentation of the File class to find out how to use a code block (do...end) to access a file, so that we don't have to close it explicitly.
    file.readlines.each {|line| name, cohort = line.chomp.split(","); @students << {name: name, cohort: cohort.to_sym}}
    # 4. Can you fix this and implement feedback messages for the user?
    puts @students.count > 1 ? "#{@students.count} students have been loaded" : "#{@students.count} student has been loaded" 
end 

def try_load_students
    filename = ARGV.first # first argument from the command line 
    return if filename.nil? # get out of the method if it isn't given 
    if File.exist?(filename)
        load_students(filename)
        puts "Loaded #{@students.count} from #{filename}"
    else 
        puts "Sorry, #{filename} doesn't exist."
        exit # quit the program 
    end 
end 

try_load_students
interactive_menu
        
        