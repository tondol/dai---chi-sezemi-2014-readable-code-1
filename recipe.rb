#! /usr/bin/ruby

def print_title(title)
  puts title
end

def open_file(file_name)
  File.open(file_name, 'r')
end

if ARGV[0] == nil
  puts 'usage: ruby recipe.rb fine_name'
else
  recipe_data = open_file(ARGV[0])

  recipe_data.each_with_index do |line, i|
    puts "#{i+1}: #{line}"
  end

  recipe_data.close
end