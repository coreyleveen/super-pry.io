require 'active_support'
require 'active_support/core_ext'

class PermissionsError < Exception
end

# module Kernel
#   def `(*)
#     raise PermissionsError, "I'm sorry Dave, I'm afraid I can't do that."
#   end

#   def system(*)
#     raise PermissionsError, "This mission is too important for me to allow you to jeopardize it."
#   end

#   def exec(*)
#     raise PermissionsError, "Access Denied."
#   end
# end

Kernel.freeze # Keep users from redefining Kernel methods.
