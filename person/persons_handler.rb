require 'json'
require_relative './person'
require_relative './student'
require_relative './teacher'

class PersonsHandler
  attr_accessor :people

  def initialize
    @file = './jsonfiles/persons.json'
    file_parsed = JSON.parse(File.read(@file))
    @people = file_parsed.empty? ? [] : file_parsed
  end

  def list_all_people
    puts 'Sorry, there is no registered users!' if @people.empty?
    puts "There are #{@people.count} people in the system"
    @people.each_with_index do |person, index|
      puts "#{index + 1})[#{person['json_class']}] Name: #{person['name']} | Age: #{person['age']} | ID: #{person['id']}"
    end
  end

  def create_person
    print 'To create teacher account, press 1. To create student account, press 2:  '
    option = gets.chomp
    print 'Enter your name: '
    name = gets.chomp
    print 'Enter your age: '
    age = gets.chomp.to_i

    case option
    when '1'
      print 'Enter your specialization: '
      spec = gets.chomp
      create_teacher(spec, age, name)
    when '2'
      print 'Enter your class: '
      class_grade = gets.chomp
      create_student(class_grade, age, name)
    else
      puts ''
      puts 'Invalid input. Please try again'
      nil
    end
  end

  def create_teacher(specialization, age, name)
    teacher = Teacher.new(specialization, age, name)
    teacher = teacher.to_json
    @people << teacher
    File.write(@file, JSON[@people])
    puts ''
    puts "Teacher is created successfully. Your ID is #{teacher['id']}"
  end

  def create_student(class_grade, age, name)
    print 'Do you have parent permission? [Y/N]'
    choice = gets.chomp.downcase
    case choice
    when 'y'
      student = Student.new(class_grade, age, name, parent_permission: true)
    when 'n'
      student = Student.new(class_grade, age, name, parent_permission: false)
    else
      puts 'invalid selection. Please try again'
      return
    end
    student = student.to_json
    @people << student
    File.write(@file, JSON[@people])
    puts ''
    puts "Student is created successfully. Your ID is #{student['id']}"
  end
end
