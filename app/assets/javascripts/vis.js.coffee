$ ->
  height = 100
  width  = 100

  $wat = $('#wat')
  decay_rate = 0.2
  applyDecay = ->
    multiplier = 1 - decay_rate
    height = height * multiplier
    width  = width * multiplier
    if (width > 400 && height > 400) && (width < 600 && height < 600)
      $wat.css('background', "green")
    else
      $wat.css('background', "red")

    $wat.css('height', "#{height}px")
    $wat.css('width', "#{width}px")

  setInterval applyDecay, 200

  $(document).on 'mousemove', =>
    height += 20;
    width  += 20;
    $wat.css('height', "#{height}px")
    $wat.css('width', "#{width}px")
