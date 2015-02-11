class App.Views.Table extends Backbone.View

  el: "<li class='list-group-item list-group-item-success'>"
  template: JST['app/templates/table']

  events:
    "click a": "showDetails"

  showDetails: (e) ->
    e.preventDefault()
    App.Vent.trigger "table:show", @model
    Backbone.history.navigate "/table/" + @model.id
    
  render: ->
    @$el.html(@template(@model.toJSON()))
    @
