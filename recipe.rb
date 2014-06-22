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

class User
  def initialize(id, recipes, name)
    @id = id
    @recipes = recipes
    @name = name
  end

  def print
    puts "#{@name}"
  end
  def print_with_id
    puts "#{@id}: #{@name}"
  end

  def self.load(id, recipes, line)
    self.new(id, recipes, line)
  end

  attr_reader :id, :name, :recipes
end

class RecipeData
  def initialize
    @users = []
    @last_user_id = 0
    @last_recipe_id = 0
  end
  def initialize(users)
    @users = users
  end

  # idに対応するrecipeが存在しないときにnilを返却する
  def find_recipe_for_id(id)
    @recipes.find do |recipe|
      recipe.id == id
    end
  end

  # open_fileから呼ばれるユーティリティ
  # 改行文字で分割した文字列配列からユーザーデータとレシピデータを読み取る
  def load(lines)
    user_line = lines.shift
    # @last_recipe_id+1からIDを割り振る
    recipes = lines.map.with_index(@last_recipe_id + 1) do |line, id|
      Recipe.load(id, line)
    end
    @last_recipe_id = @recipes.last.id
    # @last_user_id+1からIDを割り振る
    @users << User.load(@last_user_id + 1, recipes, user_line)
    @last_user_id = @users.last.id
  end
  # ファイルからデータを入力してRecipeDataに追加する
  # ファイルの先頭行はユーザーデータ，それ以降の行はレシピデータとする
  def open_file(file_name)
    File.open(file_name, 'r') do |f|
      self.load(f.read.each_line.to_a)
    end
  end

  attr_reader :users, :recipes
end

def main
  if ARGV.size <= 0
    puts 'usage: ruby recipe.rb file_name'
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
