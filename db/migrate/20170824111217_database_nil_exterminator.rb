class DatabaseNilExterminator < ActiveRecord::Migration[5.1]
  def change
    execute "UPDATE likes SET user_id = '9' WHERE user_id IS NULL;"
    execute "UPDATE posts SET user_id = '9' WHERE user_id IS NULL;"
    execute "UPDATE comments SET user_id = '9' WHERE user_id IS NULL;"
    execute "UPDATE users SET first_name = '[name]' WHERE first_name IS NULL;"
    execute "UPDATE users SET last_name = '[lastname]' WHERE last_name IS NULL;"
    execute "UPDATE users SET occupation = '[occupation]' WHERE occupation IS NULL;"
    execute "UPDATE users SET hometown = '[hometown]' WHERE hometown IS NULL;"
    execute "UPDATE users SET date_of_birth = '1970-01-01 00:00:00' WHERE date_of_birth IS NULL;"
    execute "UPDATE users SET bio = '[bio]' WHERE bio IS NULL;"
  end
end
