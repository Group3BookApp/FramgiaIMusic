module LyricsHelper
  def correct_lyric? lyric
    lyric.user_id == current_user.id
  end
end
