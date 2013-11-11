$(document).ready ->

  # Cache the Window object
  $window = $(window)
  $("section[data-type=\"background\"]").each ->
    $bgobj = $(this) # assigning the object
    $(window).scroll ->

      # Scroll the background at var speed
      # the yPos is a negative value because we're scrolling it UP!
      yPos = -($window.scrollTop() / $bgobj.data("speed"))

      # Put together our final background position
      coords = "50% " + yPos + "px"

      # Move the background
      $bgobj.css backgroundPosition: coords



# window scroll Ends

#
# * Create HTML5 elements for IE's sake
#
document.createElement "article"
document.createElement "section"
