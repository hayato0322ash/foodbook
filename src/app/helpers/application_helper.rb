module ApplicationHelper
  def full_title(page_title)
    base_title = 'foodbook -たった一品の虜になる- '
    return base_title if page_title.blank?

    page_title + ' | ' + base_title
  end
end
