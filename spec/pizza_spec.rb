require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../pizza'

describe Pizza::Pie do
  describe '.initialize' do
    it 'records all of the toppings' do
      toppings = [
        Pizza::Topping.new('mushrooms', vegetarian: true),
        Pizza::Topping.new('pepperoni')
      ]
      pizza = Pizza::Pie.new(toppings)

      expect(pizza.toppings).to eq(toppings)
    end

    it 'defaults the toppings to cheese only, if the pizza has no toppings' do
      pizza = Pizza::Pie.new

      expect(pizza.toppings.size).to eq(1)
      expect(pizza.toppings.first.name).to eq('cheese')
    end
  end

  describe "#vegetarian?" do
    it 'returns true if the pizza contains only vegetarian ingredients' do
      pizza = Pizza::Pie.new

      expect(pizza.vegetarian?).to eq(true)

      toppings2 = [
        Pizza::Topping.new('pepperoni')
      ]

      pepperoni = Pizza::Pie.new(toppings2)

      expect(pepperoni.vegetarian?).to eq(false)

      toppings3 = [
        Pizza::Topping.new('mushrooms', vegetarian: true),
        Pizza::Topping.new('feta', vegetarian: true)
      ]

      vegpizza = Pizza::Pie.new(toppings3)

      expect(vegpizza.vegetarian?).to eq(true)
    end
  end

  describe "#add_topping" do 
    it 'adds topping to toppings array' do
      pizza = Pizza::Pie.new

      onion = Pizza::Topping.new('onion', vegetarian:false)

      pizza.add_topping(onion)

      expect(pizza.toppings.include?(onion)).to eq(true)
    end
  end
end

describe Pizza::Topping do
  describe '.initialize' do
    it "sets the name of the topping" do
      topping = Pizza::Topping.new('olives')

      expect(topping.name).to eq('olives')
    end

    it 'sets whether or not the topping is vegetarian' do
      topping = Pizza::Topping.new 'bell peppers', vegetarian: true

      expect(topping.vegetarian).to eq(true)
    end
  end
end