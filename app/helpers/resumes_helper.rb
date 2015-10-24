module ResumesHelper

  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language, options: {linenostart: 1, linenos: 'inline'})
    end
  end

  def markdown(text)
    renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      superscript: true,
      strikethrough: true
    }

    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

end
