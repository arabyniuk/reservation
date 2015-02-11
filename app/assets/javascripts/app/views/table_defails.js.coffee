class App.Views.TableDetails extends Backbone.View

  template: JST['app/templates/table_details']
  
  initialize: ->
    @childViews = []
    @listenTo @model, "sync", @renderDetails
    @listenTo App.Vent, "reservation:edit", @editReservation
    @model.fetch()
	  
  render: ->
    @$el.html(@template(@model.toJSON()))
    @

  renderDetails: ->
    @$el.html(@template(@model.toJSON()))
    v = new App.Views.Reservations({ collection: @model.reservations })
    @childViews.push(v)
    @$('#reservations').html(v.render().el)

    v1 = new App.Views.NewReservation({ model: new App.Models.Reservation({table_id: @model.id}) })
    @childViews.push(v1)
    @$('#new_reservation').html(v1.render().el)

  editReservation: (model) ->
    v2 = new App.Views.NewReservation({ model: model })
    @$('#new_reservation').html(v2.render().el)
