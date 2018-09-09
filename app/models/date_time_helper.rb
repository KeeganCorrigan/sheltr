module DateTimeHelper
  def hours_for_today(hours)
    if hours
      hours[Date.today.wday - 1]
    end
  end
end
