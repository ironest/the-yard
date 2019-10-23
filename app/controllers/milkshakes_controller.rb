class MilkshakesController < ApplicationController
    before_action :authenticate_user!

    def index
        if params[:search] && !params[:search].empty?
            @milkshakes = Milkshake.where("upper(name) LIKE ?", "%#{params[:search].upcase}%")
        else
            @milkshakes = Milkshake.all
        end
    end

    def show
        @milkshake = Milkshake.find(params[:id])
    end

    def new
        @milkshake = Milkshake.new
        @ingredients = Ingredient.all
    end

    def edit
        @milkshake = Milkshake.find(params[:id])
    end
    
    def create

        whitelisted_params = params.require(:milkshake).permit(:name, :description, :price, :pic, ingredient_ids: [])
        # Rails magic understands that ingredient_ids refers to the ingredients table
        # Optionally, it's possible to do it manually

        @milkshake = current_user.milkshakes.create(whitelisted_params)

        # @milkshake = Milkshake.new
        # @milkshake.name = params[:milkshake][:name]
        # @milkshake.description = params[:milkshake][:description]
        # @milkshake.price = params[:milkshake][:price]
        # @milkshake.save

        if @milkshake.errors.any?
            @ingredients = Ingredient.all
            render "new"
        else
            redirect_to milkshake_path(@milkshake)
        end
    end

end