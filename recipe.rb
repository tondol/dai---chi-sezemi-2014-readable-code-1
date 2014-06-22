#! /usr/bin/ruby

def print_title(title)
  puts title
end

def open_file(file_name)
  File.open(file_name, 'r')
end

recipe_data = open_file(ARGV[0])

print_title recipe_data.read

recipe_data.close
