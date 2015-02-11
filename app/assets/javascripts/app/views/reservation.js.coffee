class App.Views.Reservation extends Backbone.View

  template: JST['app/templates/reservation']

  initialize: ->
    @listenTo @model, 'destroy', @remove
    @listenTo @model, 'sync', @render

  events:
    "click .remove-reservation": "deleteReservation"
    "click .edit-reservation": "editReservation"
  
  deleteReservation: (e) ->
    e.preventDefault()
    return unless confirm("Are you sure?")
    @model.destroy()

  editReservation: (e) ->
    e.preventDefault()
    App.Vent.trigger "reservation:edit", @model

  render: ->
    @$el.html(@template(@model.toJSON()))
    @
