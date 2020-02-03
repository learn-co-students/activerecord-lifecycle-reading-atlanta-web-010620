class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case 

  # before  validation is checked, the title is made to be title case by our method below, #make_title_case.
  before_validation :make_title_case
  # validation is checked _after_ that, and because of our method, the title should always be in title case. 

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end
end
