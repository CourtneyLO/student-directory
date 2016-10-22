# let's put all students into an array
students = [
    "Dr. Hannibal Lecter",
    "Darth Vader",
    "Nurse Ratched",
    "Micheal Corleone",
    "Alex Delarge",
    "The Wicked Witch of the West",
    "Terminator",
    "Freddy Krueger",
    "The Joker",
    "Joffrey Baratheon",
    "Norman Bates" 
]
# abd then print them  
puts "The students of Villians Academy"
puts "-------------"
students.each do |student|
    puts student
end 

# finally, we print the total number of students 
puts "Overall, we have #{students.count} great students "

