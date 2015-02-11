class App.Routers.MainRouter extends Backbone.Router
  
  routes:
    "": "index"
    "reservation": "reservation"
    "table/:id": "showDetails"

  showDetails: (id) ->
    @layoutViews()
    @contentView.swapSide(new App.Views.Tables({ collection: new App.Collections.Tables}))
    m = new App.Models.Table({ id: id })
    @contentView.swapMain( new App.Views.TableDetails({ model: m }))

  initialize: ->
    @headerView = new App.Views.Header()
    @contentView = new App.Views.Content()

  index: ->
    @layoutViews()
    @contentView.swapSide(new App.Views.Menu())
    @contentView.swapMain(new App.Views.Welcome())

  reservation: ->
    @layoutViews()
    @contentView.swapSide(new App.Views.Tables({ collection: new App.Collections.Tables }))
    @contentView.swapMain(new App.Views.Empty())

  layoutViews: ->
    $('#header').html(@headerView.render().el)
    $('#content').html(@contentView.render().el)

