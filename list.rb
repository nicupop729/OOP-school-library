class List
  attr_reader :list

  def initialize(list, type)
    @list = list
    @type = type
  end

  def list_items
    if @type == 'people'
      @list.each_with_index { |item, i| puts "#{i + 1}: Name: #{item.name}, Age: #{item.age} ID: #{item.id}" }
    else
      @list.each_with_index { |item, i| puts "#{i + 1}: Title: #{item.title}, Author: #{item.author}" }
    end
    puts
  end
end
