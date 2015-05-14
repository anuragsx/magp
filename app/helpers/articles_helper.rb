module ArticlesHelper

  def custom_url(issue, magazine, article)
    action_name == "create" ? issue_articles(issue_id: issue) : articles_path(article)
  end

  def article_version(version)
    Article.find(version.item_id)
  end

  def original_version(version)
    #puts "-----------------------------"
    #puts PaperTrail::Version.find(version).reify.inspect
    #puts "-----------------------------"
    PaperTrail::Version.find(version).reify.id
  end

end
