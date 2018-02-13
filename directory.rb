@students = [] # empty array that is accessible to all methods

@options = {
  '1' =>  -> { input_students },
  '2' => -> { show_students },
  '3' =>  -> { save_students },
  '4' =>  -> { load_students },
  '9' => -> { exit }
}

def print_menu
  [
    '1. Input a student',
    '2. Show the students',
    '3. Save the list to students.csv',
    '4. Load the list from students.csv',
    '9. Exit'
  ].each { |menu_item| puts menu_item }
end

def interactive_menu
  loop do # print the menu and ask the user what to do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  if @options[selection].nil?
    puts "I don't know what you meant, try again"
  else
    @options[selection].call
  end
end

def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'

  # get first name
  name = STDIN.gets.chomp

  # while name is not empty, repeat this block
  until name.empty?
    # add student hash to array using the shovel operator
    @students << { name: name, cohort: :november }
    puts "Now we have #{@students.count} students"

    # ask for next student
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]})"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  file = File.open('students.csv', 'w') # open the file for writing
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    file.puts student_data.join(',')
  end
  file.close
end

def load_students(filename = 'students.csv')
  file = File.open(filename, 'r') # open the file for reading
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << { name: name, cohort: cohort.to_sym }
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of this method if filename isn't given
  if File.exist?(filename) # true or false wether file exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
