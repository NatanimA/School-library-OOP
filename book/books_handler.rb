require 'json'
require_relative './book'
class BooksHandler
  attr_accessor :books, :file

  def initialize
    @file = './jsonfiles/books.json'
    file_parsed = JSON.parse(File.read(@file))
    @books = file_parsed.empty? ? [] : file_parsed
  end

  def list_all_books
    puts 'Sorry, No book(s) found!' if @books.empty?
    puts "There are #{@books.count} book(s) in the system"
    @books.each_with_index do |book, index|
      puts "#{index + 1}) Book Title: \"#{book['title']}\" | Author: #{book['author']}"
    end
  end

  def create_book
    print 'Enter the book title: '
    title = gets.chomp
    print 'Enter the book author: '
    author = gets.chomp

    if title.strip != '' && author.strip != ''
      book = Book.new(title, author)
      book = book.to_json
      @books << book
      File.write(@file, JSON[@books])
      puts ''
      puts 'Book is created successfully'
      puts ''
      puts 'Book is created successfully'
    else
      puts ''
      puts 'Please provide title and author of the book'
    end
  end
end
