class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save
    redirect_to vital_path(@comment.vital), notice: 'コメントを追加'
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
    redirect_to vital_path(@comment.vital), notice: 'コメントを削除'
  end

  private

  def set_vital
    @vital = Vital.find(params[:vital_id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(vital_id: params[:vital_id])
  end
end
