require './store_data'
class List
  attr_accessor :list

  def initialize(list, type)
    @list = list
    @type = type
    @data = StoreData.new
  end

  def list_items(kind)
    @data.fetch_data
    if kind == 'people'
      @list = JSON.parse(@data.people)
      @list.each_with_index do |item, i|
        puts "#{i + 1}: Name: #{item['name']}, Age: #{item['age']}, ID: #{item['id']}"
      end
    else
      @list = JSON.parse(@data.books)
      @list.each_with_index { |item, i| puts "#{i + 1}: Title: #{item['title']}, Author: #{item['author']}" }
    end
    puts
  end
end
