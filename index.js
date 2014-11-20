module.exports = {
  name: 'ella-star-rating',

  included: function(app, parentAddon) {
    var target = (parentAddon || app);
    app.import('vendor/ella-star-rating/base.css');
    // Now you can modify the app / parentAddon. For example, if you wanted
    // to include a custom preprocessor, you could add it to the target's
    // registry:
    //
    // target.registry.add('js', require('ember-cli-coffeescript'));
  }
};
