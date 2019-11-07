module Api
    module V1
        class BlogsController < ApplicationController
            def index
                blogs = Blog.all
                render json: {status: 'Success', message:'Listing Blogs', data: blogs}, status: :ok
            end

            def create
                blog = Blog.new(blog_params)
                if blog.save
                    render json: {status: 'Success', message:'Blog Created!!', data: blog}, status: :ok
                else
                    render json: {status: 'Failure', message:'Blog Not Created!!', data: blog.errors }, status: :unprocessable_entity
                end
            end

            def show
                blog = Blog.find(params["id"])
                if blog
                    render json: {status: 'Success', message:'Blog Found', data: blog}, status: :ok
                else
                    render json: {status: 'Failure', message:'Blog Not found' }, status: :unprocessable_entity
                end
            end

            def destroy
                blog = Blog.find(params["id"])
                blog.destroy
                render json: {status: 'Success', message:'Blog deleted', data: blog}, status: :ok

            end

            private

            def blog_params
                params.permit(:title, :description, :author)
            end
        end
    end
end