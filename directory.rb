# let's put all students into an array
students = [
    {name: "Dr. Hannibal Lecter", cohort: :november},
    {name: "Darth Vader",  cohort: :november},
    {name: "Nurse Ratched", cohort: :november},
    {name: "Micheal Corleone",  cohort: :november},
    {name: "Alex Delarge", cohort: :november},
    {name: "The Wicked Witch of the West",  cohort: :november},
    {name: "Terminator",  cohort: :november},
    {name: "Freddy Krueger", cohort: :november},
    {name: "The Joker",  cohort: :november},
    {name: "Joffrey Baratheon",  cohort: :november},
    {name: "Norman Bates",  cohort: :november}
]


def print_header 
    puts "The students of Villians Academy"
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

print_header
print(students)
print_footer(students)