class LyricsController < ApplicationController
  before_action :load_song, only: %i(create)
  before_action :load_lyric, except: :create
  #before_action :logged_in_user, only: %i(create edit update destroy)
  #before_action :correct_lyric, only: :update
  #before_action :check_user_lyric, only: :destroy

  def create
    @lyric = @song.lyrics.new lyric_params
    @lyric.user_id = current_user.id
    if @lyric.save
      flash[:success] = t ".created"
      redirect_to song_path @song
    else
      flash[:danger] = t ".createfail"
      redirect_to song_path @song
    end
  end

  def show; end

  private

  def lyric_params
    params.require(:lyric).permit :content, :song_id, :user_id
  end

  def load_song
    return if @song = Song.find_by(id: params[:song_id])
    flash[:danger] = t ".not_found"
    redirect_to songs_path
  end

  def load_lyric
    @lyric = @song.lyrics.find_by id: params[:id]
    return if @lyric
    flash[:danger] = t ".not_found"
    redirect_to song_path @song
  end

  def correct_lyric
    return if correct_lyric? @lyric
    flash[:danger] = t ".unauthorized"
    redirect_to song_path @song
  end

  def check_user_lyric
    return if current_user.admin? || correct_lyric?(@lyric)
    flash[:danger] = t ".unauthorized"
    redirect_to song_path @song
  end
end
