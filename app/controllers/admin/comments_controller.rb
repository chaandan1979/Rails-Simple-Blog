class Admin::CommentsController < Admin::ApplicationController
  def index
  	if params[:search].present?
       @comments = Comment.matching_fullname_or_message(params[:search]).page params[:page]
    else
    	if params[:status].present?
  	     @comments = Comment.where(status: to_bool(params[:status])).page params[:page]
  		else
  		 @comments = Comment.all.order(id: :desc).page params[:page]
  		end
    end
  end

  def update
  	@comment = Comment.find(params[:id])
  	@status = @comment.status
  	if @comment.update(status: params[:status])
  		redirect_to admin_comments_path(status: @status), notice: 'Successfully updated comment'
  	else
  		redirect_to admin_comments_path(status: @status), notice: 'There was a problem updating comment'
  	end
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@status = @comment.status
  	@comment.destroy

  	redirect_to admin_comments_path(status: @status), notice: 'Successfully deleted comment'
  end
end
