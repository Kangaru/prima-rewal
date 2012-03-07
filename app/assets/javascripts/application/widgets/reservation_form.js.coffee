jQuery ->
  $("#new_reservation").bind "ajax:before", ->
    $(".spinner img").show()