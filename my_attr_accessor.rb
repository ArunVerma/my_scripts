module MyAttrAccessor
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def my_attr_accessor(attr, &validation)
      # setter method
      define_method "#{attr}=" do |value|
        raise "Invalid Attribute" unless validation.call(value) # this is optional- if you want to add validation on age limit
        instance_variable_set("@#{attr}", value)
      end

      # getter method
      define_method attr do
        instance_variable_get("@#{attr}")
      end
    end
  end
end

class Person
  include MyAttrAccessor
  my_attr_accessor :age do |v|
    v >= 18  # setting age limit to be validated
  end
end

p = Person.new
p.age=19
puts p.age   ## === 19

p.age = 17 ## == Invalid Attribute error


############ Another way of doing the same  thing ###################
######### this is basicaally shorter than the above, but here we are overriding the inbuilt class
##### "Class" provided by ruby. So this would be available throughout the all classes in application ###
######### Event though it is shorter I would perfer the above one. We should always ###
## avoid overrirding inbuilt classes and methods unless we have option 

class Class
  #firstly, the * decoration on the parameter variable
  #indicates that the parameters should come in as an array
  #of whatever was sent
  def mikeys_attr_accessor(*args)

    #We simply iterate through each passed in argument...
    args.each do |arg|
      
      #Here's the getter
      self.class_eval("def #{arg};@#{arg};end")
      
      #Here's the setter
      self.class_eval("def #{arg}=(val);@#{arg}=val;end")                      
                      
    end
  end
end

class Person
  mikeys_attr_accessor :name, :age  
end

person = Person.new
person.name = "Mikey"
person.age = 30
puts person.name
puts person.age