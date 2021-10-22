def seed_admin_users
  emails = [
    'hecbeita1988@gmail.com',
    'aespinozavega@gmail.com',
  ]

  emails.each do |email|
    User.find_or_initialize_by(email: email) do |user|
      user.email    = email
      user.password = '4adminAcmv!'
    end
  end
end

seed_admin_users
