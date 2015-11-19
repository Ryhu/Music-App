module ApplicationHelper
  def ugly_lyrics(lyrics)
    result = ""
    list = lyrics.split("\r\n")
    list.each do |line|
      result += "&#9835;" + html_escape(line)
    end
    result.html_safe
  end
end
