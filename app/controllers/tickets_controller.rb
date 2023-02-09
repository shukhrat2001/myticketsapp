class TicketsController < ApplicationController

  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def show
    @ticket = Ticket.find_by_id(params[:id])
    if @ticket.nil?
      redirect_to tickets_path, notice: "Ticket not found."
    end
  end


  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render 'edit'
    end
  end


  def destroy
    puts "Ticket with id #{@ticket.id} is being deleted"
      @ticket.destroy
    redirect_to tickets_path, notice: "Ticket was successfully destroyed."
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      render 'new'
    end
  end

  private
  def ticket_params
    params.require(:ticket).permit(:title, :description, :status)
  end

end
