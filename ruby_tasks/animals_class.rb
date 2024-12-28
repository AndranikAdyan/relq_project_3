class Animal
	def initialize(name, year)
		@name = name
		@year = year
	end

	def speak()
		puts "Grr..."
	end

	def year
		@year
	end

	def name
		@name
	end
end

class Dog < Animal
	def initialize(name, year)
		super(name, year)
	end

	def speak()
		puts "Woof!"
	end
end

class Cat < Animal
	def initialize(name, year, hungry)
		super(name, year)
		@hungry = hungry
	end

	def speak()
		puts "Meow!"
	end

	def cat_is_hungry()
		if @hungry == 1
			puts "I am hungry!"
		else
			puts "I am not hungry!"
		end
	end
end

animal = Animal.new("Dino", 65432343)
puts "Animal says:"
animal.speak
puts "It is #{animal.year} years old and its name is #{animal.name}"
puts ""
dog = Dog.new("Rex", 3)
puts "Dog says:"
dog.speak
puts "It is #{dog.year} years old and its name is #{dog.name}"
puts ""
cat = Cat.new("Rex", 3, 0)
puts "Cat says:"
cat.speak
puts "It is #{cat.year} years old and its name is #{cat.name}"
cat.cat_is_hungry()