def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]})"
  end
end

def print_with_index(students)
  students.each_with_index do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]})"
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

  # while name is not empty, repeat this block
  while !name.empty? do
    # add student hash to array using the shovel operator
    students << { name: name, cohort: :november }
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
print_with_index(students)
print_footer(students)
