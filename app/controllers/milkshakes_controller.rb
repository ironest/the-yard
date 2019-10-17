class MilkshakesController < ApplicationController

    def Index
        @milkshakes = Milkshake.all
    end

end