Locality =
  init: -> (suburbEl, stateEl, postCodeEl) ->
    auto = suburbEl.autocomplete
      source: 'http://aulocalities.herokuapp.com/'
      delay: 200
      minLength: 3
      select: @setLocality
    auto.data("autocomplete")._renderItem = (ul, item) =>
      html = @autoLi(item[0], item[1], item[2])
      $(html).data("item.autocomplete", item).appendTo(ul)

  autoLi: (suburb, state, postCode) ->
    "<li><a><strong>#{suburb}</strong>, #{state}, #{postCode}</a></li>"

  setLocality: (event, ui) ->
    suburbEl.val   ui.item[0]
    stateEl.val    ui.item[1]
    postCodeEl.val ui.item[2]
    false

window.Locality = Locality
