#! /usr/bin/ruby

class Recipe
  def initialize(id, title, uri)
    @id = id
    @title = title
    @uri = uri
  end

  def print
    puts "#{@title} #{@uri}"
  end
  def print_with_id
    puts "#{@id}: #{@title} #{@uri}"
  end

  def self.load(id, line)
    title, uri = line.split
    self.new(id, title, uri)
  end

  attr_reader :id, :title
end

class RecipeData
  def initialize(recipes)
    @recipes = recipes
  end

  # idに対応するrecipeが存在しないときにnilを返却する
  def find_recipe_for_id(id)
    @recipes.find do |recipe|
      recipe.id == id
    end
  end

  # レシピの文字列表現の配列からRecipeDataインスタンスを生成する
  def self.load(lines)
    recipes = lines.map.with_index(1) do |line, id|
      Recipe.load(id, line)
    end
    RecipeData.new(recipes)
  end
  # ファイル名からRecipeDataインスタンスを生成する
  def self.open_file(file_name)
    File.open(file_name, 'r') do |f|
      self.load(f.read.each_line.to_a)
    end
  end

  attr_reader :recipes
end

def main
  if ARGV.size <= 0
    puts 'usage: ruby recipe.rb fine_name'
  else
    recipe_data = RecipeData.open_file(ARGV[0])
    if ARGV.size <= 1
      recipe_data.recipes.each do |recipe|
        recipe.print_with_id
      end
    else
      # Integerメソッドは数値の文字列表現でないものが渡されたときに例外を発生させる
      recipe_id = Integer(ARGV[1])
      recipe = recipe_data.find_recipe_for_id(recipe_id)
      recipe.print_with_id
    end
  end
end

main
