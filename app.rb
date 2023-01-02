require_relative './books_handler'
require_relative './persons_handler'

class App
  def initialize
    @books = BooksHandler.new
    @people = PersonsHandler.new
    @rentals = RentalsHandler.new(@books,@people)
  end

  def interface_options
    puts ''
    puts " Please choose among the options below by pressing its corresponding number:
            1. List all books
            2. List all people
            3. Create person account
            4. Create a book
            5. Create a rental
            6. List all rentals for particular person
            7. Exit"
    gets.chomp
  end

  def option
    case interface_options
    when '1'
      @books.list_all_books
    when '2'
      @people.list_all_people
    when '3'
      @people.create_person
    when
      '4'
      @books.create_book
    when '5'
      @rentals.create_rental
    when '6'
      @rentals.list_all_rentals
    when '7'
      puts 'Thank you for using the app!'
      return
    else
      puts 'Invalid input. Please try again'
    end
    option
  end

  def start_console
    option
  end

end
