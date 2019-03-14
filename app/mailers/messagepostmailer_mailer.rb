class MessagepostmailerMailer < ApplicationMailer
	def messagepost_email(visitor,post_id)
	  @post = Post.find(post_id)
	  @url = post_path(@post);
      @visitor = visitor      
      mail(to: @visitor.email, subject: 'New Comment Posted on '.@post.title)
   end
end
