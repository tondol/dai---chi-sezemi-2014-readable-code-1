#! /usr/bin/ruby

def main
  if ARGV[0].nil?
    puts 'usage: ruby recipe.rb fine_name'
  else
    recipe_data = open_file(ARGV[0])
    if ARGV[1].nil?
      recipe_data.each_with_index do |line, i|
        print_title_with_id(i+1, line)
      end
    else
      recipe_id = ARGV[1].to_i
      print_title_with_id(recipe_id, recipe_data.to_a[recipe_id-1])
    end
    recipe_data.close
  end
end

def print_title(title)
  puts title
end

def open_file(file_name)
  File.open(file_name, 'r')
end

def print_title_with_id(id, title)
  puts "#{id}: #{title}"
end

main
