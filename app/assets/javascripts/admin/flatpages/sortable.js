$(document).ready(function() {

  if($('table#flatpages').length == 1) {
    /* some helper function */

    var serializeFlatpageIds = function() {
      var flatpageIds = $.makeArray(
        $('.sortable_title').map(function(){
          return $(this).data('id');
        })
      );

      return { ids: flatpageIds };
    };


    var fixWidthHelper = function(e, ui) {
      var title_td = $('.sortable_title').parent();
      title_td.width(countMaxWidth(title_td));


      ui.children().each(function() {
        $(this).width($(this).width());
      });

      return ui;
    };

    var fixTableZebraStyle = function() {
      $('tr').removeClass('odd even');
      $('tr:nth-child(even)').addClass('even');
      $('tr:nth-child(odd)').addClass('odd');
    };

    var countMaxWidth = function(element) {
      var widths = element.map(function() {
        return $(this).width()
      });

      return Math.max.apply(Math, widths);
    };


    /* jqueyr-ui sortable on flatpages table */

    $('table#flatpages tbody').sortable({
      axis: 'y',
      helper: fixWidthHelper,
      containment: 'parent',
      handle: $('.sortable_title').parent(),


      update: function(e, ui) {
        fixTableZebraStyle();

        $.ajax({
          url: '/admin/flatpages/sort',
          type: 'put',
          data: serializeFlatpageIds()
        })
      }
    });

  }

});