---
blog: 'blog'
---

xml.instruct!
xml.feed 'xmlns' => 'http://www.w3.org/2005/Atom' do
  xml.title 'ryan jafari'
  xml.subtitle 'Foodie, gym rat, gamer, web developer'
  xml.id 'http://ryanjafari.me/'
  xml.link 'href' => 'http://ryanjafari.me/'
  xml.link 'href' => 'http://ryanjafari.me/feed.xml', 'rel' => 'self'
  xml.updated blog.articles.first.date.to_time.iso8601
  xml.author { xml.name 'Ryan Jafari' }

  blog.articles[0..5].each do |article|
    xml.entry do
      xml.title article.title
      xml.link 'rel' => 'alternate', 'href' => article.url
      xml.id article.url
      xml.published article.date.to_time.iso8601
      xml.updated article.date.to_time.iso8601
      xml.author { xml.name 'Ryan Jafari' }
      xml.summary article.summary, 'type' => 'html'
      xml.content article.body, 'type' => 'html'
    end
  end
end
