module BandsHelper

  def this_user_is_member_of?(band)
    band.members.include? current_user
  end
end