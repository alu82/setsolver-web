module.exports = {
    configureWebpack: {
      devServer: {
        proxy: 'http://192.168.178.49:5000/'
      }
    }
  };