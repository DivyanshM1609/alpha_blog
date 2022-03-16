class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.paginate(page:params[:page], per_page:5)
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  

  # POST /articles or /articles.json
  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.user=User.first
    if @article.save
       flash[:notice]="Article was created successfully"
       redirect_to @article
    else
       render 'new'
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
       flash[:notice]="Article was edited successfully"
       redirect_to @article
    else
       render 'edit'
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.fetch(:article, {})
    end
  end
