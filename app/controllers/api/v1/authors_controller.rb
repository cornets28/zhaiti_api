module Api
  module V1
    class AuthorsController < ApplicationController
      def index
         render json: Author.all
      end

      def create
        author = Author.new(author_params)
        if author.save
          render json: author, status: :created
        else
          render json: author.errors, status: :unprocessable_entity
        end
      end

      def destroy
        author = Author.find(params[:id])
        author.destroy!
        head :no_content
      end

      private

      def author_params
        params.require(:author).permit(:first_name, :last_name, :age, :language)
      end
    end
  end
end
