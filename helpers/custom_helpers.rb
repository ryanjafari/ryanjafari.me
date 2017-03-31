module CustomHelpers
  def screens_for_project(project)
    project_date = project.date.strftime('%Y-%m-%d')
    folder_name = "#{project_date}-#{project.slug}"
    [].tap do |results|
      Dir.glob("./source/projects/#{folder_name}/*.*") do |screen|
        the_path = ['/projects', folder_name, screen.split('/').last]
        path_to_image = File.join(the_path)
        the_url = url_for(path_to_image)
        photo = content_tag(:img, nil, src: the_url)
        thumb = content_tag :a,
                            photo,
                            href: the_url,
                            class: 'thumbnail',
                            data: { toggle: 'lightbox' }
        results << content_tag(:div, thumb, class: 'col-xs-3')
      end
    end.join.html_safe
  end

  def page_data
    current_page.data
  end

  def gravatar_image_tag(email, options = {})
    if email
      hash = Digest::MD5.hexdigest(email.chomp.downcase)
      image_tag "http://www.gravatar.com/avatar/#{hash}.jpg", options
    else
      image_tag 'http://www.gravatar.com/avatar/?d=mm', options
    end
  end

  def tag_links_for(tags)
    content = []
    tags_for(tags).each do |tag|
      content << link_to_tag(tag)
    end
    content.join(', ')
  end

  def tags_for(tags)
    if tags.is_a? String
      tags.split(', ')
    else
      tags
    end
  end

  def link_to_tag(tag)
    content_tag(:a, tag, href: tag_path(tag))
  end

  def bs_dropdown(name, options = {}, &block)
    defaults = { class: 'dropdown' }
    caret = content_tag(:b, nil, class: 'caret')
    toggle = "#{name} #{caret}"

    link_options = {
      class: 'dropdown-toggle',
      data: { toggle: 'dropdown' }
    }
    link = link_to(toggle, '#', link_options)

    menu = content_tag(:ul, capture(&block), class: 'dropdown-menu')
    content_tag(:li, link + menu, defaults.update(options))
  end

  def contact_link(text = nil, options = {}, &block)
    content = block_given? ? yield : text
    defaults = {
      encode: 'hex',
      subject: 'My project',
      body: "Hai guiz! I've got a hankering for some sweet coding love!"
    }
    mail_to 'book@cetrasoft.com', content, defaults.merge(options)
  end

  def active_nav?(name, active_class = 'active')
    filename = File.basename(current_page.path, '.html')
    directory = File.dirname(current_page.path)
    directories = File.dirname(current_page.path).split('/')

    if name == 'index'
      active_class if filename == 'index' && directory == '.'
    else
      is_active = [filename, directories].flatten.include?(name)
      is_active ? active_class : ''
    end
  end
end
