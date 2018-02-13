def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  if students.count > 0
    students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]})"
    end
  else
    puts "No students found"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def filter_by_letter(students, letter)
  students.select { |student| student[:name].chr.downcase == letter.downcase }
end

def interactive_menu(students)
  # loop through menu & break when valid selection is chosen
  loop do
      puts "Please select and option below"
      puts "1. Select students starting with a specific letter"
      @selection = gets.chomp
      break if @selection == "1"
      puts "Please select a valid option from the menu"
  end

  case @selection
    when "1" # letter selection
      loop do
        puts "Enter starting letter of student do you want to display?"
        @selection = gets.chomp
        break if @selection.length == 1 && @selection =~ /[[:alpha:]]/
        puts "Please try again"
      end

      print(filter_by_letter(students, @selection))
  end
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
print(students)
print_footer(students)
interactive_menu(students)
