class StylesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
    @style = Style.new
  end
  def create
    @style = current_user.styles.build(style_params)
    if @style.save
      redirect_to style_path(@style), notice: "スタイルを投稿しました。"
    else
      render :new
    end
  end
  def index
    @styles = Style.all.order(id: "DESC")
  end
  def show
    @style = Style.find(params[:id])
    @comment = Comment.new
    @comments = @style.comments.includes(:user)
  end
  def edit
    @style = Style.find(params[:id])
    if @style.user != current_user
        redirect_to styles_path, alert: "不正なアクセスです。"
    end
  end
  def update
    @style = Style.find(params[:id])
    if @style.update(style_params)
      redirect_to style_path(@style), notice: "スタイルを更新しました。"
    else
      render :edit
    end
  end
  def destroy
    style = Style.find(params[:id])
    style.destroy
    redirect_to user_path(style.user), notice: "スタイルを削除しました。"
  end

  private
  def style_params
    params.require(:style).permit(:title, :body, :image, :comment)
  end
end