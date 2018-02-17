@months = %i[
  january february march may june
  july august september october november december
]

@students = [] # an empty array accessible to all methods

def input_name
  puts 'Please enter the name of the student'
  gets.chomp
end

def input_month
  puts 'Please enter a cohort month (default: november)'
  cohort_month = gets.chomp.downcase.to_sym
  cohort_month = :november if cohort_month.empty?

  until @months.include?(cohort_month)
    puts 'Please enter a valid month'
    cohort_month = gets.chomp.downcase.to_sym
    return cohort_month = :november if cohort_month.empty?
  end
  cohort_month
end

def input_students
  student = {}
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  student[:name], student[:cohort] = input_name, input_month

  until student[:name].empty? # while name is not empty, repeat this block
    @students << student # add student hash to array using the shovel operator
    puts "Now we have #{@students.count} #{@students.count <= 1 ? 'student' : 'students'}"

    student = {}
    student[:name], student[:cohort] = input_name, input_month
  end
end

def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

def print
  @students.each do |student|
    puts "Name & Cohort: #{student[:name]} (#{student[:cohort]})"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great #{@students.count <= 1 ? 'student' : 'students'}"
end

# call methods
input_students
print_header
print
print_footer
