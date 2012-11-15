class User
  include Mongoid::Document
  field :provider, type: String
  field :uid, type: String
  field :name, type: String
  field :email, type: String
  field :created_at, type: DateTime

  attr_accessible :provider, :uid, :name, :email
  # run 'rake db:mongoid:create_indexes' to create indexes
  index({email: 1}, {unique: true, background: true})

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ""
        user.email = auth['info']['email'] || ""
        user.created_at = DateTime.current
      end
    end
  end

end
