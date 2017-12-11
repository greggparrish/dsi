class StaticPolicy < Struct.new(:user, :static)

  def index?
    true
  end

  def home?
    true
  end

  def about?
    true
  end

  def terms?
    true
  end

  def privacy?
    true
  end

end


