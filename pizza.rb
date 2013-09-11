module Pizza

  class Pie
    attr_accessor :toppings

    def initialize(toppings=[Topping.new('cheese', vegetarian: true)])
      @toppings = toppings
    end

    def vegetarian?
      ans = true
      @toppings.each do |x|
        if !x.vegetarian
          ans = false
        end
      end
      ans
    end

  end

  class Topping
    attr_accessor :name, :vegetarian

    def initialize(name, vegetarian: false)
      @name = name
      @vegetarian = vegetarian
    end
  end
end