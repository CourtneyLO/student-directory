@students = []

def load_students
    filename = ARGV.first
    return if filename.nil? 
    if File.exists?(filename)
        load_students(filename); puts "Loaded #{@students.count} from #{filename}"
    else 
        puts "Sorry, #{filename} doesn't exists"; exit
    end 
end 

def load_input_students(filename = "student.csv")
   
    file = File.open(filename, "r")
    file.readlines.each{|line| name, cohort = line.chomp.split(","); @students << {name: name, cohort: cohort.to_sym}}
    
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = $stdin.gets.chomp
   
    while !name.empty? do 
        @students << {name: name, cohort: :november,}
        puts "Now we have #{@students.count} students"
        name =  $stdin.gets.chomp
    end 
    
end     
  

def save_students
    
    file = File.open("student.csv", 'w')
    @students.each {|student| student_data = [student[:name], student[:cohort]]; csv_line = student_data.join(","); file.puts csv_line} # 6
    puts "Students saved" 
end 

def interactive_menu
    
    loop do 
       print_menu
       menu_selection($stdin.gets.chomp)
    end 
end 

def print_menu
     # 1. print the menu and ask the user what to do
        puts "1. load_input_students"
        puts "2. Show the students"
        puts "3. Save list to students.csv"
        puts "4. Load the list from students.csv"
        puts "9. Exit" #9 because you will be adding mor items
end

def menu_selection(selection)
    case selection
        when "1"
            load_input_students
        when "2"
            show_students
        when "3"
            save_students
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

load_students
interactive_menu
