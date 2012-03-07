jQuery ->
  $("#new_reservation").live "ajax:before", ->
    $(".spinner img").show()