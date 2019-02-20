# (C) Uri Wilensky. https://github.com/NetLogo/Tortoise

module.exports.Config =
  class ImportExportConfig
    constructor: ( @exportAllPlots = (-> ->) # (() => String)     => (String) => Unit
                 , @exportFile     = (-> ->) # (String)           => (String) => Unit
                 , @exportOutput   = (->)    #                       (String) => Unit
                 , @exportPlot     = (-> ->) # (String)           => (String) => Unit
                 , @exportView     = (->)    #                       (String) => Unit
                 , @exportWorld    = (-> ->) # (() => String)     => (String) => Unit
                 , @importDrawing  = (-> ->) # (String) => ((String) => Unit) => Unit
                 , @importFile     = (-> ->) # (String) => ((String) => Unit) => Unit
                 ) ->

module.exports.Prims =
  class ImportExportPrims
    # (ImportExportConfig, () => String, () => String, (String) => String, (String) => Unit, (String) => Unit) => ImportExportPrims
    constructor: ({ exportAllPlots, exportFile, @exportOutput, exportPlot, @exportView, exportWorld, importDrawing, importWorld }
                  , exportWorldRaw, exportAllPlotsRaw, exportPlotRaw, @importDrawingRaw, @importWorldRaw) ->
      @exportWorld    = (filename)       -> exportFile(exportWorldRaw()   )(filename)
      @exportAllPlots = (filename)       -> exportFile(exportAllPlotsRaw())(filename)
      @exportPlot     = (plot, filename) -> exportFile(exportPlotRaw(plot))(filename)
      @importDrawing  = (filename)       -> importDrawing(filename)(@importDrawingRaw)
      @importWorld    = (filename)       -> importFile(filename)(@importWorldRaw)
