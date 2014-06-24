class StatusesController < ApplicationController
  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    @status.creator = User.first #hardcoded for now

    #@user = User.find_by username: params[:username]

    if @status.save
      flash[:notice] = "Your status was created!"
      redirect_to user_path(@status.creator.username)
    else
      render :new
    end
  end

  private

  def status_params
    params.require(:status).permit!
  end
end