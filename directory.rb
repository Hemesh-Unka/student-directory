@months = %i[
  january february march may june
  july august september october november december
]

@students = [] # an empty array accessible to all methods

def input_helper
  student = {}
  prefix = 'Please enter'
  categories = {
    name: "#{prefix} the name of the student",
    cohort: "#{prefix} a cohort month (Default = :november)",
  }

  categories.each do |category, question|
    puts question
    if category == 'cohort'.to_sym

      loop do
        @input = gets.chomp.downcase.to_sym
        @input = :november if @input.empty?
        break if @months.include?(@input)
        puts 'Please enter a valid month'
      end
    else
      @input = gets.chomp
    end
    student[category] = @input
  end
  student
end

def input_students
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  student = input_helper

  # while name is not empty, repeat this block
  while !student[:name].empty? do
    # add student hash to array using the shovel operator
    @students << student

    puts "Now we have #{@students.count} students"

    student = input_helper
  end

  # return students array
  @students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "Name & Cohort: #{student[:name]} (#{student[:cohort]})"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# call methods
students = input_students
print_header
print(students)
print_footer(students)
