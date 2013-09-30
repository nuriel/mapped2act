class CauseCategoriesController < ApplicationController
  # GET /cause_categories
  # GET /cause_categories.json
  def index
    @cause_categories = CauseCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cause_categories }
    end
  end

  # GET /cause_categories/1
  # GET /cause_categories/1.json
  def show
    @cause_category = CauseCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cause_category }
    end
  end

  # GET /cause_categories/new
  # GET /cause_categories/new.json
  def new
    @cause_category = CauseCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cause_category }
    end
  end

  # GET /cause_categories/1/edit
  def edit
    @cause_category = CauseCategory.find(params[:id])
  end

  # POST /cause_categories
  # POST /cause_categories.json
  def create
    @cause_category = CauseCategory.new(params[:cause_category])

    respond_to do |format|
      if @cause_category.save
        format.html { redirect_to @cause_category, notice: 'Cause category was successfully created.' }
        format.json { render json: @cause_category, status: :created, location: @cause_category }
      else
        format.html { render action: "new" }
        format.json { render json: @cause_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cause_categories/1
  # PUT /cause_categories/1.json
  def update
    @cause_category = CauseCategory.find(params[:id])

    respond_to do |format|
      if @cause_category.update_attributes(params[:cause_category])
        format.html { redirect_to @cause_category, notice: 'Cause category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cause_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cause_categories/1
  # DELETE /cause_categories/1.json
  def destroy
    @cause_category = CauseCategory.find(params[:id])
    @cause_category.destroy

    respond_to do |format|
      format.html { redirect_to cause_categories_url }
      format.json { head :no_content }
    end
  end
end
