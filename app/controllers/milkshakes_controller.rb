class MilkshakesController < ApplicationController

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
    end

    def create
        # byebug
    end

end