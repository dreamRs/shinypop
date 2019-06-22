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
