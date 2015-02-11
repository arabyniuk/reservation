class App.Views.NewReservation extends Backbone.View

  template: JST['app/templates/new_reservation']

  events:
    "click button": "saveReservation"

  initialize: ->
    @listenTo @model, 'sync', @success
    @listenTo @model, 'invalid', @renderErrors
    @listenTo @model, 'error', @parseErrorResponse

  renderErrors: (model, errors) ->
    _.each errors, @renderError, @

  renderError: (errors, attribute) ->
    err = errors.join "; "
    @$('#' + attribute).closest('div.form-group').addClass('has-error')
    @$('#' + attribute).closest('div.controls').append('<span class=help-inline>' + err + '</span>')

  clearValidationAlert: ->
    @$('#new_reservation').html("")
    @$('.has-error').removeClass('has-error')
    @$('span.help-inline').remove()

  parseErrorResponse: (model, resp) ->
    if resp and resp.responseText
      errors = JSON.parse resp.responseText
      @renderErrors(model, errors.errors)

  success: ->
    @clearForm()
    App.Vent.trigger "reservation:create", @model

  clearForm: ->
    $('#start_time').val("")
    $('#end_time').val("")

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

  saveReservation: (e) ->
    e.preventDefault()
    @clearValidationAlert()
    @model.set start_time: @$('#start_time').val()
    @model.set end_time: @$('#end_time').val()
    @model.save()

