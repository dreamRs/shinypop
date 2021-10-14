/*!
 * Copyright (c) 2019 dreamRs
 *
 * shinypop, JavaScript bindings to use
 * custom notifications in Shiny apps
 * https://github.com/dreamRs/shinypop
 *
 * @version 0.1.1
 */
 
 /*jshint
  browser:true,
  devel: false,
  jquery: true
*/
/*global Shiny, Noty, notie, Notiflix, vex, Push, Favico */

$(function() {
  // noty
  var configNoty = document.querySelectorAll('script[data-for="noty-config"]');
  if (configNoty.length > 0) {
    configNoty = JSON.parse(configNoty[0].innerHTML);
    if (configNoty.hasOwnProperty("maxVisible")) {
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
    data.config.cancelCallback = function() {
      Shiny.setInputValue(data.id, false);
    };
    data.config.submitCallback = function() {
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
    var configNotify = document.querySelectorAll(
      'script[data-for="notiflix-notify-config"]'
    );
    if (configNotify.length > 0) {
      configNotify = JSON.parse(configNotify[0].innerHTML);
    } else {
      configNotify = {};
    }
    Notiflix.Notify.init(configNotify);
    Shiny.addCustomMessageHandler("shinypop-notiflix-notify-success", function(
      data
    ) {
      Notiflix.Notify.success(data.text);
    });
    Shiny.addCustomMessageHandler("shinypop-notiflix-notify-error", function(
      data
    ) {
      Notiflix.Notify.failure(data.text);
    });
    Shiny.addCustomMessageHandler("shinypop-notiflix-notify-info", function(
      data
    ) {
      Notiflix.Notify.info(data.text);
    });
    Shiny.addCustomMessageHandler("shinypop-notiflix-notify-warning", function(
      data
    ) {
      Notiflix.Notify.warning(data.text);
    });

    var configReport = document.querySelectorAll(
      'script[data-for="notiflix-report-config"]'
    );
    if (configReport.length > 0) {
      configReport = JSON.parse(configReport[0].innerHTML);
    } else {
      configReport = {};
    }
    Notiflix.Report.init(configReport);
    Shiny.addCustomMessageHandler("shinypop-notiflix-report-success", function(
      data
    ) {
      Notiflix.Report.success(data.title, data.message, data.button);
    });
    Shiny.addCustomMessageHandler("shinypop-notiflix-report-error", function(
      data
    ) {
      Notiflix.Report.failure(data.title, data.message, data.button);
    });
    Shiny.addCustomMessageHandler("shinypop-notiflix-report-info", function(
      data
    ) {
      Notiflix.Report.info(data.title, data.message, data.button);
    });
    Shiny.addCustomMessageHandler("shinypop-notiflix-report-warning", function(
      data
    ) {
      Notiflix.Report.warning(data.title, data.message, data.button);
    });

    var configConfirm = document.querySelectorAll(
      'script[data-for="notiflix-confirm-config"]'
    );
    if (configConfirm.length > 0) {
      configConfirm = JSON.parse(configConfirm[0].innerHTML);
    } else {
      configConfirm = {};
    }
    Notiflix.Confirm.init(configConfirm);
    Shiny.addCustomMessageHandler("shinypop-notiflix-confirm", function(data) {
      Shiny.setInputValue(data.id, null);
      Notiflix.Confirm.show(
        data.title,
        data.message,
        data.button_ok,
        data.button_cancel,
        function() {
          Shiny.setInputValue(data.id, true);
        },
        function() {
          Shiny.setInputValue(data.id, false);
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
    if (configVex.hasOwnProperty("theme")) {
      vex.defaultOptions.className = "vex-theme-" + configVex.theme;
    }
  }
  Shiny.addCustomMessageHandler("shinypop-vex-alert", function(data) {
    vex.dialog.buttons.YES.text = data.labelButton;
    vex.dialog.alert(data.config);
  });

  Shiny.addCustomMessageHandler("shinypop-vex-confirm", function(data) {
    Shiny.setInputValue(data.inputId, null);
    vex.dialog.buttons.YES.text = data.yes_text;
    vex.dialog.buttons.NO.text = data.no_text;
    data.config.callback = function(value) {
      if (value) {
        Shiny.setInputValue(data.inputId, true);
      } else {
        Shiny.setInputValue(data.inputId, false);
      }
    };
    vex.dialog.confirm(data.config);
  });
  
  Shiny.addCustomMessageHandler("shinypop-vex-close", function(data) {
    vex.closeAll();
  });
});

