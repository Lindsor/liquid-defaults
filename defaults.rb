require "liquid"

# Cheks if the pased in value is valid.
# In order to be valid has to:
#   Be not an empty string: ""
#   And be a valid value.
# *NOTE: the boolean false is concidered valid.
def isValid(value)
  return (value == false) || (value != "" && value)
end

# Sets a cascading default to assign operators.
# In order to use:
#   With assignment:
#     - {% assign hello = page.hello | defaults: "", "2", "3", "4" %}
#       Given that page.hello does not exist it will then go through the defaults looking for the next valid nonempty one.
#       Will assign "2"
#   With literals:
#     - {{ hello | defaults: "", nill, "3", "4" %}
#       Will print out "3"
module Defaults
  def defaults(original, *defaultValues)
    
    # Check if the original value is valid.
    if isValid(original)
      return original
    end

    # Loop through the defaults and return the first valid one.
    for default in defaultValues
      if isValid(default)
        return default
      end
    end

    # If no defaults were valid return an empty string.
    return ""
  end
end

Liquid::Template.register_filter(Defaults)