  def custom_puts(str)
    puts str.center(80)
  end

def print_header
  custom_puts "The students of Villains Academy"
  custom_puts "-------------"
end

def print(students)
  students.each do |student|
    custom_puts "#{student[:name]} (#{student[:cohort]})"
  end
end

def print_footer(names)
  custom_puts "Overall, we have #{names.count} great students"
end

def input_students
  custom_puts "Please enter the names of the students"
  custom_puts "To finish, just hit return twice"

  # empty array to hold students
  students = []
  # get first name
  name = gets.chomp

  # while name is not empty, repeat this block
  while !name.empty? do
    # add student hash to array using the shovel operator
    students << { name: name, cohort: :november }
    custom_puts "Now we have #{students.count} students"

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
