class ConversationsController < ApplicationController
  before_action :get_mailbox
  before_action :get_conversation, except: [:index, :empty_trash]
  before_action :get_box, only: [:index]

  def index
    if @box.eql? 'bandeja'
      @conversations = @mailbox.inbox
    elsif @box.eql? 'enviados'
      @conversations = @mailbox.sentbox
    else
      @conversations = @mailbox.trash
    end
    @conversations = @conversations.paginate(page: params[:page], per_page: 5)
  end

  def show
    # render(:text => params)
    @conversation.mark_as_read(current_user)
    respond_to do |format|
      format.js{}
      format.html{}
    end
  end

  def reply
    # render(:text => params)
    var = @conversation
    current_user.reply_to_conversation(@conversation, params[:body])
    redirect_to conversations_path
  end
  def destroy
    @conversation.move_to_trash(current_user)
    flash[:success] = 'The conversation was moved to trash.'
    # redirect_to conversations_path
    redirect_to :back
  end
  def restore
    @conversation.untrash(current_user)
    flash[:success] = 'The conversation was restored.'
    # redirect_to conversations_path
    redirect_to :back
  end
  def empty_trash
    @mailbox.trash.each do |conversation|
      conversation.receipts_for(current_user).update_all(deleted: true)
    end
    flash[:success] = 'Your trash was cleaned!'
    redirect_to conversations_path
  end

  private
  def get_mailbox
    @mailbox ||= current_user.mailbox
  end

  def get_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end

  def get_box
    if params[:box].blank? or !['bandeja', 'enviados', 'papelera', 'componer'].include?(params[:box])
      params[:box] = 'bandeja'
    end
    @box = params[:box]
  end


end
