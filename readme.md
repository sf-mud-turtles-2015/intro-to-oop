# Introduction to Object Oriented Programming

### What is OOP?
- A style of programming (some others are functional programming and procedural programming)
- A way of creating code that models the complex of the real world, as objects
- In OOP, we create objects that hold data and pass messages to each other by calling methods
- ruby is an object oriented language and has built in tools to help you create object oriented code

### Defining and insantiating objects in ruby
- A class is ruby's OO fundamental building block.  It is a template for an object.  
- `class` keyword
```ruby
class Teapot
end
```
- Once we define a class, we can create many objects with this template.  These objects are created at runtime and called instances.
- `new` keyword
```ruby
class Teapot
end

an_instance_of_a_teapot = Teapot.new
```
- A constructor is a special method that ruby calls under the hood when the `new` keyword is used, and in the constructor we set up the state for an instance of the class.
- `initialize` keyword
```ruby 
class Teapot

    def initialize
        puts "Setting up the state for this teapot"
    end

end

Teapot.new
```

### State and behavior
- State, data, attributes, or properties of objects are represented as instance variables.  Instance variables of a class are only accessible indirectly, through methods
- Behavior, or stuff and object can do, are represented as methods
- State as nouns, behavior as verbs
- We can think of calling a method on an object can be thought of as sending a message to an object
```ruby
class Teapot
    def initialize capacity_in_cups
        @capacity_in_cups = capacity_in_cups
    end

    def get_capacity_in_cups
        @capacity_in_cups
    end
end

big_teapot = Teapot.new 10
p big_teapot.get_capacity_in_cups

small_teapot = Teapot.new 4
p small_teapot.get_capacity_in_cups
```

### Abstraction and encapsulation
- Abstraction means that we are modeling relevant aspects of a real world system that make sense
- Encapsulation means that we are hiding information like implementation details and private state from the external clients of our code
- These concepts are fundamental!  They allow us to: 
    - reason about a problem domain without needing to think about about concerns outside the domain
    - divide up responsibilities between different pieces of code in a system
    - build reusable components that other people can understand
    - separate what an object does from how it does it, which makes it easier to maintain over time
- Example, layers of abstraction in a computer
- Example, a radio

### Tools of encapsulation: Public vs private methods
- Public methods are for use by the clients of the code.  Methods defined in a class are public by default.  The public methods of a class comprise that class's interface, or API.
- Public methods are the only methods that can be called outside of a class's definition
- Private methods are for use only within the object
- If you define methods in the `private` zone of a class, the ruby interpreter will enforce this restriction and throw an error if there is an attempt to call a private method outside the class, an error like `NoMethodError: private method 'some_method' called for #<SomeObject:0x007ff964464c80>`
```ruby
class ElectricWaterBoiler
    BOILING_POINT_OF_WATER_F = 212

    def initialize
        @water_level = 0
        @current_temperature = 0
    end
    
    def boil
        fill
        turn_on_heating_coil
        while current_temperature < BOILING_POINT_OF_WATER_F
            heat_water_by_1_degree
        end
        turn_off_heating_coil
    end
    
    private
    
        def fill            
            # Code that fills the water boiler with water
            @water_level = 10
            puts "Filling the water boiler ..."
        end
        
        def current_temperature
            # Code that measures the current water temperature would go here
            @current_temperature
        end
        
        def heat_water_by_1_degree
            # Increase the heat of the water by 1 degree F
            @current_temperature += 1
        end
        
        def turn_on_heating_coil
            # Code that turns on the heating coil
            puts "Turning on the heating coil ..."
        end
        
        def turn_off_heating_coil
            # Code that turns off the heating coil
            puts "Turning off the heating coil ..."
        end
end

zojirushi = ElectricWaterBoiler.new
zojirushi.boil

# The lines below will throw errors
zojirushi.turn_on_heating_coil
zojirushi.fill
zojirushi.heat_water_by_1_degree
zojirushi.current_temperature
```
- What public interface does this water boiler expose?
- What implementation details does it hide under the hood?
- What assumptions are encoded in this water boiler?
