def more_infomation(students)
    
    index = 0 
    while index < students.size 
    
    students.each do |student|
    puts "#{student[:name]}, (#{student[:cohort]} cohort)"  if !students.empty?
    puts "How old are you?"
    age = gets.chomp
    puts "What are your hobbies?"
    hobbies = gets.chomp 
    puts "What country are you from?"
    country = gets.chomp
    puts "What is you height?"
    height = gets.chomp 
    
    add_information = {age: age, hobbies: hobbies, country: country, height: height}
    
    student1 = student.merge(add_information) 
    
    students << student1 
    
    end
    index += 1   
    
    
    end 
    
    


   puts "#{students}"
    
  
  
end