class App.Views.Header extends Backbone.View
  className: "navbar navbar-default"

  template: JST['app/templates/header']

  render: ->
    @$el.html(@template())
    @
