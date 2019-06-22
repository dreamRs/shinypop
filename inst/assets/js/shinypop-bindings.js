/*!
 * Copyright (c) 2019 dreamRs
 *
 * shinypop, JavaScript bindings use
 * custom notifications
 * https://github.com/dreamRs/shinylnoty
 *
 * @version 0.1.0
 */



// noty
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

