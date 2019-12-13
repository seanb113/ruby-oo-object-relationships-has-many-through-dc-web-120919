require 'pry'
class Waiter
    attr_reader :name, :years_experience

    @@all = []

    def initialize(name, years_experience)
        @name, @years_experience = name, years_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end
    
    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end
    
    def best_tipper
        best_tipped_meal = self.meals.max do |meal_a, meal_b|
        meal_a.tip <=> meal_b.tip
        end
        best_tipped_meal.customer
    end

end