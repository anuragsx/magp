module ApplicationHelper
  def error_messages!(resource)
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
       <div class="alert alert-error alert-block" style="margin-left:149px;">
          <button type="button" class="close" data-dismiss="alert">x</button>
          <h4>#{sentence}</h4>
          <div style="margin-left:17px;color:red;">#{messages}</div>
       </div>
    HTML

    html.html_safe
  end

  def selected_magazine(param)
    @magazine = Magazine.find(param.to_i)
    @magazine.title
  end

  def selected_issue(param)
    @issue = Issue.find(param.to_i)
    @issue.name
  end

  def magazine_issues(magazine_id)
    if magazine_id.present?
      @issues = Magazine.find(magazine_id)
      @issues.issues
    end
  end

  def file_by_content_type(article_file)
    if article_file.article_file_content_type=="application/pdf"
      "1420984444_pdf.png"
    elsif article_file.article_file_content_type=="doc"
      "1426188215_698685-icon-94-document-file-doc-128.png"
    else
      article_file.article_file.url(:thumb, timestamp:false)
    end
  end

end
