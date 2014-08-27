module ApplicationHelper

  def sign_in_or_out
    return "<a href=\"/goodbye\"><li>Sign out</li></a>".html_safe if current_user
    "<a href=\"/musicians/new\"><li>Sign in</li></a>".html_safe
  end

end
