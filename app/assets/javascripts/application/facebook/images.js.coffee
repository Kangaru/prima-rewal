countMinimalValue = (array) ->
  array.reduce (x,y) -> Math.min x,y

fixSizeHelper = (images) ->
  sizes = images.map ->
    width: $(this).width()
    height: $(this).height()

  maxWidth  = countMinimalValue(e.width for e in sizes)
  maxHeight = countMinimalValue(e.height for e in sizes)

  images.each ->
    $(this).height maxHeight unless $(this).height is maxHeight
    $(this).width maxWidth unless $(this).width is maxWidth

jQuery ->
  if $('#fbgallery').length > 0
    fixSizeHelper($("#fbgallery .span2 img"))

    $('#fbgallery a').fancybox
      prevEffect: 'none'
      nextEffect: 'none'
