class Task

  def initialize(user_input)
    @user_input = user_input
    @due_date = 0
    @set_priority = 0
  end

  def description
    @user_input
  end

  def set_priority(number)
      @priority = number
  end

  def priority
    @priority
  end

  def set_due_date(days_away)
    @due_date = Time.now + (days_away.to_i*24*60*60)
  end

  def due_date
    @due_date
  end

end
