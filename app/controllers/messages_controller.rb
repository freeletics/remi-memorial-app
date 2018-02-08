class MessagesController < ApplicationController
  before_action :require_user, except: [:index, :show]
  before_action :set_message, only: [:edit, :update, :destroy]

  def index
    @messages = Message.all
  end

  def my
    @messages = current_user.messages
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = current_user.messages.new
  end

  def edit
  end

  def create
    @message = current_user.messages.new(message_params)

    if @message.save
      redirect_to @message, notice: 'Message was successfully created.'
    else
      render :new
    end
  end

  def update
    if @message.update(message_params)
      redirect_to @message, notice: 'Message was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @message.destroy
    redirect_to messages_path, notice: 'Message was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = current_user.messages.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:content, :name, :image)
    end
end
