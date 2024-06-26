class Api::TrailsController < ApplicationController
    before_action :require_logged_in, only: [:show]
    
    def index 
        @trails = Trail.all 
        render :index
    end
    
    def show 
        @trail = Trail.find_by(id: params[:id])
        render :show
    end
    
    def create 
        @trail = Trail.new(trail_params)
        if @trail.save 
            render :show 
        else
            render json: {errors: @trail.errors.full_messages}, status: :unprocessable_entity
        end
    end

    # def search
    #     # @trails = Trail.search_difficulty(params[:query]) 
    #     @trails = Trail.search_names(params[:query])
    #     render :search
    # end

    def search
        @trails = Trail.search_difficulty(params[:query]) 
        @trails = Trail.search_names(params[:query]) if @trails.empty?
        render :search
    end

    private

    def trail_params
        params.require(:trail).permit(:name,:description,:location,:difficulty,:length)
    end

end
