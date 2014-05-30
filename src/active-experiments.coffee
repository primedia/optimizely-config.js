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
    experiments = []
    return experiments unless window.optimizely and oState = window.optimizely.data.state

    for mExp in oState.activeExperiments
      experiments.push oState.variationNamesMap[mExp]

    experiments

  exists: exists
