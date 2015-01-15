Factory.define :user do |f|
  f.username "Barbara Seuss"
  f.email 'swizzle@sti.cks'
  f.password 'StinkyPants'
  f.password_confirmation { |u| u.password }
end