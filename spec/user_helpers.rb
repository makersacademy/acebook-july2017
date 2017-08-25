  def sign_up(first_name = "Edward",
              last_name = "Withers",
              birth_year = 1890,
              birth_month = "May",
              birth_day = 1,
              email = "user@gmail.com",
              password = "123456abc.",
              hometown = "London",
              occupation = "Coach",
              bio = "I'm pretty cool and stuff. Now go feed the MonsterCat")
    visit('/users/sign_up')
    fill_in 'user_first_name', with: first_name
    fill_in 'user_last_name', with: last_name
    select birth_year, :from => "user_date_of_birth_1i"
    select birth_month, :from => "user_date_of_birth_2i"
    select birth_day, :from => "user_date_of_birth_3i"
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password
    fill_in 'user_hometown', with: hometown
    fill_in 'user_occupation', with: occupation
    fill_in 'user_bio', with: bio
    click_button 'Sign up'
  end

  def sign_out
    click_link 'Sign out'
  end

  def login(user)
    visit("/users/sign_in")
    within(:css, 'form.new_user') do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
    end
  end
