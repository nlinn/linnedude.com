xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "linnedude.com | #{@title}"
    xml.description "A personal website: #{@title}"
    xml.link root_url

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description post.content.body.to_s
        xml.pubDate post.published_at.to_s(:rfc822)
        xml.link "/read/#{post.slug}"
        xml.guid "/read/#{post.slug}"
      end
    end
  end
end
