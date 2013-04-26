$ ->
  window.dataExplorer = null
  window.explorerDiv = $ "#explorer"
  dataset = new recline.Model.Dataset
    url: "/offer/index/offer_stat_csv"
    backend: "csv"
    fields: [
      id: "ranking"
      type: "integer"
    ,
      id: "school"
      label: "School"
    ,
      id: "name"
      label: "Student"
    ,
      id: "city"
      label: "City"
    ,
      id: "state"
      label: "State"
    ,
      id: "lon"
    ,
      id: "lat"
    ]
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
    view: new recline.View.Map(model: dataset)
  ,
    id: "transform"
    label: "Transform"
    view: new recline.View.Transform(model: dataset)
  ]
  window.dataExplorer = new recline.View.MultiView
    model: dataset
    el: $el
    state: state
    views: views
  g = window.dataExplorer.pageViews[0].view
  m = window.dataExplorer.pageViews[2].view
  g.state.set "hiddenColumns", ["lat", "lon"]
  g.state.set "fitColumns", true
