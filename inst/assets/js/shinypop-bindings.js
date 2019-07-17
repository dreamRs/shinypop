/*!
 * Copyright (c) 2019 dreamRs
 *
 * shinypop, JavaScript bindings use
 * custom notifications
 * https://github.com/dreamRs/shinylnoty
 *
 * @version 0.1.0
 */


$(function() {

  // noty
  var configNoty = document.querySelectorAll('script[data-for="noty-config"]');
  if (configNoty.length > 0) {
    configNoty = JSON.parse(configNoty[0].innerHTML);
    if (configNoty.hasOwnProperty('maxVisible')) {
      Noty.setMaxVisible(configNoty.maxVisible);
    }
  }
  Shiny.addCustomMessageHandler("shinypop-noty", function(data) {
    new Noty(data).show();
  });

  Shiny.addCustomMessageHandler("shinypop-noty-close", function(data) {
    Noty.closeAll();
  });



  // notie
  Shiny.addCustomMessageHandler("shinypop-notie", function(data) {
    notie.alert(data);
  });

  Shiny.addCustomMessageHandler("shinypop-notie-close", function(data) {
    notie.hideAlerts();
  });

  Shiny.addCustomMessageHandler("shinypop-notie-confirm", function(data) {
    Shiny.setInputValue(data.id, null);
    data.config.cancelCallback = function () {
       Shiny.setInputValue(data.id, false);
    };
    data.config.submitCallback = function () {
       Shiny.setInputValue(data.id, true);
    };
    notie.confirm(data.config);
  });



  // push
  Shiny.addCustomMessageHandler("shinypop-push", function(data) {
    Push.create(data.title, data.config);
  });



  // notiflix

  if (window.Notiflix) {

    var configNotify = document.querySelectorAll('script[data-for="notiflix-notify-config"]');
    if (configNotify.length > 0) {
      configNotify = JSON.parse(configNotify[0].innerHTML);
    } else {
      configNotify = {};
    }
    Notiflix.Notify.Init(configNotify);
    Shiny.addCustomMessageHandler("shinypop-notiflix-notify-success", function(data) {
      Notiflix.Notify.Success(data.text);
    });
    Shiny.addCustomMessageHandler("shinypop-notiflix-notify-error", function(data) {
      Notiflix.Notify.Failure(data.text);
    });
    Shiny.addCustomMessageHandler("shinypop-notiflix-notify-info", function(data) {
      Notiflix.Notify.Info(data.text);
    });
    Shiny.addCustomMessageHandler("shinypop-notiflix-notify-warning", function(data) {
      Notiflix.Notify.Warning(data.text);
    });


    var configReport = document.querySelectorAll('script[data-for="notiflix-report-config"]');
    if (configReport.length > 0) {
      configReport = JSON.parse(configReport[0].innerHTML);
    } else {
      configReport = {};
    }
    Notiflix.Report.Init(configReport);
    Shiny.addCustomMessageHandler("shinypop-notiflix-report-success", function(data) {
      Notiflix.Report.Success(data.title, data.message, data.button);
    });
    Shiny.addCustomMessageHandler("shinypop-notiflix-report-error", function(data) {
      Notiflix.Report.Failure(data.title, data.message, data.button);
    });
    Shiny.addCustomMessageHandler("shinypop-notiflix-report-info", function(data) {
      Notiflix.Report.Info(data.title, data.message, data.button);
    });
    Shiny.addCustomMessageHandler("shinypop-notiflix-report-warning", function(data) {
      Notiflix.Report.Warning(data.title, data.message, data.button);
    });


    var configConfirm = document.querySelectorAll('script[data-for="notiflix-confirm-config"]');
    if (configConfirm.length > 0) {
      configConfirm = JSON.parse(configConfirm[0].innerHTML);
    } else {
      configConfirm = {};
    }
    Notiflix.Confirm.Init(configConfirm);
    Shiny.addCustomMessageHandler("shinypop-notiflix-confirm", function(data) {
      Shiny.setInputValue(data.id, null);
      Notiflix.Confirm.Show(
        data.title,
        data.message,
        data.button_ok,
        data.button_cancel,
        function() {
          Shiny.setInputValue(data.id, true);
        }
      );
    });

  }
  
  
  // favico
  Shiny.addCustomMessageHandler("shinypop-favico", function(data) {
    var favicon = new Favico(data.config);
    favicon.badge(data.value);
  });
  
  
  
  // vex
  var configVex = document.querySelectorAll('script[data-for="vex-config"]');
  if (configVex.length > 0) {
    configVex = JSON.parse(configVex[0].innerHTML);
    if (configVex.hasOwnProperty('theme')) {
      vex.defaultOptions.className = 'vex-theme-' + configVex.theme;
    }
  }
  Shiny.addCustomMessageHandler("shinypop-vex-alert", function(data) {
    console.log("yep");
    vex.dialog.alert(data);
  });


});
