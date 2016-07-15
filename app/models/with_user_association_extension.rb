module WithUserAssociationExtension
  def create_with_user(attributes = {}, user)
    attributes[:user_id] ||= user
    create(attributes)
  end

  def create_with_user!(attributes = {}, user)
    attributes[:user_id] ||= user
    create!(attributes)
  end

  def build_with_user(attributes = {}, user)
    attributes[:user_id] ||= user
    build(attributes)
  end
end
