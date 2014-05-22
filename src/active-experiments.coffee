'use strict'
define [], ->

  collection = ->
    if window.rentPathExperiments and window.rentPathExperiments.length > 0
      window.rentPathExperiments
    else
      window.rentPathExperiments = load()

  exists = (versionName) ->
    soVersionRegex = new RegExp(versionName, "i")
    experiments    = collection()
    for experiment in collection()
      return true if experiment.match soVersionRegex

    false

  load = ->
    return [] unless window.optimizely

    experiments        = []
    optimizelyObj      = window.optimizely
    oData              = optimizelyObj.data

    for mExp in optimizelyObj.data.state.activeExperiments
      experiments.push oData.state.variationNamesMap[mExp]

    experiments

  exists: exists
