class TicketsController < ApplicationController
  before_action :fetch_ticket, only: [:show, :destroy, :edit, :update]


  def show
  end 

  def create
    @ticket = Ticket.create(ticket_params)
    if @ticket.errors.blank?
      redirect_to project_path(id: params[:project_id])
    else 
      respond_to do |format|
        format.js {render action: "errors"}
      end
    end
  end

  def edit
  end

  def update
    @ticket.update(ticket_params)
    if @ticket.errors.blank?
      redirect_to project_path(id: params[:project_id])
    else 
      respond_to do |format|
        format.js {render action: "errors"}
      end
    end
  end

  def destroy
    @ticket.destroy
  end

  def change_status
    @ticket = Ticket.find(params[:ticket_id])
    @ticket.update(ticket_status_id: params[:status_id])
    redirect_to project_path(id: params[:project_id])
  end

  private 
    def fetch_ticket
      @ticket = Ticket.find(params[:id])
    end 

    def ticket_params
      params.require(:ticket).permit(:title, :ticket_status_id, :descrition, :project_id)
    end 

end

