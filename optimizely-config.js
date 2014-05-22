// Generated by CoffeeScript 1.7.1
(function() {
  'use strict';
  define(['./active-experiments'], function(activeExperiments) {
    var activateExperiment, isExperimentActive;
    activateExperiment = function(versionName, callback, callbackArgs) {
      if (activeExperiments.exists(versionName)) {
        return callback.apply(null, callbackArgs);
      }
    };
    isExperimentActive = function(versionName) {
      return activeExperiments.exists(versionName);
    };
    return {
      activateExperiment: activateExperiment,
      isExperimentActive: isExperimentActive
    };
  });

}).call(this);
