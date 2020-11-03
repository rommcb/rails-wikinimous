class ArticlesController < ApplicationController

    before_action :find_article, only: [:show, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end

    def show
    end

    def new
        @article = Article.new # needed to instantiate the form_for
    end

    def create
        @article = Article.new(article_params)
        @article.save
        # Will raise ActiveModel::ForbiddenAttributesError
        # no need for app/views/restaurants/create.html.erb
        redirect_to articles_path
    end

    def edit
    end

    def update
        @article.update(article_params)
        # Will raise ActiveModel::ForbiddenAttributesError
 
        redirect_to article_path
    end

    def destroy
        @article.destroy
    # no need for app/views/restaurants/destroy.html.erb
        redirect_to articles_path
    end

    private

    def article_params
        params.require(:article).permit(:title, :content)
    end

    def find_article
        @article = Article.find(params[:id])
    end
end
