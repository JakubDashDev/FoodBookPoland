# This file should ensure the existence of records required to run the application in every
# environment (production, development, test). The code here should be idempotent so that it
# can be executed at any point in every environment. In particular, note that this file may be
# executed more than once (in production, once per deployment).

if Rails.env.development?
  AdminUser.find_or_create_by!(email: "admin@example.com") do |user|
    user.password = "password123"
  end
end
