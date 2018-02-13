def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]})"
    puts "Hobbies: #{student[:hobbies]}"
    puts "Country of birth: #{student[:country_of_birth]}"
    puts "Height: #{student[:height]}"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  # empty array to hold students
  students = []
  # get first name
  name = gets.chomp

  puts "Please enter the students hobbies"
  hobbies = []
  hobby = gets.chomp
  hobbies << hobby

  puts "Please enter the students country of birth"
  birth_country = gets.chomp

  puts "Please enter the students height"
  height = gets.chomp

  # while name is not empty, repeat this block
  while !name.empty? do
    # add student hash to array using the shovel operator
    students << { name: name, cohort: :november, hobbies: hobbies, country_of_birth: birth_country, height: height}
    puts "Now we have #{students.count} students"

    # ask for next student
    name = gets.chomp
  end

  # return students array
  students
end

# call methods
students = input_students
print_header
print(students)
print_footer(students)
