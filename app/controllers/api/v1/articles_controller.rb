module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        articles = Article.all
        render json: ArticlesRepresenter.new(articles).as_json
        # render json: Article.all.order('created_at desc')
      end

      def create
        article = Article.new(article_params)
        if article.save
          render json: article, status: :created
        else
          render json: article.errors, status: :unprocessable_entity
        end
      end

      def destroy
        article = Article.find(params[:id])
        article.destroy!
        head :no_content
      end

      private

      def article_params
        params.require(:article).permit(:title, :body, :author_id, :channel_id)
      end
    end
  end
end
