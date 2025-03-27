class Item < ApplicationRecord
  belongs_to :board
  validates :x, :y, :width, :height, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :link, presence: true

  # before_save :valid_embed_url  # Ensure URL is valid before saving

  # YOUTUBE_URL_REGEXP = %r{(https?://)(www.)?(youtube\.com/watch\?v=|youtu\.be/|youtube\.com/watch\?feature=player_embedded&v=)([A-Za-z0-9_\-]*)(&\S+)?(\?\S+)?}

  # def embed_link_url
  #   link.gsub!(YOUTUBE_URL_REGEXP) do
  #     youtube_id = Regexp.last_match(4)
  #     "//www.youtube.com/embed/#{youtube_id}"
  #   end
  #   link  # Return the modified URL
  # end

  # private

  # def valid_embed_url
  #   unless link =~ YOUTUBE_URL_REGEXP
  #     errors.add(:base, 'Not allowed link')
  #     throw :abort  # Prevent save if the URL is invalid
  #   end
  # end
end
