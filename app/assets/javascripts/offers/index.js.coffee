$ ->
  dataset = new recline.Model.Dataset
    url: 'offers.csv'
    backend: 'csv'
    fields: [
      id: 'ranking'
      type: 'integer'
    ,
      id: 'school'
      label: 'School'
    ,
      id: 'offers_count'
      label: 'Count'
    ,
      id: 'city'
      label: 'City'
    ,
      id: 'state'
      label: 'State'
    ,
      id: 'lon'
    ,
      id: 'lat'
    ]
    # records: data
  window.dataset = dataset
  createExplorer dataset

createGrid = (dataset) ->
  console.log 'grid'
  grid = new recline.View.SlickGrid
    model: dataset
    el: $ '#explorer'
  grid.visible = true
  grid.render()
  window.grid = grid

createExplorer = (dataset) ->
  $el = $ '<div />'
  $el.appendTo $ '#explorer'

  views = [
    id: 'grid'
    label: 'Grid'
    view: new recline.View.Grid(model: dataset)
  ,
    id: 'graph'
    label: 'Graph'
    view: new recline.View.Graph(model: dataset)
  ,
    id: 'map'
    label: 'Map'
    view: new recline.View.Map(model: dataset)
  ,
    id: 'transform'
    label: 'Transform'
    view: new recline.View.Transform(model: dataset)
  ]
  window.dataExplorer = new recline.View.MultiView
    model: dataset
    el: $el
    state: null
    views: views
  g = window.dataExplorer.pageViews[0].view
  m = window.dataExplorer.pageViews[2].view
  g.state.set 'hiddenColumns', ['lat', 'lon']
  g.state.set 'fitColumns', true
