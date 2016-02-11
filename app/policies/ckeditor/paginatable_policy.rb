class Ckeditor::PaginatablePolicy
  def page?
    true
  end

  def scoped?
    true
  end

  def next_page?
    true
  end

  def prev_page?
    true
  end

  def first_page?
    true
  end

  def last_page?
    true
  end

  def total_pages?
    true
  end

  def total_count?
    true
  end

  def current_page?
    true
  end
end
