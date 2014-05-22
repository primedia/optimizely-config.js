'use strict'
define [], ->

  collection = ->
    window.rentPathExperiments ?= load()
    (window.rentPathExperiments || [])

  exists = (versionName) ->
    soVersionRegex = new RegExp(versionName, "i")

    while experiment = collection().pop()
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
