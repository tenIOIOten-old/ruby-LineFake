module SessionsHelper
<<<<<<< HEAD

=======
>>>>>>> 42e4863dad6c78b3bca55215a13c4d1936b12f5b
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if(user_id = session[:user_id])
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
end
