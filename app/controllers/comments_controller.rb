class CommentsController < ApplicationController
  def create
  	visitor = Visitor.find_by(email: visitor_comments_params[:email])

    if visitor
     visitor.tap do |v|         
     	comments_att = visitor_comments_params[:comments_attributes]['0']		
     	v.comments << Comment.new(comments_att)     	
     end
    else
    	visitor = Visitor.new(visitor_comments_params)
    end

  	if verify_recaptcha(model: visitor) && visitor.save
  		flash[:notice] = "Successfully created new comment"
  	else
  		flash[:alert] = "there was a problem creating your comment"
  	end  
    
    @post = Post.find(visitor_comments_params[:comments_attributes]['0'][:post_id])

  	redirect_to post_path(@post)
  end

  private

  def visitor_comments_params
  	params.require(:visitor).permit(:fullname, :email, :comments_attributes => [:message, :post_id])
  end  
end
