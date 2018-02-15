@students = [] # empty array that is accessible to all methods

def print_menu
  puts '1. Input a student'
  puts '2. Show the students'
  puts '3. Save the list to students.csv'
  puts '4. Load the list from students.csv'
  puts '9. Exit'
end

def interactive_menu
  loop do # print the menu and ask the user what to do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when '1' # input a student
    input_students
  when '2' # show the input_students
    show_students
  when '3'
    save_students
  when '4'
    load_students
  when '9' # exit program
    exit
  else
    puts "I don't know what you meant, please try again"
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

# simple select file method.
def select_file(default_filename, loading_saving_boolean = true)
  puts "Please enter name of the file you want to #{loading_saving_boolean ? 'load' : 'save to'}."
  puts "or else press return to #{loading_saving_boolean ? 'load' : 'save too'} the default file (#{default_filename})"
  filename_input = gets.chomp

  if filename_input.empty?
    puts "#{loading_saving_boolean ? 'Loading' : 'Saving to'} default file #{default_filename}"
    default_filename
  else
    filename_input
  end
end

def save_students(default_filename = 'students.csv')
  filename = select_file(default_filename, false)
  file = File.open(filename, 'w') # open the file for writing
  @students.each do |student| # iterate over the array of students
    student_data = [student[:name], student[:cohort]]
    file.puts student_data.join(',')
  end
  file.close
end

def load_students(default_filename = 'students.csv')
  filename = select_file(default_filename)
  file = File.open(filename, 'r') # open the file for reading
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << { name: name, cohort: cohort.to_sym }
  end
  file.close
  puts "Loaded #{@students.count} from #{filename}"
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of this method if filename isn't given
  if File.exist?(filename) # true or false if file exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
