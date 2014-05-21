optimizelyData = {
  "activeExperiments": [
    "1034813331",
    "1037504207"
  ],
  "allExperiments": {
    "1006191833": {
      "code": "window.globalRun = window.globalRun || false;\nif (!window.globalRun) {\n  window.globalRun=true;\n  \n  var mSite = 'm.AG';\n  window._activeExperiments = [];\n  \n  if (window.optimizely.data.state.activeExperiments && window.optimizely.data.state.activeExperiments.length) {\n    window._activeExperiments = window.optimizely.data.state.activeExperiments;\n    \n    var mCnt = window._activeExperiments.length;\n    var mTest = '';\n    var mVars = '';\n    var mExp = '';\n    var tCount = 0;\n\n    var noTagArray = [\"^hotfix\",\"^preview\",\"^xxx\",\"^notag\"];\n    var regExMatch = noTagArray.join(\"|\");\n    \n    for (var i=0;i<(mCnt);i++) {\n      mExp = window._activeExperiments[i];\n      var curTest = window.optimizely.data.experiments[mExp].name;\n      var curVar = window.optimizely.data.state.variationNamesMap[mExp];\n\n      if (!curTest.match(regExMatch)) { //Eliminate Marked Experiments\n        if (tCount>0) {\n          mTest = mTest + \" : \";\n          mVars = mVars + \" : \";\n        }\n        mTest = mTest + curTest;\n        mVars = mVars + curVar;\n        tCount += 1;\n      }\n    }    \n    //Data Warehouse Meta Tags        \n    mt = $('meta[name=\"WH.ssVariationGroupName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssVariationGroupName\" />').prependTo('head');\n    mt.attr('content', mVars); \n    \n    mt = $('meta[name=\"WH.ssTestName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssTestName\" />').prependTo('head'); \n    mt.attr('content', mTest); \n    \n    var mt = $('meta[name=\"WH.ssSiteName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssSiteName\" />').prependTo('head'); \n    mt.attr('content', mSite); \n  }\n  window._mvtBindings = {\n    \n    getMetaAttr: function(name){ \n      if (name) {    \n        var selector = 'meta[name=\"' + name + '\"]'; \n        var meta = $(selector);\n        if (meta[0]) {\n          var content = meta.attr('content');\n          if (content) {\n            return content;\n          } else {\n            return undefined;\n          }\n        }\n      }\n    },\n    \n    pushTrack: function(tTrack){\n    window.optimizely.push(['trackEvent', tTrack]);\n    }\n\n  };\n\n   $(document).ready(function() {\n    window.optimizely = window.optimizely || [];\n    window.$ = window.$ || $;\n\n    window._sPage = window._mvtBindings.getMetaAttr('WH.cg');\n    // Binding clicks for mvt\n    var tTrack = 'view_' + window._sPage;\n    window._mvtBindings.pushTrack(tTrack);\n\n    window.$('body').ajaxComplete(function(event,xhr,options) {\n      \n      var ajURL = options.url;\n      var rxURL = new RegExp('^\\/v\\\\d\\/leads\\/new');  //Popup Lead Form\n         \n      if (rxURL.test(ajURL)) {\n        window.optimizely.push([\"activate\"]);\n        window._mvtBindings.pushTrack('lead_popup_any');\n      }\n      else {\n        rxURL = new RegExp('^\\/v\\\\d\\/leads\\/ajax\\.js'); //Lead Service Response\n        if (rxURL.test(ajURL)) {\n          window._mvtBindings.pushTrack('lead_submit');\n          if (xhr.status==200) {\n            window._mvtBindings.pushTrack('lead_confirmed');\n          }\n          else if (xhr.status==422) {\n            window._mvtBindings.pushTrack('lead_failed');\n          }\n        }\n      }\n    });\n\n    //Set Goals event handlers for Dynamic Content\n    var uA = navigator.userAgent.toLowerCase(),\n    eventType = \"mousedown\";\n\n    if (uA.match(\"iphone|ipad|ipod\")) {\n    eventType = \"touchstart\";\n    }\n    $(\".lead_submit input\").live(eventType, function() {\n      window.optimizely.push([\"trackEvent\", \"leads:_submit_-_all\"]);\n    });\n  });\n}",
      "name": "FaceOff_Theme",
      "manual": true,
      "enabled": true,
      "ignore": 79,
      "conditions": [
        {
          "type": "code",
          "value": "var currExpArray=[];                                                            //Array of Experiment IDs for CURRENTLY ACTIVE Experiments\nvar optyExpArray = Object.keys(optimizely.allExperiments);                      //array of all experiments in project\nfor (var i = 0; i < optyExpArray.length; i ++) {\nif (typeof(optimizely.allExperiments[optyExpArray[i]].enabled) !== 'undefined')         //check for enabled property\ncurrExpArray.push((optyExpArray)[i]);\n}\n\nvar curExperiment = \"1006191833\";                                                //Get from URL in editor\n\nvar groupName = \"__groupA\";\n\nif (!optimizely[groupName]){\n     var optlyCookie = document.cookie.match(\"optimizelyBuckets=([^;]*)\");\n     var regexMatch = currExpArray.join(\"|\");\n     optimizely[groupName] = (optlyCookie && optlyCookie[1].match(regexMatch)) ? optlyCookie[1].match(regexMatch)[0] : null;\n}\n//groupName now contains ID from expArray list, previous other experiment target code result or it's empty\n//If empty, choose random from currExpArray\n\noptimizely[groupName] = optimizely[groupName] || currExpArray[Math.floor(Math.random()*currExpArray.length)];\n(optimizely[groupName] == curExperiment);\n"
        },
        {
          "not": true,
          "values": [
            "true"
          ],
          "type": "cookies",
          "names": [
            "exclude_so"
          ]
        },
        {
          "values": [
            {
              "match": "regex",
              "value": "m\\.apartmentguide\\.com"
            }
          ],
          "type": "url"
        },
        {
          "only_first_time": true,
          "type": "visitor",
          "value": "all"
        }
      ],
      "enabled_variation_ids": [
        "1021551624",
        "1005725552",
        "1019615654"
      ],
      "google_analytics": {
        "slot": 1
      },
      "variation_weights": {
        "1005725552": 3334,
        "1019615654": 3333,
        "1021551624": 3333
      },
      "variation_ids": [
        "1021551624",
        "1005725552",
        "1019615654"
      ],
      "css": ".soFace .map_btn_box { display:none; }\n.soFace .page_search .result { min-height:0; }\n.soFace .result h3 { padding-left:0px; }\n.soFace .sort_dropdown { top:108px; }\n.soFace #results_count { padding: 42px 0 7px 0; }\n.soFace .result .column1 { margin-top:0; }\n.soFace .result .button_phone {position:relative; left:auto;top:2px;font-size:17px;}\n.soFace .result .button_phone .call_text { display:none; }\n.soFace .page_search .result .padding_box {padding: 10px; }\n.soFace .result .column1 img { height:64px;width:64px; }\n.soFace .result .column2 { left:auto; }\n.soFace .result .coupon_container { height:auto; }\n.soFace .result .details_rate { margin:0 0 5px; }\n.soFace .result .more_info_button { left: auto; top: auto; right: -20px; bottom: -3px; }\n.soFace .result .summary { min-height:65px; }\n.soFace .result #gtp_telco_tab { padding: 9px 0 0 0; position: relative; right: auto; top: auto; }"
    },
    "1026110803": {
      "code": "window.globalRun = window.globalRun || false;\nif (!window.globalRun) {\n  window.globalRun=true;\n  \n  var mSite = 'm.AG';\n  window._activeExperiments = [];\n  \n  if (window.optimizely.data.state.activeExperiments && window.optimizely.data.state.activeExperiments.length) {\n    window._activeExperiments = window.optimizely.data.state.activeExperiments;\n    \n    var mCnt = window._activeExperiments.length;\n    var mTest = '';\n    var mVars = '';\n    var mExp = '';\n    var tCount = 0;\n\n    var noTagArray = [\"^hotfix\",\"^preview\",\"^xxx\",\"^notag\"];\n    var regExMatch = noTagArray.join(\"|\");\n    \n    for (var i=0;i<(mCnt);i++) {\n      mExp = window._activeExperiments[i];\n      var curTest = window.optimizely.data.experiments[mExp].name;\n      var curVar = window.optimizely.data.state.variationNamesMap[mExp];\n\n      if (!curTest.match(regExMatch)) { //Eliminate Marked Experiments\n        if (tCount>0) {\n          mTest = mTest + \" : \";\n          mVars = mVars + \" : \";\n        }\n        mTest = mTest + curTest;\n        mVars = mVars + curVar;\n        tCount += 1;\n      }\n    }    \n    //Data Warehouse Meta Tags        \n    mt = $('meta[name=\"WH.ssVariationGroupName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssVariationGroupName\" />').prependTo('head');\n    mt.attr('content', mVars); \n    \n    mt = $('meta[name=\"WH.ssTestName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssTestName\" />').prependTo('head'); \n    mt.attr('content', mTest); \n    \n    var mt = $('meta[name=\"WH.ssSiteName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssSiteName\" />').prependTo('head'); \n    mt.attr('content', mSite); \n  }\n  window._mvtBindings = {\n    \n    getMetaAttr: function(name){ \n      if (name) {    \n        var selector = 'meta[name=\"' + name + '\"]'; \n        var meta = $(selector);\n        if (meta[0]) {\n          var content = meta.attr('content');\n          if (content) {\n            return content;\n          } else {\n            return undefined;\n          }\n        }\n      }\n    },\n    \n    pushTrack: function(tTrack){\n    window.optimizely.push(['trackEvent', tTrack]);\n    }\n\n  };\n\n   $(document).ready(function() {\n    window.optimizely = window.optimizely || [];\n    window.$ = window.$ || $;\n\n    window._sPage = window._mvtBindings.getMetaAttr('WH.cg');\n    // Binding clicks for mvt\n    var tTrack = 'view_' + window._sPage;\n    window._mvtBindings.pushTrack(tTrack);\n\n    window.$('body').ajaxComplete(function(event,xhr,options) {\n      \n      var ajURL = options.url;\n      var rxURL = new RegExp('^\\/v\\\\d\\/leads\\/new');  //Popup Lead Form\n         \n      if (rxURL.test(ajURL)) {\n        window.optimizely.push([\"activate\"]);\n        window._mvtBindings.pushTrack('lead_popup_any');\n      }\n      else {\n        rxURL = new RegExp('^\\/v\\\\d\\/leads\\/ajax\\.js'); //Lead Service Response\n        if (rxURL.test(ajURL)) {\n          window._mvtBindings.pushTrack('lead_submit');\n          if (xhr.status==200) {\n            window._mvtBindings.pushTrack('lead_confirmed');\n          }\n          else if (xhr.status==422) {\n            window._mvtBindings.pushTrack('lead_failed');\n          }\n        }\n      }\n    });\n\n    //Set Goals event handlers for Dynamic Content\n    var uA = navigator.userAgent.toLowerCase(),\n    eventType = \"mousedown\";\n\n    if (uA.match(\"iphone|ipad|ipod\")) {\n    eventType = \"touchstart\";\n    }\n    $(\".lead_submit input\").live(eventType, function() {\n      window.optimizely.push([\"trackEvent\", \"leads:_submit_-_all\"]);\n    });\n  });\n}",
      "name": "preview_srp_full_width_image",
      "manual": true,
      "ignore": 85,
      "conditions": [
        {
          "type": "code",
          "value": "var currExpArray=[];                                                            //Array of Experiment IDs for CURRENTLY ACTIVE Experiments\nvar optyExpArray = Object.keys(optimizely.allExperiments);                      //array of all experiments in project\nfor (var i = 0; i < optyExpArray.length; i ++) {\nif (typeof(optimizely.allExperiments[optyExpArray[i]].enabled) !== 'undefined')         //check for enabled property\ncurrExpArray.push((optyExpArray)[i]);\n}\n\nvar curExperiment = \"1026110803\";                                                //Get from URL in editor\n\nvar groupName = \"__groupA\";\n\nif (!optimizely[groupName]){\n     var optlyCookie = document.cookie.match(\"optimizelyBuckets=([^;]*)\");\n     var regexMatch = currExpArray.join(\"|\");\n     optimizely[groupName] = (optlyCookie && optlyCookie[1].match(regexMatch)) ? optlyCookie[1].match(regexMatch)[0] : null;\n}\n//groupName now contains ID from expArray list, previous other experiment target code result or it's empty\n//If empty, choose random from currExpArray\n\noptimizely[groupName] = optimizely[groupName] || currExpArray[Math.floor(Math.random()*currExpArray.length)];\n(optimizely[groupName] == curExperiment);\n"
        },
        {
          "not": true,
          "values": [
            "true"
          ],
          "type": "cookies",
          "names": [
            "exclude_so"
          ]
        },
        {
          "values": [
            {
              "match": "regex",
              "value": "m\\.local\\.apartmentguide\\.com"
            }
          ],
          "type": "url"
        },
        {
          "only_first_time": true,
          "type": "visitor",
          "value": "all"
        }
      ],
      "enabled_variation_ids": [
        "1029245302",
        "1026870759"
      ],
      "google_analytics": {
        "slot": 1
      },
      "variation_ids": [
        "1029245302",
        "1026870759"
      ],
      "css": ".fullwidthsrp .result{\n  min-height: 100%;\n}\n\n.fullwidthsrp .result .column1 img{\ndisplay: inline;\nwidth: 100%;\nheight: auto;\nz-index: 0;\n}\n\n.fullwidthsrp .result .column1 {\nmargin-top: -23px;\nwidth: 100%;\nz-index: 0;\npadding: 0px;\noverflow: hidden;\n}\n\n.fullwidthsrp .result .column2 {\nfloat: left;\nwidth: 100%;\nleft: 0px;\nposition: absolute;\nz-index: 7;\nbackground: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(14%,rgba(0,0,0,0.14)), color-stop(32%,rgba(0,0,0,0.3)), color-stop(100%,rgba(0,0,0,0.72))); /* Chrome,Safari4+ */\nbackground: -webkit-linear-gradient(top, rgba(0,0,0,0) 0%,rgba(0,0,0,0.14) 14%,rgba(0,0,0,0.3) 32%,rgba(0,0,0,0.72) 100%); /* Chrome10+,Safari5.1+ */\nbackground: -o-linear-gradient(top, rgba(0,0,0,0) 0%,rgba(0,0,0,0.14) 14%,rgba(0,0,0,0.3) 32%,rgba(0,0,0,0.72) 100%); /* Opera 11.10+ */\nbackground: -ms-linear-gradient(top, rgba(0,0,0,0) 0%,rgba(0,0,0,0.14) 14%,rgba(0,0,0,0.3) 32%,rgba(0,0,0,0.72) 100%); /* IE10+ */\nbackground: linear-gradient(to bottom, rgba(0,0,0,0) 0%,rgba(0,0,0,0.14) 14%,rgba(0,0,0,0.3) 32%,rgba(0,0,0,0.72) 100%); /* W3C */\ncolor: #FFF;\ntop: auto;\nheight: 74px;\nbottom: 32px;\n}\n\n.fullwidthsrp .page_search .result .padding_box, .fullwidthsrp #map_canvas .result .padding_box {\npadding: 0px 0px 32px 0px;\noverflow:hidden;\nheight: inherit!important;\n}\n\n.fullwidthsrp .summary_container .summary{\nposition: relative;\ntop: 41px;\nmargin: 0 5px;\n}\n\n.fullwidthsrp .result h3 {\nfont-size: 16px;\npadding: 0px;\npadding-left: 5px;\nz-index: 8;\nposition: absolute;\ntext-transform: capitalize;\nbottom: 61px;\n}\n\n.fullwidthsrp .result h3 a{\n  text-decoration: none;\n  color: #FFF;\n  font-weight: 300;\n}\n\n.fullwidthsrp .result .button_phone {\ntop: 8px;\nleft: 0px;\nfont-weight: 400;\nfont-size: 13px !important;\nposition: relative;\n}\n\n.fullwidthsrp .result .more_info_button {\nposition: absolute;\ntop: 33px;\nright: auto;\n}\n\n.fullwidthsrp .result .check_availability_button a{\nbackground: none;\nborder: none;\ncolor: #027ac2;\npadding:none;\n}\n\n.fullwidthsrp .result .save_this_srp_listing, .fullwidthsrp .result .delete_saved_property {\nposition: absolute;\nbottom: 8px;\nright: 10px;\ntop: auto;\nz-index: 9999;\n}\n\n.fullwidthsrp .result .summary_container p {\nfont-size: 11px;\ncolor: #FFF;\nmargin: 2px 0 2px;\n}\n\n.fullwidthsrp .result .save_this_srp_listing {\nfont-size: 13px;\n\n}\n\n.fullwidthsrp .result .coupon_container {\nposition: relative;\ntext-align: right;\ntop: -11px;\ncolor: #FFF;\n}\n\n.fullwidthsrp .summary_container .rating {\nposition: absolute;\nleft: 0;\nbottom: 81px;\ncolor: #FFF!important;\n}\n\n.fullwidthsrp .summary_container .details_rate .rating_count{\n  color: #FFF;\n}\n.fullwidthsrp .result .coupon_container .coupon_icon_green{\n  float: none;\n}\n\n.fullwidthsrp .result .coupon_container .coupon_text{\nmargin-top: -14px;\nmargin-right: 17px\n}\n\n.fullwidthsrp .result .hd {\nbottom: auto;\nleft: auto;\ntop: 22px;\n}\n\n.fullwidthsrp #gtp_telco_tab {\nright: 20px!important;\ntop: -9px!important;\nposition: absolute!important;\n}\n\n.fullwidthsrp .tag_spotlight .spotlight_container .result_container .padding_box{\n  margin-top: 10px;\n}\n\n.fullwidthsrp .listings.spotlight{\n  margin-top:20px!important;\n}\n\n.fullwidthsrp .spotlight .result {\nbackground: #FFF;\n}\n\n.fullwidthsrp .spotlight .button_phone {\ncolor: #027ac2;\n}\n\n.fullwidthsrp .spotlight_container .save_this_srp_listing{\ncolor: #027ac2;\nbottom: 4px;\n}\n\n\n/*more info btn*/\n.fullwidthsrp.moreinfo_btn .result .button_phone {\nleft: 47px!important;\n}"
    },
    "1034813331": {
      "code": "window.globalRun = window.globalRun || false;\nif (!window.globalRun) {\n  window.globalRun=true;\n  \n  var mSite = 'm.AG';\n  window._activeExperiments = [];\n  \n  if (window.optimizely.data.state.activeExperiments && window.optimizely.data.state.activeExperiments.length) {\n    window._activeExperiments = window.optimizely.data.state.activeExperiments;\n    \n    var mCnt = window._activeExperiments.length;\n    var mTest = '';\n    var mVars = '';\n    var mExp = '';\n    var tCount = 0;\n\n    var noTagArray = [\"^hotfix\",\"^preview\",\"^xxx\",\"^notag\"];\n    var regExMatch = noTagArray.join(\"|\");\n    \n    for (var i=0;i<(mCnt);i++) {\n      mExp = window._activeExperiments[i];\n      var curTest = window.optimizely.data.experiments[mExp].name;\n      var curVar = window.optimizely.data.state.variationNamesMap[mExp];\n\n      if (!curTest.match(regExMatch)) { //Eliminate Marked Experiments\n        if (tCount>0) {\n          mTest = mTest + \" : \";\n          mVars = mVars + \" : \";\n        }\n        mTest = mTest + curTest;\n        mVars = mVars + curVar;\n        tCount += 1;\n      }\n    }    \n    //Data Warehouse Meta Tags        \n    mt = $('meta[name=\"WH.ssVariationGroupName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssVariationGroupName\" />').prependTo('head');\n    mt.attr('content', mVars); \n    \n    mt = $('meta[name=\"WH.ssTestName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssTestName\" />').prependTo('head'); \n    mt.attr('content', mTest); \n    \n    var mt = $('meta[name=\"WH.ssSiteName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssSiteName\" />').prependTo('head'); \n    mt.attr('content', mSite); \n  }\n  window._mvtBindings = {\n    \n    getMetaAttr: function(name){ \n      if (name) {    \n        var selector = 'meta[name=\"' + name + '\"]'; \n        var meta = $(selector);\n        if (meta[0]) {\n          var content = meta.attr('content');\n          if (content) {\n            return content;\n          } else {\n            return undefined;\n          }\n        }\n      }\n    },\n    \n    pushTrack: function(tTrack){\n    window.optimizely.push(['trackEvent', tTrack]);\n    }\n\n  };\n\n   $(document).ready(function() {\n    window.optimizely = window.optimizely || [];\n    window.$ = window.$ || $;\n\n    window._sPage = window._mvtBindings.getMetaAttr('WH.cg');\n    // Binding clicks for mvt\n    var tTrack = 'view_' + window._sPage;\n    window._mvtBindings.pushTrack(tTrack);\n\n    window.$('body').ajaxComplete(function(event,xhr,options) {\n      \n      var ajURL = options.url;\n      var rxURL = new RegExp('^\\/v\\\\d\\/leads\\/new');  //Popup Lead Form\n         \n      if (rxURL.test(ajURL)) {\n        window.optimizely.push([\"activate\"]);\n        window._mvtBindings.pushTrack('lead_popup_any');\n      }\n      else {\n        rxURL = new RegExp('^\\/v\\\\d\\/leads\\/ajax\\.js'); //Lead Service Response\n        if (rxURL.test(ajURL)) {\n          window._mvtBindings.pushTrack('lead_submit');\n          if (xhr.status==200) {\n            window._mvtBindings.pushTrack('lead_confirmed');\n          }\n          else if (xhr.status==422) {\n            window._mvtBindings.pushTrack('lead_failed');\n          }\n        }\n      }\n    });\n\n    //Set Goals event handlers for Dynamic Content\n    var uA = navigator.userAgent.toLowerCase(),\n    eventType = \"mousedown\";\n\n    if (uA.match(\"iphone|ipad|ipod\")) {\n    eventType = \"touchstart\";\n    }\n    $(\".lead_submit input\").live(eventType, function() {\n      window.optimizely.push([\"trackEvent\", \"leads:_submit_-_all\"]);\n    });\n  });\n}",
      "name": "FaceOff_Theme (local)",
      "manual": true,
      "enabled": true,
      "conditions": [
        {
          "not": true,
          "values": [
            "true"
          ],
          "type": "cookies",
          "names": [
            "exclude_so"
          ]
        },
        {
          "values": [
            {
              "match": "regex",
              "value": "local\\.m\\.apartmentguide\\.com"
            }
          ],
          "type": "url"
        },
        {
          "only_first_time": true,
          "type": "visitor",
          "value": "all"
        }
      ],
      "enabled_variation_ids": [
        "1042656152",
        "1038126963",
        "1043772062"
      ],
      "google_analytics": {
        "slot": 1
      },
      "variation_weights": {
        "1038126963": 3334,
        "1042656152": 3333,
        "1043772062": 3333
      },
      "variation_ids": [
        "1042656152",
        "1038126963",
        "1043772062"
      ],
      "css": ".soFace .map_btn_box { display:none; }\n.soFace .page_search .result { min-height:0; }\n.soFace .result h3 { padding-left:0px; }\n.soFace .sort_dropdown { top:108px; }\n.soFace #results_count { padding: 42px 0 7px 0; }\n.soFace .result .column1 { margin-top:0; }\n.soFace .result .button_phone {position:relative; left:auto;top:2px;font-size:17px;}\n.soFace .result .button_phone .call_text { display:none; }\n.soFace .page_search .result .padding_box {padding: 10px; }\n.soFace .result .column1 img { height:64px;width:64px; }\n.soFace .result .column2 { left:auto; }\n.soFace .result .coupon_container { height:auto; }\n.soFace .result .details_rate { margin:0 0 5px; }\n.soFace .result .more_info_button { left: auto; top: auto; right: -20px; bottom: -3px; }\n.soFace .result .summary { min-height:65px; }\n.soFace .result #gtp_telco_tab { padding: 9px 0 0 0; position: relative; right: auto; top: auto; }"
    },
    "1037504207": {
      "code": "window.globalRun = window.globalRun || false;\nif (!window.globalRun) {\n  window.globalRun=true;\n  \n  var mSite = 'm.AG';\n  window._activeExperiments = [];\n  \n  if (window.optimizely.data.state.activeExperiments && window.optimizely.data.state.activeExperiments.length) {\n    window._activeExperiments = window.optimizely.data.state.activeExperiments;\n    \n    var mCnt = window._activeExperiments.length;\n    var mTest = '';\n    var mVars = '';\n    var mExp = '';\n    var tCount = 0;\n\n    var noTagArray = [\"^hotfix\",\"^preview\",\"^xxx\",\"^notag\"];\n    var regExMatch = noTagArray.join(\"|\");\n    \n    for (var i=0;i<(mCnt);i++) {\n      mExp = window._activeExperiments[i];\n      var curTest = window.optimizely.data.experiments[mExp].name;\n      var curVar = window.optimizely.data.state.variationNamesMap[mExp];\n\n      if (!curTest.match(regExMatch)) { //Eliminate Marked Experiments\n        if (tCount>0) {\n          mTest = mTest + \" : \";\n          mVars = mVars + \" : \";\n        }\n        mTest = mTest + curTest;\n        mVars = mVars + curVar;\n        tCount += 1;\n      }\n    }    \n    //Data Warehouse Meta Tags        \n    mt = $('meta[name=\"WH.ssVariationGroupName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssVariationGroupName\" />').prependTo('head');\n    mt.attr('content', mVars); \n    \n    mt = $('meta[name=\"WH.ssTestName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssTestName\" />').prependTo('head'); \n    mt.attr('content', mTest); \n    \n    var mt = $('meta[name=\"WH.ssSiteName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssSiteName\" />').prependTo('head'); \n    mt.attr('content', mSite); \n  }\n  window._mvtBindings = {\n    \n    getMetaAttr: function(name){ \n      if (name) {    \n        var selector = 'meta[name=\"' + name + '\"]'; \n        var meta = $(selector);\n        if (meta[0]) {\n          var content = meta.attr('content');\n          if (content) {\n            return content;\n          } else {\n            return undefined;\n          }\n        }\n      }\n    },\n    \n    pushTrack: function(tTrack){\n    window.optimizely.push(['trackEvent', tTrack]);\n    }\n\n  };\n\n   $(document).ready(function() {\n    window.optimizely = window.optimizely || [];\n    window.$ = window.$ || $;\n\n    window._sPage = window._mvtBindings.getMetaAttr('WH.cg');\n    // Binding clicks for mvt\n    var tTrack = 'view_' + window._sPage;\n    window._mvtBindings.pushTrack(tTrack);\n\n    window.$('body').ajaxComplete(function(event,xhr,options) {\n      \n      var ajURL = options.url;\n      var rxURL = new RegExp('^\\/v\\\\d\\/leads\\/new');  //Popup Lead Form\n         \n      if (rxURL.test(ajURL)) {\n        window.optimizely.push([\"activate\"]);\n        window._mvtBindings.pushTrack('lead_popup_any');\n      }\n      else {\n        rxURL = new RegExp('^\\/v\\\\d\\/leads\\/ajax\\.js'); //Lead Service Response\n        if (rxURL.test(ajURL)) {\n          window._mvtBindings.pushTrack('lead_submit');\n          if (xhr.status==200) {\n            window._mvtBindings.pushTrack('lead_confirmed');\n          }\n          else if (xhr.status==422) {\n            window._mvtBindings.pushTrack('lead_failed');\n          }\n        }\n      }\n    });\n\n    //Set Goals event handlers for Dynamic Content\n    var uA = navigator.userAgent.toLowerCase(),\n    eventType = \"mousedown\";\n\n    if (uA.match(\"iphone|ipad|ipod\")) {\n    eventType = \"touchstart\";\n    }\n    $(\".lead_submit input\").live(eventType, function() {\n      window.optimizely.push([\"trackEvent\", \"leads:_submit_-_all\"]);\n    });\n  });\n}",
      "name": "srp_full_width_image (local)",
      "manual": true,
      "enabled": true,
      "conditions": [
        {
          "not": true,
          "values": [
            "true"
          ],
          "type": "cookies",
          "names": [
            "exclude_so"
          ]
        },
        {
          "values": [
            {
              "match": "regex",
              "value": "local\\.m\\.apartmentguide\\.com"
            }
          ],
          "type": "url"
        },
        {
          "only_first_time": true,
          "type": "visitor",
          "value": "all"
        }
      ],
      "enabled_variation_ids": [
        "1045273192",
        "1034651365"
      ],
      "google_analytics": {
        "slot": 1
      },
      "variation_weights": {
        "1034651365": 5001,
        "1045273192": 4999
      },
      "variation_ids": [
        "1045273192",
        "1034651365"
      ],
      "css": ".fullwidthsrp .result{\n  min-height: 100%;\n}\n\n.fullwidthsrp .result .column1 {\nmargin-top: -23px;\nwidth: 100%;\nz-index: 0;\npadding: 0px;\noverflow: hidden;\n}\n\n.fullwidthsrp .result .column1 img {\ndisplay: inline-block;\nwidth: 32px;\nheight: 32px;\nz-index: 0;\nmargin: -16px 0 0 -16px;\nposition: relative;\nleft: 50%;\ntop: 52%;\n}\n\n.fullwidthsrp .result .column2 {\nfloat: left;\nwidth: 100%;\nleft: 0px;\nposition: absolute;\nz-index: 7;\nbackground: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(14%,rgba(0,0,0,0.14)), color-stop(32%,rgba(0,0,0,0.3)), color-stop(100%,rgba(0,0,0,0.72))); /* Chrome,Safari4+ */\nbackground: -webkit-linear-gradient(top, rgba(0,0,0,0) 0%,rgba(0,0,0,0.14) 14%,rgba(0,0,0,0.3) 32%,rgba(0,0,0,0.72) 100%); /* Chrome10+,Safari5.1+ */\nbackground: -o-linear-gradient(top, rgba(0,0,0,0) 0%,rgba(0,0,0,0.14) 14%,rgba(0,0,0,0.3) 32%,rgba(0,0,0,0.72) 100%); /* Opera 11.10+ */\nbackground: -ms-linear-gradient(top, rgba(0,0,0,0) 0%,rgba(0,0,0,0.14) 14%,rgba(0,0,0,0.3) 32%,rgba(0,0,0,0.72) 100%); /* IE10+ */\nbackground: linear-gradient(to bottom, rgba(0,0,0,0) 0%,rgba(0,0,0,0.14) 14%,rgba(0,0,0,0.3) 32%,rgba(0,0,0,0.72) 100%); /* W3C */\ncolor: #FFF;\ntop: auto;\nheight: 74px;\nbottom: 32px;\n}\n\n.fullwidthsrp .page_search .result .padding_box, .fullwidthsrp #map_canvas .result .padding_box {\npadding: 0px 0px 32px 0px;\noverflow:hidden;\nmin-height: 100px;\n}\n\n.fullwidthsrp .summary_container .summary{\nposition: relative;\ntop: 41px;\nmargin: 0 5px;\n}\n\n.fullwidthsrp .result h3 {\nfont-size: 16px;\npadding: 0px;\npadding-left: 5px;\nz-index: 8;\nposition: absolute;\ntext-transform: capitalize;\nbottom: 61px;\n}\n\n.fullwidthsrp .result h3 a{\n  text-decoration: none;\n  color: #FFF;\n  font-weight: 300;\n}\n\n.fullwidthsrp .result .button_phone {\ntop: 37px;\nleft: 0px;\nfont-weight: 400;\nfont-size: 13px !important;\nposition: absolute;\n}\n\n.fullwidthsrp .result .more_info_button {\nposition: absolute;\ntop: 33px;\nright: auto;\n}\n\n.fullwidthsrp .result .check_availability_button a{\nbackground: none;\nborder: none;\ncolor: #027ac2;\npadding:none;\n}\n\n.fullwidthsrp .result .save_this_srp_listing, .fullwidthsrp .result .delete_saved_property {\nposition: absolute;\nbottom: 8px;\nright: 10px;\ntop: auto;\nz-index: 9999;\n}\n\n.fullwidthsrp .result .summary_container p {\nfont-size: 11px;\ncolor: #FFF;\nmargin: 2px 0 2px;\n}\n\n.fullwidthsrp .result .save_this_srp_listing {\nfont-size: 13px;\n\n}\n\n.fullwidthsrp .result .coupon_container {\nposition: relative;\ntext-align: right;\ntop: -11px;\ncolor: #FFF;\n}\n\n.fullwidthsrp .summary_container .rating {\nposition: absolute;\nleft: 0;\nbottom: 81px;\ncolor: #FFF!important;\n}\n\n.fullwidthsrp .summary_container .details_rate .rating_count{\n  color: #FFF;\n}\n.fullwidthsrp .result .coupon_container .coupon_icon_green{\n  float: none;\n}\n\n.fullwidthsrp .result .coupon_container .coupon_text{\nmargin-top: -14px;\nmargin-right: 17px\n}\n\n.fullwidthsrp .result .hd {\nbottom: auto;\nleft: auto;\ntop: 22px;\n}\n\n.fullwidthsrp #gtp_telco_tab {\nright: 20px!important;\ntop: -9px!important;\nposition: absolute!important;\n}\n\n.fullwidthsrp .tag_spotlight .spotlight_container .result_container .padding_box{\n  margin-top: 10px;\n}\n\n.fullwidthsrp .listings.spotlight{\n  margin-top:20px!important;\n}\n\n.fullwidthsrp .spotlight .result {\nbackground: #FFF;\n}\n\n.fullwidthsrp .spotlight .button_phone {\ncolor: #027ac2;\n}\n\n.fullwidthsrp .spotlight_container .save_this_srp_listing{\ncolor: #027ac2;\nbottom: 4px;\n}\n\n\n/*more info btn*/\n.fullwidthsrp.moreinfo_btn .result .button_phone {\nleft: 84px!important;\n}"
    }
  },
  "all_experiments": {
    "1006191833": {
      "code": "window.globalRun = window.globalRun || false;\nif (!window.globalRun) {\n  window.globalRun=true;\n  \n  var mSite = 'm.AG';\n  window._activeExperiments = [];\n  \n  if (window.optimizely.data.state.activeExperiments && window.optimizely.data.state.activeExperiments.length) {\n    window._activeExperiments = window.optimizely.data.state.activeExperiments;\n    \n    var mCnt = window._activeExperiments.length;\n    var mTest = '';\n    var mVars = '';\n    var mExp = '';\n    var tCount = 0;\n\n    var noTagArray = [\"^hotfix\",\"^preview\",\"^xxx\",\"^notag\"];\n    var regExMatch = noTagArray.join(\"|\");\n    \n    for (var i=0;i<(mCnt);i++) {\n      mExp = window._activeExperiments[i];\n      var curTest = window.optimizely.data.experiments[mExp].name;\n      var curVar = window.optimizely.data.state.variationNamesMap[mExp];\n\n      if (!curTest.match(regExMatch)) { //Eliminate Marked Experiments\n        if (tCount>0) {\n          mTest = mTest + \" : \";\n          mVars = mVars + \" : \";\n        }\n        mTest = mTest + curTest;\n        mVars = mVars + curVar;\n        tCount += 1;\n      }\n    }    \n    //Data Warehouse Meta Tags        \n    mt = $('meta[name=\"WH.ssVariationGroupName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssVariationGroupName\" />').prependTo('head');\n    mt.attr('content', mVars); \n    \n    mt = $('meta[name=\"WH.ssTestName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssTestName\" />').prependTo('head'); \n    mt.attr('content', mTest); \n    \n    var mt = $('meta[name=\"WH.ssSiteName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssSiteName\" />').prependTo('head'); \n    mt.attr('content', mSite); \n  }\n  window._mvtBindings = {\n    \n    getMetaAttr: function(name){ \n      if (name) {    \n        var selector = 'meta[name=\"' + name + '\"]'; \n        var meta = $(selector);\n        if (meta[0]) {\n          var content = meta.attr('content');\n          if (content) {\n            return content;\n          } else {\n            return undefined;\n          }\n        }\n      }\n    },\n    \n    pushTrack: function(tTrack){\n    window.optimizely.push(['trackEvent', tTrack]);\n    }\n\n  };\n\n   $(document).ready(function() {\n    window.optimizely = window.optimizely || [];\n    window.$ = window.$ || $;\n\n    window._sPage = window._mvtBindings.getMetaAttr('WH.cg');\n    // Binding clicks for mvt\n    var tTrack = 'view_' + window._sPage;\n    window._mvtBindings.pushTrack(tTrack);\n\n    window.$('body').ajaxComplete(function(event,xhr,options) {\n      \n      var ajURL = options.url;\n      var rxURL = new RegExp('^\\/v\\\\d\\/leads\\/new');  //Popup Lead Form\n         \n      if (rxURL.test(ajURL)) {\n        window.optimizely.push([\"activate\"]);\n        window._mvtBindings.pushTrack('lead_popup_any');\n      }\n      else {\n        rxURL = new RegExp('^\\/v\\\\d\\/leads\\/ajax\\.js'); //Lead Service Response\n        if (rxURL.test(ajURL)) {\n          window._mvtBindings.pushTrack('lead_submit');\n          if (xhr.status==200) {\n            window._mvtBindings.pushTrack('lead_confirmed');\n          }\n          else if (xhr.status==422) {\n            window._mvtBindings.pushTrack('lead_failed');\n          }\n        }\n      }\n    });\n\n    //Set Goals event handlers for Dynamic Content\n    var uA = navigator.userAgent.toLowerCase(),\n    eventType = \"mousedown\";\n\n    if (uA.match(\"iphone|ipad|ipod\")) {\n    eventType = \"touchstart\";\n    }\n    $(\".lead_submit input\").live(eventType, function() {\n      window.optimizely.push([\"trackEvent\", \"leads:_submit_-_all\"]);\n    });\n  });\n}",
      "name": "FaceOff_Theme",
      "manual": true,
      "enabled": true,
      "ignore": 79,
      "conditions": [
        {
          "type": "code",
          "value": "var currExpArray=[];                                                            //Array of Experiment IDs for CURRENTLY ACTIVE Experiments\nvar optyExpArray = Object.keys(optimizely.allExperiments);                      //array of all experiments in project\nfor (var i = 0; i < optyExpArray.length; i ++) {\nif (typeof(optimizely.allExperiments[optyExpArray[i]].enabled) !== 'undefined')         //check for enabled property\ncurrExpArray.push((optyExpArray)[i]);\n}\n\nvar curExperiment = \"1006191833\";                                                //Get from URL in editor\n\nvar groupName = \"__groupA\";\n\nif (!optimizely[groupName]){\n     var optlyCookie = document.cookie.match(\"optimizelyBuckets=([^;]*)\");\n     var regexMatch = currExpArray.join(\"|\");\n     optimizely[groupName] = (optlyCookie && optlyCookie[1].match(regexMatch)) ? optlyCookie[1].match(regexMatch)[0] : null;\n}\n//groupName now contains ID from expArray list, previous other experiment target code result or it's empty\n//If empty, choose random from currExpArray\n\noptimizely[groupName] = optimizely[groupName] || currExpArray[Math.floor(Math.random()*currExpArray.length)];\n(optimizely[groupName] == curExperiment);\n"
        },
        {
          "not": true,
          "values": [
            "true"
          ],
          "type": "cookies",
          "names": [
            "exclude_so"
          ]
        },
        {
          "values": [
            {
              "match": "regex",
              "value": "m\\.apartmentguide\\.com"
            }
          ],
          "type": "url"
        },
        {
          "only_first_time": true,
          "type": "visitor",
          "value": "all"
        }
      ],
      "enabled_variation_ids": [
        "1021551624",
        "1005725552",
        "1019615654"
      ],
      "google_analytics": {
        "slot": 1
      },
      "variation_weights": {
        "1005725552": 3334,
        "1019615654": 3333,
        "1021551624": 3333
      },
      "variation_ids": [
        "1021551624",
        "1005725552",
        "1019615654"
      ],
      "css": ".soFace .map_btn_box { display:none; }\n.soFace .page_search .result { min-height:0; }\n.soFace .result h3 { padding-left:0px; }\n.soFace .sort_dropdown { top:108px; }\n.soFace #results_count { padding: 42px 0 7px 0; }\n.soFace .result .column1 { margin-top:0; }\n.soFace .result .button_phone {position:relative; left:auto;top:2px;font-size:17px;}\n.soFace .result .button_phone .call_text { display:none; }\n.soFace .page_search .result .padding_box {padding: 10px; }\n.soFace .result .column1 img { height:64px;width:64px; }\n.soFace .result .column2 { left:auto; }\n.soFace .result .coupon_container { height:auto; }\n.soFace .result .details_rate { margin:0 0 5px; }\n.soFace .result .more_info_button { left: auto; top: auto; right: -20px; bottom: -3px; }\n.soFace .result .summary { min-height:65px; }\n.soFace .result #gtp_telco_tab { padding: 9px 0 0 0; position: relative; right: auto; top: auto; }"
    },
    "1026110803": {
      "code": "window.globalRun = window.globalRun || false;\nif (!window.globalRun) {\n  window.globalRun=true;\n  \n  var mSite = 'm.AG';\n  window._activeExperiments = [];\n  \n  if (window.optimizely.data.state.activeExperiments && window.optimizely.data.state.activeExperiments.length) {\n    window._activeExperiments = window.optimizely.data.state.activeExperiments;\n    \n    var mCnt = window._activeExperiments.length;\n    var mTest = '';\n    var mVars = '';\n    var mExp = '';\n    var tCount = 0;\n\n    var noTagArray = [\"^hotfix\",\"^preview\",\"^xxx\",\"^notag\"];\n    var regExMatch = noTagArray.join(\"|\");\n    \n    for (var i=0;i<(mCnt);i++) {\n      mExp = window._activeExperiments[i];\n      var curTest = window.optimizely.data.experiments[mExp].name;\n      var curVar = window.optimizely.data.state.variationNamesMap[mExp];\n\n      if (!curTest.match(regExMatch)) { //Eliminate Marked Experiments\n        if (tCount>0) {\n          mTest = mTest + \" : \";\n          mVars = mVars + \" : \";\n        }\n        mTest = mTest + curTest;\n        mVars = mVars + curVar;\n        tCount += 1;\n      }\n    }    \n    //Data Warehouse Meta Tags        \n    mt = $('meta[name=\"WH.ssVariationGroupName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssVariationGroupName\" />').prependTo('head');\n    mt.attr('content', mVars); \n    \n    mt = $('meta[name=\"WH.ssTestName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssTestName\" />').prependTo('head'); \n    mt.attr('content', mTest); \n    \n    var mt = $('meta[name=\"WH.ssSiteName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssSiteName\" />').prependTo('head'); \n    mt.attr('content', mSite); \n  }\n  window._mvtBindings = {\n    \n    getMetaAttr: function(name){ \n      if (name) {    \n        var selector = 'meta[name=\"' + name + '\"]'; \n        var meta = $(selector);\n        if (meta[0]) {\n          var content = meta.attr('content');\n          if (content) {\n            return content;\n          } else {\n            return undefined;\n          }\n        }\n      }\n    },\n    \n    pushTrack: function(tTrack){\n    window.optimizely.push(['trackEvent', tTrack]);\n    }\n\n  };\n\n   $(document).ready(function() {\n    window.optimizely = window.optimizely || [];\n    window.$ = window.$ || $;\n\n    window._sPage = window._mvtBindings.getMetaAttr('WH.cg');\n    // Binding clicks for mvt\n    var tTrack = 'view_' + window._sPage;\n    window._mvtBindings.pushTrack(tTrack);\n\n    window.$('body').ajaxComplete(function(event,xhr,options) {\n      \n      var ajURL = options.url;\n      var rxURL = new RegExp('^\\/v\\\\d\\/leads\\/new');  //Popup Lead Form\n         \n      if (rxURL.test(ajURL)) {\n        window.optimizely.push([\"activate\"]);\n        window._mvtBindings.pushTrack('lead_popup_any');\n      }\n      else {\n        rxURL = new RegExp('^\\/v\\\\d\\/leads\\/ajax\\.js'); //Lead Service Response\n        if (rxURL.test(ajURL)) {\n          window._mvtBindings.pushTrack('lead_submit');\n          if (xhr.status==200) {\n            window._mvtBindings.pushTrack('lead_confirmed');\n          }\n          else if (xhr.status==422) {\n            window._mvtBindings.pushTrack('lead_failed');\n          }\n        }\n      }\n    });\n\n    //Set Goals event handlers for Dynamic Content\n    var uA = navigator.userAgent.toLowerCase(),\n    eventType = \"mousedown\";\n\n    if (uA.match(\"iphone|ipad|ipod\")) {\n    eventType = \"touchstart\";\n    }\n    $(\".lead_submit input\").live(eventType, function() {\n      window.optimizely.push([\"trackEvent\", \"leads:_submit_-_all\"]);\n    });\n  });\n}",
      "name": "preview_srp_full_width_image",
      "manual": true,
      "ignore": 85,
      "conditions": [
        {
          "type": "code",
          "value": "var currExpArray=[];                                                            //Array of Experiment IDs for CURRENTLY ACTIVE Experiments\nvar optyExpArray = Object.keys(optimizely.allExperiments);                      //array of all experiments in project\nfor (var i = 0; i < optyExpArray.length; i ++) {\nif (typeof(optimizely.allExperiments[optyExpArray[i]].enabled) !== 'undefined')         //check for enabled property\ncurrExpArray.push((optyExpArray)[i]);\n}\n\nvar curExperiment = \"1026110803\";                                                //Get from URL in editor\n\nvar groupName = \"__groupA\";\n\nif (!optimizely[groupName]){\n     var optlyCookie = document.cookie.match(\"optimizelyBuckets=([^;]*)\");\n     var regexMatch = currExpArray.join(\"|\");\n     optimizely[groupName] = (optlyCookie && optlyCookie[1].match(regexMatch)) ? optlyCookie[1].match(regexMatch)[0] : null;\n}\n//groupName now contains ID from expArray list, previous other experiment target code result or it's empty\n//If empty, choose random from currExpArray\n\noptimizely[groupName] = optimizely[groupName] || currExpArray[Math.floor(Math.random()*currExpArray.length)];\n(optimizely[groupName] == curExperiment);\n"
        },
        {
          "not": true,
          "values": [
            "true"
          ],
          "type": "cookies",
          "names": [
            "exclude_so"
          ]
        },
        {
          "values": [
            {
              "match": "regex",
              "value": "m\\.local\\.apartmentguide\\.com"
            }
          ],
          "type": "url"
        },
        {
          "only_first_time": true,
          "type": "visitor",
          "value": "all"
        }
      ],
      "enabled_variation_ids": [
        "1029245302",
        "1026870759"
      ],
      "google_analytics": {
        "slot": 1
      },
      "variation_ids": [
        "1029245302",
        "1026870759"
      ],
      "css": ".fullwidthsrp .result{\n  min-height: 100%;\n}\n\n.fullwidthsrp .result .column1 img{\ndisplay: inline;\nwidth: 100%;\nheight: auto;\nz-index: 0;\n}\n\n.fullwidthsrp .result .column1 {\nmargin-top: -23px;\nwidth: 100%;\nz-index: 0;\npadding: 0px;\noverflow: hidden;\n}\n\n.fullwidthsrp .result .column2 {\nfloat: left;\nwidth: 100%;\nleft: 0px;\nposition: absolute;\nz-index: 7;\nbackground: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(14%,rgba(0,0,0,0.14)), color-stop(32%,rgba(0,0,0,0.3)), color-stop(100%,rgba(0,0,0,0.72))); /* Chrome,Safari4+ */\nbackground: -webkit-linear-gradient(top, rgba(0,0,0,0) 0%,rgba(0,0,0,0.14) 14%,rgba(0,0,0,0.3) 32%,rgba(0,0,0,0.72) 100%); /* Chrome10+,Safari5.1+ */\nbackground: -o-linear-gradient(top, rgba(0,0,0,0) 0%,rgba(0,0,0,0.14) 14%,rgba(0,0,0,0.3) 32%,rgba(0,0,0,0.72) 100%); /* Opera 11.10+ */\nbackground: -ms-linear-gradient(top, rgba(0,0,0,0) 0%,rgba(0,0,0,0.14) 14%,rgba(0,0,0,0.3) 32%,rgba(0,0,0,0.72) 100%); /* IE10+ */\nbackground: linear-gradient(to bottom, rgba(0,0,0,0) 0%,rgba(0,0,0,0.14) 14%,rgba(0,0,0,0.3) 32%,rgba(0,0,0,0.72) 100%); /* W3C */\ncolor: #FFF;\ntop: auto;\nheight: 74px;\nbottom: 32px;\n}\n\n.fullwidthsrp .page_search .result .padding_box, .fullwidthsrp #map_canvas .result .padding_box {\npadding: 0px 0px 32px 0px;\noverflow:hidden;\nheight: inherit!important;\n}\n\n.fullwidthsrp .summary_container .summary{\nposition: relative;\ntop: 41px;\nmargin: 0 5px;\n}\n\n.fullwidthsrp .result h3 {\nfont-size: 16px;\npadding: 0px;\npadding-left: 5px;\nz-index: 8;\nposition: absolute;\ntext-transform: capitalize;\nbottom: 61px;\n}\n\n.fullwidthsrp .result h3 a{\n  text-decoration: none;\n  color: #FFF;\n  font-weight: 300;\n}\n\n.fullwidthsrp .result .button_phone {\ntop: 8px;\nleft: 0px;\nfont-weight: 400;\nfont-size: 13px !important;\nposition: relative;\n}\n\n.fullwidthsrp .result .more_info_button {\nposition: absolute;\ntop: 33px;\nright: auto;\n}\n\n.fullwidthsrp .result .check_availability_button a{\nbackground: none;\nborder: none;\ncolor: #027ac2;\npadding:none;\n}\n\n.fullwidthsrp .result .save_this_srp_listing, .fullwidthsrp .result .delete_saved_property {\nposition: absolute;\nbottom: 8px;\nright: 10px;\ntop: auto;\nz-index: 9999;\n}\n\n.fullwidthsrp .result .summary_container p {\nfont-size: 11px;\ncolor: #FFF;\nmargin: 2px 0 2px;\n}\n\n.fullwidthsrp .result .save_this_srp_listing {\nfont-size: 13px;\n\n}\n\n.fullwidthsrp .result .coupon_container {\nposition: relative;\ntext-align: right;\ntop: -11px;\ncolor: #FFF;\n}\n\n.fullwidthsrp .summary_container .rating {\nposition: absolute;\nleft: 0;\nbottom: 81px;\ncolor: #FFF!important;\n}\n\n.fullwidthsrp .summary_container .details_rate .rating_count{\n  color: #FFF;\n}\n.fullwidthsrp .result .coupon_container .coupon_icon_green{\n  float: none;\n}\n\n.fullwidthsrp .result .coupon_container .coupon_text{\nmargin-top: -14px;\nmargin-right: 17px\n}\n\n.fullwidthsrp .result .hd {\nbottom: auto;\nleft: auto;\ntop: 22px;\n}\n\n.fullwidthsrp #gtp_telco_tab {\nright: 20px!important;\ntop: -9px!important;\nposition: absolute!important;\n}\n\n.fullwidthsrp .tag_spotlight .spotlight_container .result_container .padding_box{\n  margin-top: 10px;\n}\n\n.fullwidthsrp .listings.spotlight{\n  margin-top:20px!important;\n}\n\n.fullwidthsrp .spotlight .result {\nbackground: #FFF;\n}\n\n.fullwidthsrp .spotlight .button_phone {\ncolor: #027ac2;\n}\n\n.fullwidthsrp .spotlight_container .save_this_srp_listing{\ncolor: #027ac2;\nbottom: 4px;\n}\n\n\n/*more info btn*/\n.fullwidthsrp.moreinfo_btn .result .button_phone {\nleft: 47px!important;\n}"
    },
    "1034813331": {
      "code": "window.globalRun = window.globalRun || false;\nif (!window.globalRun) {\n  window.globalRun=true;\n  \n  var mSite = 'm.AG';\n  window._activeExperiments = [];\n  \n  if (window.optimizely.data.state.activeExperiments && window.optimizely.data.state.activeExperiments.length) {\n    window._activeExperiments = window.optimizely.data.state.activeExperiments;\n    \n    var mCnt = window._activeExperiments.length;\n    var mTest = '';\n    var mVars = '';\n    var mExp = '';\n    var tCount = 0;\n\n    var noTagArray = [\"^hotfix\",\"^preview\",\"^xxx\",\"^notag\"];\n    var regExMatch = noTagArray.join(\"|\");\n    \n    for (var i=0;i<(mCnt);i++) {\n      mExp = window._activeExperiments[i];\n      var curTest = window.optimizely.data.experiments[mExp].name;\n      var curVar = window.optimizely.data.state.variationNamesMap[mExp];\n\n      if (!curTest.match(regExMatch)) { //Eliminate Marked Experiments\n        if (tCount>0) {\n          mTest = mTest + \" : \";\n          mVars = mVars + \" : \";\n        }\n        mTest = mTest + curTest;\n        mVars = mVars + curVar;\n        tCount += 1;\n      }\n    }    \n    //Data Warehouse Meta Tags        \n    mt = $('meta[name=\"WH.ssVariationGroupName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssVariationGroupName\" />').prependTo('head');\n    mt.attr('content', mVars); \n    \n    mt = $('meta[name=\"WH.ssTestName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssTestName\" />').prependTo('head'); \n    mt.attr('content', mTest); \n    \n    var mt = $('meta[name=\"WH.ssSiteName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssSiteName\" />').prependTo('head'); \n    mt.attr('content', mSite); \n  }\n  window._mvtBindings = {\n    \n    getMetaAttr: function(name){ \n      if (name) {    \n        var selector = 'meta[name=\"' + name + '\"]'; \n        var meta = $(selector);\n        if (meta[0]) {\n          var content = meta.attr('content');\n          if (content) {\n            return content;\n          } else {\n            return undefined;\n          }\n        }\n      }\n    },\n    \n    pushTrack: function(tTrack){\n    window.optimizely.push(['trackEvent', tTrack]);\n    }\n\n  };\n\n   $(document).ready(function() {\n    window.optimizely = window.optimizely || [];\n    window.$ = window.$ || $;\n\n    window._sPage = window._mvtBindings.getMetaAttr('WH.cg');\n    // Binding clicks for mvt\n    var tTrack = 'view_' + window._sPage;\n    window._mvtBindings.pushTrack(tTrack);\n\n    window.$('body').ajaxComplete(function(event,xhr,options) {\n      \n      var ajURL = options.url;\n      var rxURL = new RegExp('^\\/v\\\\d\\/leads\\/new');  //Popup Lead Form\n         \n      if (rxURL.test(ajURL)) {\n        window.optimizely.push([\"activate\"]);\n        window._mvtBindings.pushTrack('lead_popup_any');\n      }\n      else {\n        rxURL = new RegExp('^\\/v\\\\d\\/leads\\/ajax\\.js'); //Lead Service Response\n        if (rxURL.test(ajURL)) {\n          window._mvtBindings.pushTrack('lead_submit');\n          if (xhr.status==200) {\n            window._mvtBindings.pushTrack('lead_confirmed');\n          }\n          else if (xhr.status==422) {\n            window._mvtBindings.pushTrack('lead_failed');\n          }\n        }\n      }\n    });\n\n    //Set Goals event handlers for Dynamic Content\n    var uA = navigator.userAgent.toLowerCase(),\n    eventType = \"mousedown\";\n\n    if (uA.match(\"iphone|ipad|ipod\")) {\n    eventType = \"touchstart\";\n    }\n    $(\".lead_submit input\").live(eventType, function() {\n      window.optimizely.push([\"trackEvent\", \"leads:_submit_-_all\"]);\n    });\n  });\n}",
      "name": "FaceOff_Theme (local)",
      "manual": true,
      "enabled": true,
      "conditions": [
        {
          "not": true,
          "values": [
            "true"
          ],
          "type": "cookies",
          "names": [
            "exclude_so"
          ]
        },
        {
          "values": [
            {
              "match": "regex",
              "value": "local\\.m\\.apartmentguide\\.com"
            }
          ],
          "type": "url"
        },
        {
          "only_first_time": true,
          "type": "visitor",
          "value": "all"
        }
      ],
      "enabled_variation_ids": [
        "1042656152",
        "1038126963",
        "1043772062"
      ],
      "google_analytics": {
        "slot": 1
      },
      "variation_weights": {
        "1038126963": 3334,
        "1042656152": 3333,
        "1043772062": 3333
      },
      "variation_ids": [
        "1042656152",
        "1038126963",
        "1043772062"
      ],
      "css": ".soFace .map_btn_box { display:none; }\n.soFace .page_search .result { min-height:0; }\n.soFace .result h3 { padding-left:0px; }\n.soFace .sort_dropdown { top:108px; }\n.soFace #results_count { padding: 42px 0 7px 0; }\n.soFace .result .column1 { margin-top:0; }\n.soFace .result .button_phone {position:relative; left:auto;top:2px;font-size:17px;}\n.soFace .result .button_phone .call_text { display:none; }\n.soFace .page_search .result .padding_box {padding: 10px; }\n.soFace .result .column1 img { height:64px;width:64px; }\n.soFace .result .column2 { left:auto; }\n.soFace .result .coupon_container { height:auto; }\n.soFace .result .details_rate { margin:0 0 5px; }\n.soFace .result .more_info_button { left: auto; top: auto; right: -20px; bottom: -3px; }\n.soFace .result .summary { min-height:65px; }\n.soFace .result #gtp_telco_tab { padding: 9px 0 0 0; position: relative; right: auto; top: auto; }"
    },
    "1037504207": {
      "code": "window.globalRun = window.globalRun || false;\nif (!window.globalRun) {\n  window.globalRun=true;\n  \n  var mSite = 'm.AG';\n  window._activeExperiments = [];\n  \n  if (window.optimizely.data.state.activeExperiments && window.optimizely.data.state.activeExperiments.length) {\n    window._activeExperiments = window.optimizely.data.state.activeExperiments;\n    \n    var mCnt = window._activeExperiments.length;\n    var mTest = '';\n    var mVars = '';\n    var mExp = '';\n    var tCount = 0;\n\n    var noTagArray = [\"^hotfix\",\"^preview\",\"^xxx\",\"^notag\"];\n    var regExMatch = noTagArray.join(\"|\");\n    \n    for (var i=0;i<(mCnt);i++) {\n      mExp = window._activeExperiments[i];\n      var curTest = window.optimizely.data.experiments[mExp].name;\n      var curVar = window.optimizely.data.state.variationNamesMap[mExp];\n\n      if (!curTest.match(regExMatch)) { //Eliminate Marked Experiments\n        if (tCount>0) {\n          mTest = mTest + \" : \";\n          mVars = mVars + \" : \";\n        }\n        mTest = mTest + curTest;\n        mVars = mVars + curVar;\n        tCount += 1;\n      }\n    }    \n    //Data Warehouse Meta Tags        \n    mt = $('meta[name=\"WH.ssVariationGroupName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssVariationGroupName\" />').prependTo('head');\n    mt.attr('content', mVars); \n    \n    mt = $('meta[name=\"WH.ssTestName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssTestName\" />').prependTo('head'); \n    mt.attr('content', mTest); \n    \n    var mt = $('meta[name=\"WH.ssSiteName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssSiteName\" />').prependTo('head'); \n    mt.attr('content', mSite); \n  }\n  window._mvtBindings = {\n    \n    getMetaAttr: function(name){ \n      if (name) {    \n        var selector = 'meta[name=\"' + name + '\"]'; \n        var meta = $(selector);\n        if (meta[0]) {\n          var content = meta.attr('content');\n          if (content) {\n            return content;\n          } else {\n            return undefined;\n          }\n        }\n      }\n    },\n    \n    pushTrack: function(tTrack){\n    window.optimizely.push(['trackEvent', tTrack]);\n    }\n\n  };\n\n   $(document).ready(function() {\n    window.optimizely = window.optimizely || [];\n    window.$ = window.$ || $;\n\n    window._sPage = window._mvtBindings.getMetaAttr('WH.cg');\n    // Binding clicks for mvt\n    var tTrack = 'view_' + window._sPage;\n    window._mvtBindings.pushTrack(tTrack);\n\n    window.$('body').ajaxComplete(function(event,xhr,options) {\n      \n      var ajURL = options.url;\n      var rxURL = new RegExp('^\\/v\\\\d\\/leads\\/new');  //Popup Lead Form\n         \n      if (rxURL.test(ajURL)) {\n        window.optimizely.push([\"activate\"]);\n        window._mvtBindings.pushTrack('lead_popup_any');\n      }\n      else {\n        rxURL = new RegExp('^\\/v\\\\d\\/leads\\/ajax\\.js'); //Lead Service Response\n        if (rxURL.test(ajURL)) {\n          window._mvtBindings.pushTrack('lead_submit');\n          if (xhr.status==200) {\n            window._mvtBindings.pushTrack('lead_confirmed');\n          }\n          else if (xhr.status==422) {\n            window._mvtBindings.pushTrack('lead_failed');\n          }\n        }\n      }\n    });\n\n    //Set Goals event handlers for Dynamic Content\n    var uA = navigator.userAgent.toLowerCase(),\n    eventType = \"mousedown\";\n\n    if (uA.match(\"iphone|ipad|ipod\")) {\n    eventType = \"touchstart\";\n    }\n    $(\".lead_submit input\").live(eventType, function() {\n      window.optimizely.push([\"trackEvent\", \"leads:_submit_-_all\"]);\n    });\n  });\n}",
      "name": "srp_full_width_image (local)",
      "manual": true,
      "enabled": true,
      "conditions": [
        {
          "not": true,
          "values": [
            "true"
          ],
          "type": "cookies",
          "names": [
            "exclude_so"
          ]
        },
        {
          "values": [
            {
              "match": "regex",
              "value": "local\\.m\\.apartmentguide\\.com"
            }
          ],
          "type": "url"
        },
        {
          "only_first_time": true,
          "type": "visitor",
          "value": "all"
        }
      ],
      "enabled_variation_ids": [
        "1045273192",
        "1034651365"
      ],
      "google_analytics": {
        "slot": 1
      },
      "variation_weights": {
        "1034651365": 5001,
        "1045273192": 4999
      },
      "variation_ids": [
        "1045273192",
        "1034651365"
      ],
      "css": ".fullwidthsrp .result{\n  min-height: 100%;\n}\n\n.fullwidthsrp .result .column1 {\nmargin-top: -23px;\nwidth: 100%;\nz-index: 0;\npadding: 0px;\noverflow: hidden;\n}\n\n.fullwidthsrp .result .column1 img {\ndisplay: inline-block;\nwidth: 32px;\nheight: 32px;\nz-index: 0;\nmargin: -16px 0 0 -16px;\nposition: relative;\nleft: 50%;\ntop: 52%;\n}\n\n.fullwidthsrp .result .column2 {\nfloat: left;\nwidth: 100%;\nleft: 0px;\nposition: absolute;\nz-index: 7;\nbackground: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(14%,rgba(0,0,0,0.14)), color-stop(32%,rgba(0,0,0,0.3)), color-stop(100%,rgba(0,0,0,0.72))); /* Chrome,Safari4+ */\nbackground: -webkit-linear-gradient(top, rgba(0,0,0,0) 0%,rgba(0,0,0,0.14) 14%,rgba(0,0,0,0.3) 32%,rgba(0,0,0,0.72) 100%); /* Chrome10+,Safari5.1+ */\nbackground: -o-linear-gradient(top, rgba(0,0,0,0) 0%,rgba(0,0,0,0.14) 14%,rgba(0,0,0,0.3) 32%,rgba(0,0,0,0.72) 100%); /* Opera 11.10+ */\nbackground: -ms-linear-gradient(top, rgba(0,0,0,0) 0%,rgba(0,0,0,0.14) 14%,rgba(0,0,0,0.3) 32%,rgba(0,0,0,0.72) 100%); /* IE10+ */\nbackground: linear-gradient(to bottom, rgba(0,0,0,0) 0%,rgba(0,0,0,0.14) 14%,rgba(0,0,0,0.3) 32%,rgba(0,0,0,0.72) 100%); /* W3C */\ncolor: #FFF;\ntop: auto;\nheight: 74px;\nbottom: 32px;\n}\n\n.fullwidthsrp .page_search .result .padding_box, .fullwidthsrp #map_canvas .result .padding_box {\npadding: 0px 0px 32px 0px;\noverflow:hidden;\nmin-height: 100px;\n}\n\n.fullwidthsrp .summary_container .summary{\nposition: relative;\ntop: 41px;\nmargin: 0 5px;\n}\n\n.fullwidthsrp .result h3 {\nfont-size: 16px;\npadding: 0px;\npadding-left: 5px;\nz-index: 8;\nposition: absolute;\ntext-transform: capitalize;\nbottom: 61px;\n}\n\n.fullwidthsrp .result h3 a{\n  text-decoration: none;\n  color: #FFF;\n  font-weight: 300;\n}\n\n.fullwidthsrp .result .button_phone {\ntop: 37px;\nleft: 0px;\nfont-weight: 400;\nfont-size: 13px !important;\nposition: absolute;\n}\n\n.fullwidthsrp .result .more_info_button {\nposition: absolute;\ntop: 33px;\nright: auto;\n}\n\n.fullwidthsrp .result .check_availability_button a{\nbackground: none;\nborder: none;\ncolor: #027ac2;\npadding:none;\n}\n\n.fullwidthsrp .result .save_this_srp_listing, .fullwidthsrp .result .delete_saved_property {\nposition: absolute;\nbottom: 8px;\nright: 10px;\ntop: auto;\nz-index: 9999;\n}\n\n.fullwidthsrp .result .summary_container p {\nfont-size: 11px;\ncolor: #FFF;\nmargin: 2px 0 2px;\n}\n\n.fullwidthsrp .result .save_this_srp_listing {\nfont-size: 13px;\n\n}\n\n.fullwidthsrp .result .coupon_container {\nposition: relative;\ntext-align: right;\ntop: -11px;\ncolor: #FFF;\n}\n\n.fullwidthsrp .summary_container .rating {\nposition: absolute;\nleft: 0;\nbottom: 81px;\ncolor: #FFF!important;\n}\n\n.fullwidthsrp .summary_container .details_rate .rating_count{\n  color: #FFF;\n}\n.fullwidthsrp .result .coupon_container .coupon_icon_green{\n  float: none;\n}\n\n.fullwidthsrp .result .coupon_container .coupon_text{\nmargin-top: -14px;\nmargin-right: 17px\n}\n\n.fullwidthsrp .result .hd {\nbottom: auto;\nleft: auto;\ntop: 22px;\n}\n\n.fullwidthsrp #gtp_telco_tab {\nright: 20px!important;\ntop: -9px!important;\nposition: absolute!important;\n}\n\n.fullwidthsrp .tag_spotlight .spotlight_container .result_container .padding_box{\n  margin-top: 10px;\n}\n\n.fullwidthsrp .listings.spotlight{\n  margin-top:20px!important;\n}\n\n.fullwidthsrp .spotlight .result {\nbackground: #FFF;\n}\n\n.fullwidthsrp .spotlight .button_phone {\ncolor: #027ac2;\n}\n\n.fullwidthsrp .spotlight_container .save_this_srp_listing{\ncolor: #027ac2;\nbottom: 4px;\n}\n\n\n/*more info btn*/\n.fullwidthsrp.moreinfo_btn .result .button_phone {\nleft: 84px!important;\n}"
    }
  },
  "allVariations": {
    "1005725552": {
      "code": "/*  _optimizely_evaluate=force  */\n    var soCookie = getCookie('faceoff');\n\n    if (soCookie=null || soCookie == undefined || soCookie=='') {\n      var cText = 'faceoff=true';\n      cText = cText + ';path=/';\n      document.cookie = cText;\n    }\n    \n    function getCookie(c_name) {\n      var i,x,y,ARRcookies=document.cookie.split(';');\n      for (i=0;i<ARRcookies.length;i++) {\n        x=ARRcookies[i].substr(0,ARRcookies[i].indexOf('='));\n        y=ARRcookies[i].substr(ARRcookies[i].indexOf('=')+1);\n        \n        if (x.indexOf(c_name)!=-1) {\n          return unescape(y);\n        }\n      }\n    }\n/*  _optimizely_evaluate=safe  */\n$('body').addClass('soFace');",
      "name": "v1_NewFace"
    },
    "1019615654": {
      "code": "/*  _optimizely_evaluate=force  */\n    var soCookie = getCookie('faceoff');\n\n    if (soCookie=null || soCookie == undefined || soCookie=='') {\n      var cText = 'faceoff=true';\n      cText = cText + ';path=/';\n      document.cookie = cText;\n    }\n    \n    function getCookie(c_name) {\n      var i,x,y,ARRcookies=document.cookie.split(';');\n      for (i=0;i<ARRcookies.length;i++) {\n        x=ARRcookies[i].substr(0,ARRcookies[i].indexOf('='));\n        y=ARRcookies[i].substr(ARRcookies[i].indexOf('=')+1);\n        \n        if (x.indexOf(c_name)!=-1) {\n          return unescape(y);\n        }\n      }\n    }\n/*  _optimizely_evaluate=safe  */\n$('body').addClass('soFace');\n$('.more_info_button').css('display','block');",
      "name": "v2_More Info"
    },
    "1021551624": {
      "name": "Original"
    },
    "1026870759": {
      "code": "$('body').addClass('fullwidthsrp');",
      "name": "v1_Wide Image"
    },
    "1029245302": {
      "name": "Original"
    },
    "1034651365": {
      "code": "$('body').addClass('fullwidthsrp');",
      "name": "v1_Wide Image"
    },
    "1038126963": {
      "code": "/*  _optimizely_evaluate=force  */\n    var soCookie = getCookie('faceoff');\n\n    if (soCookie=null || soCookie == undefined || soCookie=='') {\n      var cText = 'faceoff=true';\n      cText = cText + ';path=/';\n      document.cookie = cText;\n    }\n    \n    function getCookie(c_name) {\n      var i,x,y,ARRcookies=document.cookie.split(';');\n      for (i=0;i<ARRcookies.length;i++) {\n        x=ARRcookies[i].substr(0,ARRcookies[i].indexOf('='));\n        y=ARRcookies[i].substr(ARRcookies[i].indexOf('=')+1);\n        \n        if (x.indexOf(c_name)!=-1) {\n          return unescape(y);\n        }\n      }\n    }\n/*  _optimizely_evaluate=safe  */\n$('body').addClass('soFace');",
      "name": "v1_NewFace"
    },
    "1042656152": {
      "name": "Original"
    },
    "1043772062": {
      "code": "/*  _optimizely_evaluate=force  */\n    var soCookie = getCookie('faceoff');\n\n    if (soCookie=null || soCookie == undefined || soCookie=='') {\n      var cText = 'faceoff=true';\n      cText = cText + ';path=/';\n      document.cookie = cText;\n    }\n    \n    function getCookie(c_name) {\n      var i,x,y,ARRcookies=document.cookie.split(';');\n      for (i=0;i<ARRcookies.length;i++) {\n        x=ARRcookies[i].substr(0,ARRcookies[i].indexOf('='));\n        y=ARRcookies[i].substr(ARRcookies[i].indexOf('=')+1);\n        \n        if (x.indexOf(c_name)!=-1) {\n          return unescape(y);\n        }\n      }\n    }\n/*  _optimizely_evaluate=safe  */\n$('body').addClass('soFace');\n$('body').addClass('moreinfo_btn');\n$('.more_info_button').css('display','block');",
      "name": "v2_More Info"
    },
    "1045273192": {
      "name": "Original"
    }
  },
  "data": {
    "experiments": {
      "1006191833": {
        "code": "window.globalRun = window.globalRun || false;\nif (!window.globalRun) {\n  window.globalRun=true;\n  \n  var mSite = 'm.AG';\n  window._activeExperiments = [];\n  \n  if (window.optimizely.data.state.activeExperiments && window.optimizely.data.state.activeExperiments.length) {\n    window._activeExperiments = window.optimizely.data.state.activeExperiments;\n    \n    var mCnt = window._activeExperiments.length;\n    var mTest = '';\n    var mVars = '';\n    var mExp = '';\n    var tCount = 0;\n\n    var noTagArray = [\"^hotfix\",\"^preview\",\"^xxx\",\"^notag\"];\n    var regExMatch = noTagArray.join(\"|\");\n    \n    for (var i=0;i<(mCnt);i++) {\n      mExp = window._activeExperiments[i];\n      var curTest = window.optimizely.data.experiments[mExp].name;\n      var curVar = window.optimizely.data.state.variationNamesMap[mExp];\n\n      if (!curTest.match(regExMatch)) { //Eliminate Marked Experiments\n        if (tCount>0) {\n          mTest = mTest + \" : \";\n          mVars = mVars + \" : \";\n        }\n        mTest = mTest + curTest;\n        mVars = mVars + curVar;\n        tCount += 1;\n      }\n    }    \n    //Data Warehouse Meta Tags        \n    mt = $('meta[name=\"WH.ssVariationGroupName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssVariationGroupName\" />').prependTo('head');\n    mt.attr('content', mVars); \n    \n    mt = $('meta[name=\"WH.ssTestName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssTestName\" />').prependTo('head'); \n    mt.attr('content', mTest); \n    \n    var mt = $('meta[name=\"WH.ssSiteName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssSiteName\" />').prependTo('head'); \n    mt.attr('content', mSite); \n  }\n  window._mvtBindings = {\n    \n    getMetaAttr: function(name){ \n      if (name) {    \n        var selector = 'meta[name=\"' + name + '\"]'; \n        var meta = $(selector);\n        if (meta[0]) {\n          var content = meta.attr('content');\n          if (content) {\n            return content;\n          } else {\n            return undefined;\n          }\n        }\n      }\n    },\n    \n    pushTrack: function(tTrack){\n    window.optimizely.push(['trackEvent', tTrack]);\n    }\n\n  };\n\n   $(document).ready(function() {\n    window.optimizely = window.optimizely || [];\n    window.$ = window.$ || $;\n\n    window._sPage = window._mvtBindings.getMetaAttr('WH.cg');\n    // Binding clicks for mvt\n    var tTrack = 'view_' + window._sPage;\n    window._mvtBindings.pushTrack(tTrack);\n\n    window.$('body').ajaxComplete(function(event,xhr,options) {\n      \n      var ajURL = options.url;\n      var rxURL = new RegExp('^\\/v\\\\d\\/leads\\/new');  //Popup Lead Form\n         \n      if (rxURL.test(ajURL)) {\n        window.optimizely.push([\"activate\"]);\n        window._mvtBindings.pushTrack('lead_popup_any');\n      }\n      else {\n        rxURL = new RegExp('^\\/v\\\\d\\/leads\\/ajax\\.js'); //Lead Service Response\n        if (rxURL.test(ajURL)) {\n          window._mvtBindings.pushTrack('lead_submit');\n          if (xhr.status==200) {\n            window._mvtBindings.pushTrack('lead_confirmed');\n          }\n          else if (xhr.status==422) {\n            window._mvtBindings.pushTrack('lead_failed');\n          }\n        }\n      }\n    });\n\n    //Set Goals event handlers for Dynamic Content\n    var uA = navigator.userAgent.toLowerCase(),\n    eventType = \"mousedown\";\n\n    if (uA.match(\"iphone|ipad|ipod\")) {\n    eventType = \"touchstart\";\n    }\n    $(\".lead_submit input\").live(eventType, function() {\n      window.optimizely.push([\"trackEvent\", \"leads:_submit_-_all\"]);\n    });\n  });\n}",
        "name": "FaceOff_Theme",
        "manual": true,
        "section_ids": [],
        "variation_ids": [
          "1021551624",
          "1005725552",
          "1019615654"
        ]
      },
      "1026110803": {
        "code": "window.globalRun = window.globalRun || false;\nif (!window.globalRun) {\n  window.globalRun=true;\n  \n  var mSite = 'm.AG';\n  window._activeExperiments = [];\n  \n  if (window.optimizely.data.state.activeExperiments && window.optimizely.data.state.activeExperiments.length) {\n    window._activeExperiments = window.optimizely.data.state.activeExperiments;\n    \n    var mCnt = window._activeExperiments.length;\n    var mTest = '';\n    var mVars = '';\n    var mExp = '';\n    var tCount = 0;\n\n    var noTagArray = [\"^hotfix\",\"^preview\",\"^xxx\",\"^notag\"];\n    var regExMatch = noTagArray.join(\"|\");\n    \n    for (var i=0;i<(mCnt);i++) {\n      mExp = window._activeExperiments[i];\n      var curTest = window.optimizely.data.experiments[mExp].name;\n      var curVar = window.optimizely.data.state.variationNamesMap[mExp];\n\n      if (!curTest.match(regExMatch)) { //Eliminate Marked Experiments\n        if (tCount>0) {\n          mTest = mTest + \" : \";\n          mVars = mVars + \" : \";\n        }\n        mTest = mTest + curTest;\n        mVars = mVars + curVar;\n        tCount += 1;\n      }\n    }    \n    //Data Warehouse Meta Tags        \n    mt = $('meta[name=\"WH.ssVariationGroupName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssVariationGroupName\" />').prependTo('head');\n    mt.attr('content', mVars); \n    \n    mt = $('meta[name=\"WH.ssTestName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssTestName\" />').prependTo('head'); \n    mt.attr('content', mTest); \n    \n    var mt = $('meta[name=\"WH.ssSiteName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssSiteName\" />').prependTo('head'); \n    mt.attr('content', mSite); \n  }\n  window._mvtBindings = {\n    \n    getMetaAttr: function(name){ \n      if (name) {    \n        var selector = 'meta[name=\"' + name + '\"]'; \n        var meta = $(selector);\n        if (meta[0]) {\n          var content = meta.attr('content');\n          if (content) {\n            return content;\n          } else {\n            return undefined;\n          }\n        }\n      }\n    },\n    \n    pushTrack: function(tTrack){\n    window.optimizely.push(['trackEvent', tTrack]);\n    }\n\n  };\n\n   $(document).ready(function() {\n    window.optimizely = window.optimizely || [];\n    window.$ = window.$ || $;\n\n    window._sPage = window._mvtBindings.getMetaAttr('WH.cg');\n    // Binding clicks for mvt\n    var tTrack = 'view_' + window._sPage;\n    window._mvtBindings.pushTrack(tTrack);\n\n    window.$('body').ajaxComplete(function(event,xhr,options) {\n      \n      var ajURL = options.url;\n      var rxURL = new RegExp('^\\/v\\\\d\\/leads\\/new');  //Popup Lead Form\n         \n      if (rxURL.test(ajURL)) {\n        window.optimizely.push([\"activate\"]);\n        window._mvtBindings.pushTrack('lead_popup_any');\n      }\n      else {\n        rxURL = new RegExp('^\\/v\\\\d\\/leads\\/ajax\\.js'); //Lead Service Response\n        if (rxURL.test(ajURL)) {\n          window._mvtBindings.pushTrack('lead_submit');\n          if (xhr.status==200) {\n            window._mvtBindings.pushTrack('lead_confirmed');\n          }\n          else if (xhr.status==422) {\n            window._mvtBindings.pushTrack('lead_failed');\n          }\n        }\n      }\n    });\n\n    //Set Goals event handlers for Dynamic Content\n    var uA = navigator.userAgent.toLowerCase(),\n    eventType = \"mousedown\";\n\n    if (uA.match(\"iphone|ipad|ipod\")) {\n    eventType = \"touchstart\";\n    }\n    $(\".lead_submit input\").live(eventType, function() {\n      window.optimizely.push([\"trackEvent\", \"leads:_submit_-_all\"]);\n    });\n  });\n}",
        "name": "preview_srp_full_width_image",
        "manual": true,
        "section_ids": [],
        "variation_ids": [
          "1029245302",
          "1026870759"
        ]
      },
      "1034813331": {
        "code": "window.globalRun = window.globalRun || false;\nif (!window.globalRun) {\n  window.globalRun=true;\n  \n  var mSite = 'm.AG';\n  window._activeExperiments = [];\n  \n  if (window.optimizely.data.state.activeExperiments && window.optimizely.data.state.activeExperiments.length) {\n    window._activeExperiments = window.optimizely.data.state.activeExperiments;\n    \n    var mCnt = window._activeExperiments.length;\n    var mTest = '';\n    var mVars = '';\n    var mExp = '';\n    var tCount = 0;\n\n    var noTagArray = [\"^hotfix\",\"^preview\",\"^xxx\",\"^notag\"];\n    var regExMatch = noTagArray.join(\"|\");\n    \n    for (var i=0;i<(mCnt);i++) {\n      mExp = window._activeExperiments[i];\n      var curTest = window.optimizely.data.experiments[mExp].name;\n      var curVar = window.optimizely.data.state.variationNamesMap[mExp];\n\n      if (!curTest.match(regExMatch)) { //Eliminate Marked Experiments\n        if (tCount>0) {\n          mTest = mTest + \" : \";\n          mVars = mVars + \" : \";\n        }\n        mTest = mTest + curTest;\n        mVars = mVars + curVar;\n        tCount += 1;\n      }\n    }    \n    //Data Warehouse Meta Tags        \n    mt = $('meta[name=\"WH.ssVariationGroupName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssVariationGroupName\" />').prependTo('head');\n    mt.attr('content', mVars); \n    \n    mt = $('meta[name=\"WH.ssTestName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssTestName\" />').prependTo('head'); \n    mt.attr('content', mTest); \n    \n    var mt = $('meta[name=\"WH.ssSiteName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssSiteName\" />').prependTo('head'); \n    mt.attr('content', mSite); \n  }\n  window._mvtBindings = {\n    \n    getMetaAttr: function(name){ \n      if (name) {    \n        var selector = 'meta[name=\"' + name + '\"]'; \n        var meta = $(selector);\n        if (meta[0]) {\n          var content = meta.attr('content');\n          if (content) {\n            return content;\n          } else {\n            return undefined;\n          }\n        }\n      }\n    },\n    \n    pushTrack: function(tTrack){\n    window.optimizely.push(['trackEvent', tTrack]);\n    }\n\n  };\n\n   $(document).ready(function() {\n    window.optimizely = window.optimizely || [];\n    window.$ = window.$ || $;\n\n    window._sPage = window._mvtBindings.getMetaAttr('WH.cg');\n    // Binding clicks for mvt\n    var tTrack = 'view_' + window._sPage;\n    window._mvtBindings.pushTrack(tTrack);\n\n    window.$('body').ajaxComplete(function(event,xhr,options) {\n      \n      var ajURL = options.url;\n      var rxURL = new RegExp('^\\/v\\\\d\\/leads\\/new');  //Popup Lead Form\n         \n      if (rxURL.test(ajURL)) {\n        window.optimizely.push([\"activate\"]);\n        window._mvtBindings.pushTrack('lead_popup_any');\n      }\n      else {\n        rxURL = new RegExp('^\\/v\\\\d\\/leads\\/ajax\\.js'); //Lead Service Response\n        if (rxURL.test(ajURL)) {\n          window._mvtBindings.pushTrack('lead_submit');\n          if (xhr.status==200) {\n            window._mvtBindings.pushTrack('lead_confirmed');\n          }\n          else if (xhr.status==422) {\n            window._mvtBindings.pushTrack('lead_failed');\n          }\n        }\n      }\n    });\n\n    //Set Goals event handlers for Dynamic Content\n    var uA = navigator.userAgent.toLowerCase(),\n    eventType = \"mousedown\";\n\n    if (uA.match(\"iphone|ipad|ipod\")) {\n    eventType = \"touchstart\";\n    }\n    $(\".lead_submit input\").live(eventType, function() {\n      window.optimizely.push([\"trackEvent\", \"leads:_submit_-_all\"]);\n    });\n  });\n}",
        "name": "FaceOff_Theme (local)",
        "manual": true,
        "section_ids": [],
        "variation_ids": [
          "1042656152",
          "1038126963",
          "1043772062"
        ]
      },
      "1037504207": {
        "code": "window.globalRun = window.globalRun || false;\nif (!window.globalRun) {\n  window.globalRun=true;\n  \n  var mSite = 'm.AG';\n  window._activeExperiments = [];\n  \n  if (window.optimizely.data.state.activeExperiments && window.optimizely.data.state.activeExperiments.length) {\n    window._activeExperiments = window.optimizely.data.state.activeExperiments;\n    \n    var mCnt = window._activeExperiments.length;\n    var mTest = '';\n    var mVars = '';\n    var mExp = '';\n    var tCount = 0;\n\n    var noTagArray = [\"^hotfix\",\"^preview\",\"^xxx\",\"^notag\"];\n    var regExMatch = noTagArray.join(\"|\");\n    \n    for (var i=0;i<(mCnt);i++) {\n      mExp = window._activeExperiments[i];\n      var curTest = window.optimizely.data.experiments[mExp].name;\n      var curVar = window.optimizely.data.state.variationNamesMap[mExp];\n\n      if (!curTest.match(regExMatch)) { //Eliminate Marked Experiments\n        if (tCount>0) {\n          mTest = mTest + \" : \";\n          mVars = mVars + \" : \";\n        }\n        mTest = mTest + curTest;\n        mVars = mVars + curVar;\n        tCount += 1;\n      }\n    }    \n    //Data Warehouse Meta Tags        \n    mt = $('meta[name=\"WH.ssVariationGroupName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssVariationGroupName\" />').prependTo('head');\n    mt.attr('content', mVars); \n    \n    mt = $('meta[name=\"WH.ssTestName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssTestName\" />').prependTo('head'); \n    mt.attr('content', mTest); \n    \n    var mt = $('meta[name=\"WH.ssSiteName\"]'); \n    mt = (mt && mt.length) ? mt : $('<meta name=\"WH.ssSiteName\" />').prependTo('head'); \n    mt.attr('content', mSite); \n  }\n  window._mvtBindings = {\n    \n    getMetaAttr: function(name){ \n      if (name) {    \n        var selector = 'meta[name=\"' + name + '\"]'; \n        var meta = $(selector);\n        if (meta[0]) {\n          var content = meta.attr('content');\n          if (content) {\n            return content;\n          } else {\n            return undefined;\n          }\n        }\n      }\n    },\n    \n    pushTrack: function(tTrack){\n    window.optimizely.push(['trackEvent', tTrack]);\n    }\n\n  };\n\n   $(document).ready(function() {\n    window.optimizely = window.optimizely || [];\n    window.$ = window.$ || $;\n\n    window._sPage = window._mvtBindings.getMetaAttr('WH.cg');\n    // Binding clicks for mvt\n    var tTrack = 'view_' + window._sPage;\n    window._mvtBindings.pushTrack(tTrack);\n\n    window.$('body').ajaxComplete(function(event,xhr,options) {\n      \n      var ajURL = options.url;\n      var rxURL = new RegExp('^\\/v\\\\d\\/leads\\/new');  //Popup Lead Form\n         \n      if (rxURL.test(ajURL)) {\n        window.optimizely.push([\"activate\"]);\n        window._mvtBindings.pushTrack('lead_popup_any');\n      }\n      else {\n        rxURL = new RegExp('^\\/v\\\\d\\/leads\\/ajax\\.js'); //Lead Service Response\n        if (rxURL.test(ajURL)) {\n          window._mvtBindings.pushTrack('lead_submit');\n          if (xhr.status==200) {\n            window._mvtBindings.pushTrack('lead_confirmed');\n          }\n          else if (xhr.status==422) {\n            window._mvtBindings.pushTrack('lead_failed');\n          }\n        }\n      }\n    });\n\n    //Set Goals event handlers for Dynamic Content\n    var uA = navigator.userAgent.toLowerCase(),\n    eventType = \"mousedown\";\n\n    if (uA.match(\"iphone|ipad|ipod\")) {\n    eventType = \"touchstart\";\n    }\n    $(\".lead_submit input\").live(eventType, function() {\n      window.optimizely.push([\"trackEvent\", \"leads:_submit_-_all\"]);\n    });\n  });\n}",
        "name": "srp_full_width_image (local)",
        "manual": true,
        "section_ids": [],
        "variation_ids": [
          "1045273192",
          "1034651365"
        ]
      }
    },
    "sections": {},
    "segments": {
      "167052672": {
        "name": "Mobile Visitors"
      },
      "167074780": {
        "name": "Browser"
      },
      "167423656": {
        "name": "Campaign"
      },
      "167469136": {
        "name": "Source Type"
      },
      "167602629": {
        "name": "View: SRP"
      },
      "167856837": {
        "name": "View: Details"
      },
      "167946189": {
        "name": "Device: iPhone"
      },
      "168707437": {
        "name": "Device: Blackberry"
      },
      "169030895": {
        "name": "Device: Android"
      },
      "169163319": {
        "name": "Mobile Device"
      },
      "169286988": {
        "name": "Browser: Safari (non Mobile)"
      },
      "280483044": {
        "name": "Browser Details"
      }
    },
    "state": {
      "activeExperiments": [
        "1034813331",
        "1037504207"
      ],
      "variationIdsMap": {
        "1034813331": [
          "1038126963"
        ],
        "1037504207": [
          "1045273192"
        ]
      },
      "variationMap": {
        "1034813331": 1,
        "1037504207": 0
      },
      "variationNamesMap": {
        "1034813331": "v1_NewFace",
        "1037504207": "Original"
      }
    },
    "variations": {
      "1005725552": {
        "name": "v1_NewFace",
        "code": "/*  _optimizely_evaluate=force  */\n    var soCookie = getCookie('faceoff');\n\n    if (soCookie=null || soCookie == undefined || soCookie=='') {\n      var cText = 'faceoff=true';\n      cText = cText + ';path=/';\n      document.cookie = cText;\n    }\n    \n    function getCookie(c_name) {\n      var i,x,y,ARRcookies=document.cookie.split(';');\n      for (i=0;i<ARRcookies.length;i++) {\n        x=ARRcookies[i].substr(0,ARRcookies[i].indexOf('='));\n        y=ARRcookies[i].substr(ARRcookies[i].indexOf('=')+1);\n        \n        if (x.indexOf(c_name)!=-1) {\n          return unescape(y);\n        }\n      }\n    }\n/*  _optimizely_evaluate=safe  */\n$('body').addClass('soFace');"
      },
      "1019615654": {
        "name": "v2_More Info",
        "code": "/*  _optimizely_evaluate=force  */\n    var soCookie = getCookie('faceoff');\n\n    if (soCookie=null || soCookie == undefined || soCookie=='') {\n      var cText = 'faceoff=true';\n      cText = cText + ';path=/';\n      document.cookie = cText;\n    }\n    \n    function getCookie(c_name) {\n      var i,x,y,ARRcookies=document.cookie.split(';');\n      for (i=0;i<ARRcookies.length;i++) {\n        x=ARRcookies[i].substr(0,ARRcookies[i].indexOf('='));\n        y=ARRcookies[i].substr(ARRcookies[i].indexOf('=')+1);\n        \n        if (x.indexOf(c_name)!=-1) {\n          return unescape(y);\n        }\n      }\n    }\n/*  _optimizely_evaluate=safe  */\n$('body').addClass('soFace');\n$('.more_info_button').css('display','block');"
      },
      "1021551624": {
        "name": "Original",
        "code": ""
      },
      "1026870759": {
        "name": "v1_Wide Image",
        "code": "$('body').addClass('fullwidthsrp');"
      },
      "1029245302": {
        "name": "Original",
        "code": ""
      },
      "1034651365": {
        "name": "v1_Wide Image",
        "code": "$('body').addClass('fullwidthsrp');"
      },
      "1038126963": {
        "name": "v1_NewFace",
        "code": "/*  _optimizely_evaluate=force  */\n    var soCookie = getCookie('faceoff');\n\n    if (soCookie=null || soCookie == undefined || soCookie=='') {\n      var cText = 'faceoff=true';\n      cText = cText + ';path=/';\n      document.cookie = cText;\n    }\n    \n    function getCookie(c_name) {\n      var i,x,y,ARRcookies=document.cookie.split(';');\n      for (i=0;i<ARRcookies.length;i++) {\n        x=ARRcookies[i].substr(0,ARRcookies[i].indexOf('='));\n        y=ARRcookies[i].substr(ARRcookies[i].indexOf('=')+1);\n        \n        if (x.indexOf(c_name)!=-1) {\n          return unescape(y);\n        }\n      }\n    }\n/*  _optimizely_evaluate=safe  */\n$('body').addClass('soFace');"
      },
      "1042656152": {
        "name": "Original",
        "code": ""
      },
      "1043772062": {
        "name": "v2_More Info",
        "code": "/*  _optimizely_evaluate=force  */\n    var soCookie = getCookie('faceoff');\n\n    if (soCookie=null || soCookie == undefined || soCookie=='') {\n      var cText = 'faceoff=true';\n      cText = cText + ';path=/';\n      document.cookie = cText;\n    }\n    \n    function getCookie(c_name) {\n      var i,x,y,ARRcookies=document.cookie.split(';');\n      for (i=0;i<ARRcookies.length;i++) {\n        x=ARRcookies[i].substr(0,ARRcookies[i].indexOf('='));\n        y=ARRcookies[i].substr(ARRcookies[i].indexOf('=')+1);\n        \n        if (x.indexOf(c_name)!=-1) {\n          return unescape(y);\n        }\n      }\n    }\n/*  _optimizely_evaluate=safe  */\n$('body').addClass('soFace');\n$('body').addClass('moreinfo_btn');\n$('.more_info_button').css('display','block');"
      },
      "1045273192": {
        "name": "Original",
        "code": ""
      }
    },
    "visitor": {
      "browser": "",
      "location": {
        "city": "",
        "continent": "",
        "country": "",
        "region": ""
      },
      "ip": "",
      "params": {
        "": ""
      },
      "referrer": "http://local.m.apartmentguide.com/?user_search=Philadelphia%2C+PA&btnSearch=Go",
      "segments": {
        "167052672": "true",
        "167074780": "unknown",
        "167423656": "none",
        "167469136": "direct",
        "167602629": "true",
        "167946189": "true",
        "169163319": "true"
      },
      "mobile": true,
      "os": "Mac",
      "dimensions": {},
      "audiences": {}
    }
  },
  "revision": 1567,
  "variationIdsMap": {
    "1034813331": [
      "1038126963"
    ],
    "1037504207": [
      "1045273192"
    ]
  },
  "variation_map": {
    "1034813331": 1,
    "1037504207": 0
  },
  "variationMap": {
    "1034813331": 1,
    "1037504207": 0
  },
  "variationNamesMap": {
    "1034813331": "v1_NewFace",
    "1037504207": "Original"
  },
  "iapi": {
    "geoTimedOut": true
  },
  "__groupA": "1034813331"
}
