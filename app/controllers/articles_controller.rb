class ArticlesController < ApplicationController
  layout 'internal'
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @issue = Issue.find(params[:issue_id])
    @articles = @issue.articles
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    if params[:ver].present?
      @article = PaperTrail::Version.find(params[:ver]).reify
      @comments = @article.comments
      @article_file = ArticleFile.new
      @article_files = @article.article_files
    else
      @comments = @article.comments
      @article_file = ArticleFile.new
      @article_files = @article.article_files
    end
  end

  # GET /articles/new
  def new
    @issue = Issue.find(params[:issue_id])
    @article = @issue.articles.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @issue = Issue.find(params[:issue_id])
    @article = @issue.articles.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to issue_articles_path(issue_id: params[:article][:issue_id], :magazine_id => params[:article][:magazine_id]), notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    @article = Article.find(params[:id])
    #@article_file = @article.article_files.new(article_file_params)
    respond_to do |format|
      if @article.update!(article_params)
        format.html { redirect_to article_path(issue_id: params[:article][:issue_id], :magazine_id => params[:article][:magazine_id]), notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to issue_articles_path(issue_id: params[:article][:issue_id], :magazine_id => params[:article][:magazine_id]), notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :description, :user_id, :deadline, :article_text, :issue_id, :editor, :contributor, :photographer,
                                      :main_contact, :copy_complete, :photo_complete, :print_ready, :contact_id, :magazine_id)
    end

    def article_file_params
      params.require(:article_file).permit(:article_file, :article_file_file_name, :article_file_content_type, :article_file_file_size,
                                  :article_file_updated_at, :article_id)
    end
end
