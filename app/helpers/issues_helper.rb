module IssuesHelper

  def sample_image(issue)
    issue.cover_image.present? ? issue.cover_image.url(:thumb) : "1420848314_book-128.png"
  end
end
