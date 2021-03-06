class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  layout 'internal'

  # GET /issues
  # GET /issues.json
  def index
    @magazine = Magazine.find(params[:magazine_id])
    @issues = @magazine.issues
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    @magazine = Magazine.find(params[:magazine_id])
    @issue = @magazine.issues.new
  end

  # GET /issues/new
  def new
    @magazine = Magazine.find(params[:magazine_id])
    @issue = @magazine.issues.new
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues
  # POST /issues.json
  def create
    @magazine = Magazine.find(params[:magazine_id])
    @issue = @magazine.issues.new(issue_params)
    respond_to do |format|
      if @issue.save
        format.html { redirect_to magazine_issues_path(magazine_id: @magazine), notice: 'Issue was successfully created.' }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to magazine_issues_path(@magazine), notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to magazine_issues_path(@magazine), notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
      @magazine = Magazine.find(params[:magazine_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:name, :image, :pdf_file_name_file_name, :print_deadline, :cover_image, :pdf_file_name, :pdf_file_name_file_name_content_type)
    end
end
