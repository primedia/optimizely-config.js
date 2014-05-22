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
    oActiveExperiments = oData.state.activeExperiments
    allExperiments     = optimizelyObj.allExperiments

    for mExp in oActiveExperiments
      if allExperiments[mExp].enabled
        curVar  = oData.state.variationNamesMap[mExp]

        experiments.push curVar

    experiments

  exists: exists
