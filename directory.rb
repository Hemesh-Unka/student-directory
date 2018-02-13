@students = [] #empty array that is accessible to all methods

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]})"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  # get first name
  name = gets.chomp

  # while name is not empty, repeat this block
  while !name.empty? do
    # add student hash to array using the shovel operator
    @students << { name: name, cohort: :november }
    puts "Now we have #{@students.count} students"

    # ask for next student
    name = gets.chomp
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    file.puts student_data.join(",")
  end
  file.close
end

def load_students
  # open the file for reading
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << { name: name, cohort: cohort.to_sym }
  end
  file.close
end

def print_menu
  puts "1. Input a student"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1" # input a student
      input_students
    when "2" # show the input_students
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9" # exit program
      exit
    else
      puts "I don't know what you meant, please try again"
  end
end

def interactive_menu
  loop do
    # print the menu and ask the user what to do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu
