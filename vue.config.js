module.exports = {
    configureWebpack: {
      devServer: {
        proxy: 'http://192.168.178.52:5000/'
      }
    }
  };