def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]})"
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

def interactive_menu
  students = []

  loop do
    # print the menu and ask the user what to do
    puts "1. Input a student"
    puts "2. Show the students"
    puts "9. Exit"

    selection = gets.chomp

    case selection
      when "1" # input a student
        students = input_students
      when "2" # show the input_students
        print_header
        print(students)
        print_footer(students)
      when "9" # exit program
        exit
      else
        puts "I don't know what you meant, please try again"
    end
  end
end

interactive_menu
