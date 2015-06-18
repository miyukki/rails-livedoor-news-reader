module ApplicationHelper
  def title
    content_for?(:title) ? content_for(:title) : t('title')
  end
end
