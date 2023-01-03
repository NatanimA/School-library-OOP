require 'json'
require_relative './rental'

class RentalsHandler
  attr_accessor :rentals, :people, :books

  def initialize(books, person)
    @file = unless File.exists?("./jsonfiles/rentals.json")
              File.new("./jsonfiles/rentals.json", "w+")
            else
              "./jsonfiles/rentals.json"
            end

    file_parsed = JSON.parse(File.read(@file))
    @rentals = file_parsed.empty? ? [] : file_parsed
    @books = books
    @people = person
  end

  def create_rental
    if @books.empty? && @people.empty?
      puts 'There are no books and people in the system'
    else
      puts 'Please press the number corresponding to the book that you want: '
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Book Title: \"#{book['title']}\" | Author: #{book['author']}"
      end
      number = gets.chomp.to_i
      index = number - 1

      puts 'PLease type your ID (See from the list of people below): '
      @people.each do |person|
        puts "[#{person['json_class']}] Name: #{person['name']} | Age: #{person['age']} | ID: #{person['id']}"
      end
      identity = gets.chomp.to_i
      individual = if identity <= 10
                     @people[identity - 1]
                   else
                     @people.select { |person| person['id'] == identity }.first
                   end

      print 'Enter the date[yyyy-mm-dd]: '
      date = gets.chomp.to_s

      rent = Rental.new(date, @books[index], individual)
      rent = rent.to_json
      @rentals << rent
      File.write(@file, JSON[@rentals])

      puts 'The book has been rented successfully'
    end
  end

  def list_all_rentals
    puts 'No rentals has been made at the moment' if @rentals.empty?
    print 'To view your rental records, type your ID: '
    id = gets.chomp.to_i
    rental = @rentals.select { |rend| rend['person']['id'] == id }
    if rental.empty?
      puts 'No records for that particular ID'
    else
      puts 'Your rental records are the following: '
      puts ''
      rental.each_with_index do |record, index|
        puts "#{index + 1}| Date: #{record['date']} | Borrower: #{record['person']['name']}
         | Status: #{record['person']['class']} | Borrowed book: \"#{record['book']['title']}\" by #{record['book']['author']}"
      end
    end
  end
end
