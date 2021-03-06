module BelongsToUser
  def self.included(base)
    base.class_eval do
      belongs_to :user
      before_save :associate_with_user
    end
  end

  def associate_with_user
    if defined? $USER
      self.user_id = $USER.id # HACK
    end
  end
end
