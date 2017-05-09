Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['1cca112ae06775cc34dc'], ENV['30b6c7e1e36752f8f2ee93d0364615879199d0db'], scope: "user,repo"
end
