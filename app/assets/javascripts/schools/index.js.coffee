$ ->
  window.dataExplorer = null
  window.explorerDiv = $("#explorer")
  dataset = new recline.Model.Dataset(
    url: "/offers.csv"
    backend: "csv"
  )
  createExplorer dataset, null

createExplorer = (dataset, state) ->
  
  # remove existing data explorer view
  reload = false
  if window.dataExplorer
    window.dataExplorer.remove()
    reload = true
  window.dataExplorer = null
  $el = $("<div />")
  $el.appendTo window.explorerDiv
  views = [
    id: "grid"
    label: "Grid"
    view: new recline.View.SlickGrid(model: dataset)
  ,
    id: "graph"
    label: "Graph"
    view: new recline.View.Graph(model: dataset)
  ,
    id: "map"
    label: "Map"
    view: new recline.View.Map(
      model: dataset
      lonField: "lng"
      latField: "lat"
    )
  ,
    id: "transform"
    label: "Transform"
    view: new recline.View.Transform(model: dataset)
  ]
  window.dataExplorer = new recline.View.MultiView(
    model: dataset
    el: $el
    state: state
    views: views
  )