json.partial! 'user', user: @user
json.extract! @user, :api_token
