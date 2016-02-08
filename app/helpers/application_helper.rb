module ApplicationHelper

  def link_to_in_li(body, url)
    active = "active" if current_page?(url)
    content_tag :li, class: active do
      link_to body, url
    end
  end

  def title(text)
    content_for :title, text
  end

  def embed(youtube_url)
    youtube_id = youtube_url.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end


end
