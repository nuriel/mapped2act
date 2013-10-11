class CausesController < ApplicationController
  before_filter :authenticate_user!

  # # GET /causes
  # GET /causes.json
  def index
    @causes = Cause.all

    @json = Cause.all.to_gmaps4rails

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @causes }
    end
  end

  # GET /causes/1
  # GET /causes/1.json
  def show
    @cause = Cause.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cause }
    end
  end

  # GET /causes/new
  # GET /causes/new.json
  def new
    @cause = Cause.new

    Act.all.each do |act|
      @cause.act_causes.where(act_id: act.id).first_or_initialize
    end


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cause }
    end
  end

  # GET /causes/1/edit
  def edit
    @cause = Cause.find(params[:id])
  end

  # POST /causes
  # POST /causes.json
  def create
    @cause = Cause.new(params[:cause])

    respond_to do |format|
      if @cause.save
        @cause.set_state(user_signed_in? ? :approved : :awaiting_approval)

        format.html { redirect_to @cause, notice: 'Cause was successfully created.' }
        format.json { render json: @cause, status: :created, location: @cause }
      else
        format.html { render action: "new" }
        format.json { render json: @cause.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /causes/1
  # PUT /causes/1.json
  def update
    @cause = Cause.find(params[:id])

    respond_to do |format|
      if @cause.update_attributes(params[:cause])
        @cause.set_state(user_signed_in? ? :approved : :awaiting_approval)

        format.html { redirect_to @cause, notice: 'Cause was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cause.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /causes/1
  # DELETE /causes/1.json
  def destroy
    @cause = Cause.find(params[:id])
    @cause.destroy

    respond_to do |format|
      format.html { redirect_to causes_url }
      format.json { head :no_content }
    end
  end
end
