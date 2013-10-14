class ActCausesController < ApplicationController
  before_filter :authenticate_user!

  def update
    @act_cause = ActCause.find(params[:id])

    respond_to do |format|
      if @act_cause.update_attributes(params[:act_cause])
        format.html { redirect_to @act_cause.cause, notice: 'Act was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @act_cause.errors, status: :unprocessable_entity }
      end
    end
  end

end
