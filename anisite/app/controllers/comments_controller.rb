class CommentsController < ApplicationController
  
  def new
  end
  
  def create
    @user = User.find(params[:user_id])
    cp = comment_params
    cp[:receiver_id] = (current_user).id
    @comment = @user.comments.create(cp)
    redirect_to user_path(@user)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:written_comment)
  end
  
end
