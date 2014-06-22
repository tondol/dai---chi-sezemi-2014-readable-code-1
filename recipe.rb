#! /usr/bin/ruby

def print_title(title)
  puts title
end

def open_file(file_name)
  File.open(file_name, 'r')
end

recipe_data = open_file(ARGV[0])

recipe_data.each do |line|
  puts line
end

recipe_data.close
