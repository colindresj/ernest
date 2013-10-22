module ApplicationHelper

  def markdown (text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_block: true,
      superscript: true,
      strikethrough: true,
      highlight: true,
      quote: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

end
