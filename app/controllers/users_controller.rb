class UsersController < ApplicationController
    protect_from_forgery with: :null_session

    def user_list
        user=User.all 
        render json:user
    end

    def create_user
        insert_user= User.new({
            "name" => params[:name],
            "user_id"=> params[:user_id],
            "email"=> params[:email],
            "passward" => params[:passward],
            "gender" => params[:gender],
            "age" => params[:age]
        })
        
        insert_user.save

        render json: insert_user
    end

    def delete_user
        user = User.find_by(params[:user_id])
        user.destroy
        render json: {"deleted ":"successfully"}
    end

    def search_user
        data= User.find_by(id:params[:user_id])
        render json: data
    end

    def update_user
        data = User.find_by(id:params[:user_id])
        data.update(
            "name" => params[:name],
            "user_id"=> params[:user_id],
            "email"=> params[:email],
            "passward" => params[:passward],
            "gender" => params[:gender],
            "age" => params[:age]
        )
        render json:data
    end



    def login
        user = User.find_by(email: params['email'])
        if(user)
            if(user.passward == params['passward'])
                render json: user
            else
                message={
                    "text"=>"Password is incorrect.."
                }
                render json: message
            end
        else
            message={
                    "text"=>"You need to create an account first."
                }
                render json: message
        end        
    end


end