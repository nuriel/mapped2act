class CauseSerializer < ActiveModel::Serializer
  attributes :address, :email, :latitude, :logo_url, :longitude, :name, :one_liner, :phone, :social_contribution,
             :website
end