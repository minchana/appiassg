class Api::V1::UsersController < ApplicationController
	def create
		@user=User.new(user_param)
		if@user.save
		render json: {message:"sucessfully created", data:@user,status_code: 201}
	else
		render json: {message:"failuer", data:@user.errors,status_code: 422}
		end
	end
	def update
		@user=User.find_by_id(params[:id])
		@user.update_attributes(user_params)
		render json:{message: "sucessfully", data:@user,status_code: 201}
	end
	def destroy
		@user=User.find_by_id(params[:id])
		@user.destroy
		render json:{message: "sucessfully", data:@user,status_code: 201}
	end
	def show
		@user=User.find_by_id(params[:id])
		render json:{message: "sucessfully", data:@user,status_code: 201}
	end

	private
	def user_params
		params.require(:user).permit(:name,:age,:role,:gender)
	end
end