module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(user, options = { size: 100 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "gravatar")
  end

  def liked_artists(user)
    artists = []
    Work.all.each do |work|
      if user.likes?(work)
        artists << work.artist.user.username
      end
 		end
 		names = artists.uniq.join(' ')
 	end
end

