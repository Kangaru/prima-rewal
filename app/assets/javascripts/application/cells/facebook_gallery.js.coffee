jQuery ->
  if $('#fbgallery').length > 0
    $('a[href="http://www.facebook.com/PrimaRewal/photos"]').attr('target', '_blank')

    $('#fbgallery a').fancybox
      prevEffect: 'none'
      nextEffect: 'none'
