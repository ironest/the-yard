class Ingredient < ApplicationRecord
    has_many :ingredients_milkshakes
    has_many :milkshakes, through: :ingredients_milkshakes
    has_one :images, as: :imageable
    enum type: { base: 0, flavour: 1, topping: 2 }
end
