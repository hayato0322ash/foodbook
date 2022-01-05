module ApplicationHelper
  def full_title(page_title)
    base_title = 'foodbook'
    return base_title if page_title.blank?

    base_title + ' - ' + page_title
  end

  def date_format(datetime)
    time_ago_in_words(datetime) + '前'
  end

  def new_time(object, limit)
    now = Time.now
    now < object.created_at.since(limit.day)
  end
end
