require 'active_support'
require 'active_support/core_ext'

hoosegow = Hoosegow.new :inmate_dir => File.join(settings.root, "hoosegow")
#hoosegow.build_image
hoosegow.image_name
