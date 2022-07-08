class BlogsController < ApplicationController
    protect_from_forgery with: :null_session
    
    def blog_list
        blog = Blog.all 
        render json:blog

    end
    def create_blog
        insert_blog = Blog.new({
            "title" => params[:title],
            "author_name"=> params[:author_name],
            "content"=> params[:content],
            "blog_id" => params[:blog_id]
        })
        
        insert_blog.save

        render json: insert_blog
    end
    def delete_blog 
        blog = Blog.find_by(params[:id])
        blog.destroy
        render json: {"deleted ":"successfully"}
    end

    def update_blog
        data = Blog.find_by(id:params[:id])
        # data.update(
        #     "title" => params[:title],
        #     "author_name"=> params[:author_name],
        #     "content"=> params[:content],
        #     "blog_id" => params[:blog_id]
        # )
        data.title = params[:title]
        data.author_name = params[:author_name]
        data.content = params[:content]
        data.blog_id = params[:blog_id]
        data.save
    render json:data 
    end
    def search_blog
        data= Blog.find_by(id:params[:id])
        render json: data
    end

end  