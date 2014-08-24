class Member
  module OmniauthCallbacks
    require 'securerandom'

    def from_omniauth(auth)
      where(auth.slice(:provider, :uid)).first_or_initialize.tap do |member|
        member.provider = auth.provider
        member.uid = auth.uid
        member.name = auth.info.name.blank? ? "" : auth.info.name
        member.username = auth.extra.raw_info.username.blank? ? "temp.#{Time.now.to_i}" : auth.extra.raw_info.username
        member.email = auth.info.email.blank? ? "temp.#{Time.now.to_i}@yijing.tw" : auth.info.email
        member.oauth_hash = auth.to_s
        member.oauth_access_token = auth.credentials.token
        member.password = SecureRandom.hex(4)
        member.oauth_expires_at = Time.at(auth.credentials.expires_at)
        # member.skip_confirmation!

        member.save!
      end
    end
  end
end
