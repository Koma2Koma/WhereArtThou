class Work < ActiveRecord::Base
  belongs_to :artist

  acts_as_likeable
  acts_as_taggable

  searchable

  has_attached_file :image, :styles => { :small => "200x200>", 
                                         :medium => "300x300>", 
                                         :large => "450x450>", 
                                         :thumb => "150x150>" }, 
                                         :default_url => "/images/:style/missing.png"
  validates_attachment :image, :presence => true,
    :content_type => { :content_type => /\Aimage\/.*\Z/ },
    :size => { :in => 0..4.megabytes },
    :file_name => { :matches => [/png\Z/, /jpe?g\Z/]}
  do_not_validate_attachment_file_type :image

  def self.work_search_doc(query)    
    where_conditions = [" (to_tsvector(title) ||
                        to_tsvector(description) ||
                        to_tsvector(medium) ) @@ plainto_tsquery(?)", query]
    Work.where(where_conditions).all
  end

end
