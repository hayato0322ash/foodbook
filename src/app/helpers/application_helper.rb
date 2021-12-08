module ApplicationHelper
  def full_title(page_title)
    base_title = 'foodbook -たった一品の虜になる- '
    return base_title if page_title.blank?

    page_title + ' | ' + base_title
  end

  def date_format(datetime)
    time_ago_in_words(datetime) + '前'
  end
end
