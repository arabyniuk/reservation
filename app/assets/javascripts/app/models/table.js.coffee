class App.Models.Table extends Backbone.Model
  urlRoot: "/tables"

  initialize: ->
    @listenTo @, "change:reservations", @convertReservations

  convertReservations: ->
    @reservations = new App.Collections.Reservations( @get('reservations') )

class App.Collections.Tables extends Backbone.Collection
  model: App.Models.Table
  url: "/tables"

class App.Models.Reservation extends Backbone.Model
  urlRoot: "/reservations"

  validate: (attrs, options) ->
    errors = {}
    unless attrs.start_time
      errors.start_time = ["can't be blank"]
    unless attrs.end_time
      errors.end_time = ["can't be blank"]
    errors unless _.isEmpty errors

class App.Collections.Reservations extends Backbone.Collection
  model: App.Models.Reservation
  url: "/reservations"
    
