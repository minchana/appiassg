class Api::V1::MoviesController < ApplicationController
	def create
		@movie=Movie.new(movie_params)
		if@movie.save
		render json: {message:"sucessfully created", data:@movie,status_code: 201}
	else
		render json: {message:"failuer", data:@movie.errors,status_code: 422}
		end
	end
	def update
		@movie=Movie.find_by_id(params[:id])
		@movie.update_attributes(movie_params)
		render json:{message: "sucessfully", data:@movie,status_code: 201}
	end
	def destroy
		@movie=Movie.find_by_id(params[:id])
		@movie.destroy
		render json:{message: "sucessfully", data:@movie,status_code: 201}
	end
	def show
		@movie=Movie.find_by_id(params[:id])
		render json:{message: "sucessfully", data:@movie,status_code: 201}
	end



	private
	def movie_params
		params.require(:movie).permit(:title,:year,:rating,:language,:actors,:director,:producer)
	end
end