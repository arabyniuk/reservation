class App.Views.Tables extends Backbone.View
  
  template: JST['app/templates/tables']
  
  initialize: ->
    @listenTo @collection, "reset", @render
    @collection.fetch({ reset: true })

  render: ->
    @$el.html(@template())
    @collection.forEach @renderTable, @
    @

  renderTable: (model) ->
    v = new App.Views.Table({ model: model })
    @$('ul').append(v.render().el)
