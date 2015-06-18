module ApplicationHelper
  def title
    if content_for?(:title)
      "#{content_for(:title)} - #{t('title')}"
    else
      t('title')
    end
  end
end
