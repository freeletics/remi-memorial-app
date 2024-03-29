class MessagesController < ApplicationController
  before_action :require_user, except: [:index, :show]
  before_action :set_message, only: [:edit, :update, :destroy]

  def index
    @messages = Message.includes(:image).recent.page(params[:page]).per(17)
  end

  def my
    @messages = current_user.messages.includes(:image).recent
  end

  def show
    @message = Message.find_by(id: params[:id])

    redirect_to messages_path, notice: 'Message not found.' unless @message
  end

  def new
    @message = current_user.messages.new
  end

  def edit; end

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

  def set_message
    @message = Message.find_by(id: params[:id])

    redirect_to messages_path, notice: 'Message not found.' unless @message

    return if current_user.messages.include?(@message) || current_user.admin

    redirect_to messages_path, notice: 'Unauthorized.'
  end

  def message_params
    params.require(:message).permit(:content, :name, :image_id)
  end
end
