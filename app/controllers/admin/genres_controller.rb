class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!,only: [:create,:edit,:update,:index]

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genere_params)
    if @genre.save
      redirect_to admin_genres_path
    else
      flash[:genre_created_error] = "ジャンル名を入力してください"
      redirect_to
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
     if @genre.update(genre_params)
       redirect_to admin_genres_path
       flash[:notice__update] = "ジャンルを更新しました！"
     else
        render'edit'
     end
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :is_genres_status)
  end
  
end
