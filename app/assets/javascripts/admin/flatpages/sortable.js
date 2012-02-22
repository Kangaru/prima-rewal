$(document).ready(function() {

  if($('table#flatpages').length == 1) {
    var sortable_table = $('table#flatpages tbody');
    var sortable_title = $('table#flatpages tbody .sortable_title');

    function serializeFlatpageIds() {
      var flatpageIds = $.makeArray(
        sortable_title.map(function(){
          return $(this).data('id');
        })
      );

      return { ids: flatpageIds };
    }

    var fixWidthHelper = function(e, ui) {
      ui.children().each(function() {
        $(this).width($(this).width());
      });

      return ui;
    };



    sortable_table.sortable({
      distance: 15,
      axis: 'y',
      helper: fixWidthHelper,

      update: function() {
        $.ajax({
          url: '/admin/flatpages/sort',
          type: 'put',
          data: serializeFlatpageIds(),
          complete: function(){
            sortable_title.parent().effect('highlight');
          }
        })
      }
    });
  }

});