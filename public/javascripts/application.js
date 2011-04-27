(function($) {
  var $line_item_container = $('#line-items'),
      $line_items          = $('input.item-cost', $line_item_container),
      $line_item_total     = $('#line-item-total', $line_item_container);

  $line_items.bind('keyup', function() {
    var values = _.map($line_items, function(input) { return Number(input.value) }),
        total  = _.inject(values, function(sum, num) { return sum + num }, 0);

    $line_item_total.val('$' + total)
  })
})(jQuery);
