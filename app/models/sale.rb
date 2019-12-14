class Sale < ActiveRecord::Base

  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.today, Date.today)
  end

  def finished?
    ends_on < Date.today
  end

  def active?
    !upcoming? && !finished?
  end

  def upcoming?
    starts_on > Date.today
  end

end
