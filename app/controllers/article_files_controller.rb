class ArticleFilesController < ApplicationController

  require 'zip/zip'
  require 'zip/zipfilesystem'
  require 'open-uri'

  def create
    @article = Article.find(params[:article_id])

    params[:article_file][:article_file].each do |af|
      @article_file = @article.article_files.create(article_file: af)
    end

    respond_to do |format|
      if @article_file.save
        format.html { redirect_to article_path(issue_id: params[:article_file][:issue_id],
                                               :magazine_id => params[:article_file][:magazine_id],
                                               :id => params[:article_id]),
                                                notice: 'Article Files was successfully uploaded.' }
      else
        format.html { redirect_to article_path(issue_id: params[:article_file][:issue_id],
                                               :magazine_id => params[:article_file][:magazine_id],
                                               :id => params[:article_id]),
                                  notice: @article_file.errors.full_messages.map { |msg|  msg }.join(" , ") }
      end
    end
  end

  def destroy
    @article_file = ArticleFile.find(params[:id])
    @article_file.destroy
    respond_to do |format|
      format.html { redirect_to article_path(issue_id: params[:issue_id],
                                             :magazine_id => params[:magazine_id], :id => params[:article_id]),
                                             notice: 'Article Files was successfully deleted.' }
    end
  end

  def download_url
    @article_file = ArticleFile.find(params[:id])
    send_file @article_file.article_file.path, :type => @article_file.article_file_content_type
  end

  def download_content
    @article = Article.find(params[:id])
    article_files = @article.article_files
    if article_files.present?
      t = Tempfile.new("#{@article.title}-#{request.remote_ip}")
      Zip::ZipOutputStream.open(t.path) do |zos|
        article_files.map{|a| a.article_file_file_name}.each do |article_file|
          #fpath = article_file.article_file.path
          zos.put_next_entry(article_file)
          zos.print IO.read(ArticleFile.find_by_article_file_file_name(article_file).article_file.path)
        end
      end
      send_file t.path, :type => 'application/zip', :disposition => 'attachment', :filename => @article.title + "-files.zip"
      t.close
    end
  end

  private

  def article_file_params
    params.require(:article_file).permit(:article_file_file_name, :article_file_content_type, :article_file_file_size,
                                         :article_file_updated_at, :article_id, :article_file)
  end
end
