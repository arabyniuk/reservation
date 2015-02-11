class App.Views.Reservations extends Backbone.View

  template: JST['app/templates/reservations']

  initialize: ->
    @childViews = []
    @listenTo App.Vent, "reservation:create", @addToCollection
    @listenTo @collection, "add", @renderReservation

  addToCollection: (model) ->
    @collection.add(model)

  render: ->
    @$el.html(@template)
    @collection.forEach @renderReservation, @
    @

  renderReservation: (model) ->
    v = new App.Views.Reservation({ model: model })
    @childViews.push(v)
    @$('#reservations_list').append(v.render().el)

