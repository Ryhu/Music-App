module ApplicationHelper
  def ugly_lyrics(lyrics)
    result = ""
    lyrics.lines.each do |line|
      result << "&#9835; #{html_escape(line)}"
    end

    "<pre>#{result}</pre>".html_safe
  end
end
