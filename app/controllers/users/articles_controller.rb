# frozen_string_literal: true

module Users
  class ArticlesController < Users::Base
    def index
      @articles = current_user.articles
    end

    def show
      set_article
    end

    def new
      @article = current_user.articles.build
    end

    def create
      @article = current_user.articles.build(article_params)
      if @article.save
        flash[:success] = '投稿完了'
        redirect_to users_article_path(@article)
      else
        render :new
      end
    end

    def edit
      set_article
    end

    def update
      set_article
      @article.assign_attributes(article_params)
      if @article.save
        flash[:success] = '更新完了'
        redirect_to users_article_path(@article)
      else
        render :edit
      end
    end

    def destroy
      set_article
      @article.destroy!
      redirect_to users_articles_path
    end

    private
      def article_params
        params.require(:article).permit(:title, :sub_title, :content)
      end

      def set_article
        @article = current_user.articles.find(params[:id])
      end
  end
end
